/* ─────────────────────────────────────────────────────────────────────────
   Two-stage bypass minigame
     Stage 1: tap the requested app(s) on the Autel tablet.
     Stage 2: rewire — drag each wire to its matching colour (Among Us style).
   Only completing BOTH stages posts success back to Lua (which unlocks the car).
   ───────────────────────────────────────────────────────────────────────── */

const RESOURCE = (() => {
    try { return GetParentResourceName(); } catch (e) { return 'car_jacking'; }
})();

const NS = 'http://www.w3.org/2000/svg';

/* ── app icons (stage 1) ─────────────────────────────────────────────────── */
const ICONS = {
    diagnostics: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 13l1.5-4.5A2 2 0 0 1 8.4 7h7.2a2 2 0 0 1 1.9 1.5L19 13"/><path d="M4 13h16v4a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-1H7v1a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1z"/><circle cx="7.5" cy="15.5" r="1"/><circle cx="16.5" cy="15.5" r="1"/></svg>`,
    service: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="7" r="3"/><path d="M3.5 19a5.5 5.5 0 0 1 11 0"/><path d="M16.5 8.5l3 3M18 7l3 3-2 2-3-3z"/></svg>`,
    data_manager: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="6" y="6" width="13" height="11" rx="2"/><path d="M9 13l2-2 2 2 2.5-3 2.5 4"/><circle cx="10" cy="9.5" r="1"/><path d="M3.5 9v9a2 2 0 0 0 2 2h11"/></svg>`,
    settings: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M12 3v2M12 19v2M3 12h2M19 12h2M5.6 5.6l1.4 1.4M17 17l1.4 1.4M18.4 5.6L17 7M7 17l-1.4 1.4"/></svg>`,
    battery_test: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="8" width="15" height="9" rx="2"/><path d="M18 11h2v3h-2"/><path d="M6 6V4M14 6V4"/><path d="M11 10l-2 3h3l-2 3"/></svg>`,
    vci_manager: `VCi`,
    remote_desktop: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="12" rx="2"/><path d="M8 20h8M12 16v4"/><path d="M8 10l-2 0M8 10l2-2M8 10l2 2"/><path d="M14 10h4"/></svg>`,
    update: `<svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M12 7v8M8.5 11.5L12 15l3.5-3.5"/></svg>`,
};

/* ── wire colours + symbols (stage 2) ────────────────────────────────────── */
const WIRE_DEFS = [
    { name: 'red',     color: '#d61f25', edge: '#6f0f13', symbol: 'triangle' },
    { name: 'blue',    color: '#2664e6', edge: '#13357d', symbol: 'x' },
    { name: 'yellow',  color: '#f4c020', edge: '#8a6c0c', symbol: 'ring' },
    { name: 'magenta', color: '#d63de6', edge: '#7d2186', symbol: 'star' },
    { name: 'green',   color: '#2bbf5a', edge: '#13662f', symbol: 'square' },
];
const SYMBOLS = {
    triangle: `<svg viewBox="0 0 24 24"><path d="M12 4 L21 20 L3 20 Z" fill="none" stroke="#fff" stroke-width="2.4" stroke-linejoin="round"/></svg>`,
    x:        `<svg viewBox="0 0 24 24"><path d="M6 6 L18 18 M18 6 L6 18" stroke="#fff" stroke-width="3" stroke-linecap="round"/></svg>`,
    ring:     `<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="7" fill="none" stroke="#fff" stroke-width="3"/></svg>`,
    star:     `<svg viewBox="0 0 24 24"><path d="M12 3 l2.6 6.1 6.6.5 -5 4.3 1.6 6.5 -5.8 -3.5 -5.8 3.5 1.6 -6.5 -5 -4.3 6.6 -.5 z" fill="#fff"/></svg>`,
    square:   `<svg viewBox="0 0 24 24"><rect x="6" y="6" width="12" height="12" fill="none" stroke="#fff" stroke-width="3"/></svg>`,
};

/* ── DOM ─────────────────────────────────────────────────────────────────── */
const root        = document.getElementById('root');
const stage       = document.querySelector('.stage');
const tabletView  = document.getElementById('tabletView');
const wireView    = document.getElementById('wireView');
const appsEl      = document.getElementById('apps');
const objectiveEl = document.getElementById('objective');
const stepEl      = document.getElementById('stepCounter');
const timerFill   = document.getElementById('timerFill');
const flashEl     = document.getElementById('flash');
const clockEl     = document.getElementById('clock');
const wireLeft    = document.getElementById('wireLeft');
const wireRight   = document.getElementById('wireRight');
const wireSvg     = document.getElementById('wireSvg');
const wireProg    = document.getElementById('wireProgress');
const wireBar     = document.getElementById('wireBar');
const wireTimer   = document.getElementById('wireTimerFill');

let cfg       = null;
let phase     = 'idle'; // idle | tablet | wires
let rafId     = null;

/* ── tablet (stage 1) ────────────────────────────────────────────────────── */
let sequence  = [];
let stepIndex = 0;
let appById   = {};

function buildApps(apps) {
    appsEl.innerHTML = '';
    appById = {};
    apps.forEach((app) => {
        const tile = document.createElement('div');
        tile.className = 'app';
        tile.dataset.id = app.id;
        const icon = document.createElement('div');
        icon.className = 'app-icon t-' + app.id + (app.id === 'vci_manager' ? ' vci-text' : '');
        icon.innerHTML = ICONS[app.id] || '';
        const label = document.createElement('div');
        label.className = 'app-label';
        label.textContent = app.label;
        tile.appendChild(icon);
        tile.appendChild(label);
        tile.addEventListener('click', () => onTap(app.id, tile));
        appsEl.appendChild(tile);
        appById[app.id] = app;
    });
}

function startTablet() {
    phase = 'tablet';
    stepIndex = 0;
    sequence = [];
    const pool = cfg.apps;
    if (cfg.targetApp) {
        sequence.push(cfg.targetApp);
    } else {
        for (let i = 0; i < cfg.steps; i++) {
            sequence.push(pool[Math.floor(Math.random() * pool.length)].id);
        }
    }
    buildApps(pool);
    tabletView.classList.remove('hidden');
    wireView.classList.remove('active');
    nextStep();
}

function nextStep() {
    if (stepIndex >= sequence.length) return tabletDone();
    const target = appById[sequence[stepIndex]];
    objectiveEl.textContent = 'Open ' + target.label;
    stepEl.textContent = sequence.length > 1 ? (stepIndex + 1) + ' / ' + sequence.length : '';
    runTimer(cfg.time);
}

function onTap(id, tile) {
    if (phase !== 'tablet') return;
    if (id === sequence[stepIndex]) {
        tile.classList.add('correct');
        setTimeout(() => tile.classList.remove('correct'), 220);
        stepIndex++;
        if (stepIndex >= sequence.length) tabletDone();
        else nextStep();
    } else {
        tile.classList.add('wrong');
        setTimeout(() => tile.classList.remove('wrong'), 220);
        if (cfg.failOnWrong) finishAll(false);
        else { stage.classList.add('shake'); setTimeout(() => stage.classList.remove('shake'), 360); }
    }
}

function tabletDone() {
    cancelAnimationFrame(rafId);
    if (cfg.wire && cfg.wire.enabled && (cfg.wire.wires || 0) >= 2) {
        goToWires();
    } else {
        finishAll(true);
    }
}

/* per-step timer for the tablet */
function runTimer(ms) {
    cancelAnimationFrame(rafId);
    const deadline = performance.now() + ms;
    const tick = (now) => {
        const remaining = deadline - now;
        timerFill.style.transform = 'scaleX(' + Math.max(0, remaining / ms) + ')';
        if (remaining <= 0) return finishAll(false);
        rafId = requestAnimationFrame(tick);
    };
    rafId = requestAnimationFrame(tick);
}

/* ── wiring (stage 2) ────────────────────────────────────────────────────── */
let leftDefs = [], rightDefs = [];
let connected = 0;
let dragging = null;

function shuffle(a) {
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
}

function buildTerminal(def, idx, side) {
    const t = document.createElement('div');
    t.className = 'terminal ' + side;
    t.dataset.idx = idx;
    t.dataset.name = def.name;
    t.dataset.connected = '0';

    const badge = document.createElement('div');
    badge.className = 'badge';
    badge.style.background = def.color;
    badge.innerHTML = SYMBOLS[def.symbol] || '';

    const lead = document.createElement('div');
    lead.className = 'lead';
    lead.style.background = def.color;

    const coil = document.createElement('div');
    coil.className = 'coil';

    t.appendChild(badge);
    t.appendChild(lead);
    t.appendChild(coil);

    if (side === 'left') {
        t.addEventListener('mousedown', (e) => beginDrag(e, t));
    }
    return t;
}

function goToWires() {
    phase = 'wires';
    connected = 0;
    dragging = null;
    wireSvg.innerHTML = '';
    wireLeft.innerHTML = '';
    wireRight.innerHTML = '';

    const n = Math.max(2, Math.min(5, cfg.wire.wires || 4));
    leftDefs = WIRE_DEFS.slice(0, n);
    rightDefs = shuffle(leftDefs.slice());
    // avoid a trivially straight-across layout
    if (rightDefs.every((d, i) => d.name === leftDefs[i].name)) shuffle(rightDefs);

    leftDefs.forEach((d, i) => wireLeft.appendChild(buildTerminal(d, i, 'left')));
    rightDefs.forEach((d, i) => wireRight.appendChild(buildTerminal(d, i, 'right')));

    wireProg.textContent = '0 / ' + n;

    tabletView.classList.add('hidden');
    wireView.classList.add('active');

    if (cfg.wire.time && cfg.wire.time > 0) {
        wireBar.style.display = '';
        runWireTimer(cfg.wire.time);
    } else {
        wireBar.style.display = 'none';
    }
}

function runWireTimer(ms) {
    cancelAnimationFrame(rafId);
    const deadline = performance.now() + ms;
    const tick = (now) => {
        const remaining = deadline - now;
        wireTimer.style.transform = 'scaleX(' + Math.max(0, remaining / ms) + ')';
        if (remaining <= 0) return finishAll(false);
        rafId = requestAnimationFrame(tick);
    };
    rafId = requestAnimationFrame(tick);
}

function anchorOf(node, edge) {
    const r = node.getBoundingClientRect();
    const s = wireSvg.getBoundingClientRect();
    return {
        x: (edge === 'right' ? r.right : r.left) - s.left,
        y: r.top + r.height / 2 - s.top,
    };
}

function wirePath(x1, y1, x2, y2) {
    const dx = x2 - x1;
    const sag = Math.min(70, Math.abs(dx) * 0.22) + 18;
    const c1x = x1 + dx * 0.35, c1y = y1 + sag;
    const c2x = x1 + dx * 0.65, c2y = y2 + sag;
    return `M ${x1} ${y1} C ${c1x} ${c1y}, ${c2x} ${c2y}, ${x2} ${y2}`;
}

function makeWire(color, edge) {
    const g = document.createElementNS(NS, 'g');
    const outline = document.createElementNS(NS, 'path');
    const core = document.createElementNS(NS, 'path');
    outline.setAttribute('fill', 'none');
    outline.setAttribute('stroke', edge);
    outline.setAttribute('stroke-width', '12');
    outline.setAttribute('stroke-linecap', 'round');
    core.setAttribute('fill', 'none');
    core.setAttribute('stroke', color);
    core.setAttribute('stroke-width', '7');
    core.setAttribute('stroke-linecap', 'round');
    g.appendChild(outline);
    g.appendChild(core);
    wireSvg.appendChild(g);
    return { g, set(d) { outline.setAttribute('d', d); core.setAttribute('d', d); } };
}

function beginDrag(e, node) {
    if (phase !== 'wires' || node.dataset.connected === '1') return;
    e.preventDefault();
    const def = leftDefs[+node.dataset.idx];
    const start = anchorOf(node, 'right');
    dragging = { node, def, start, wire: makeWire(def.color, def.edge) };
    updateDrag(e);
}

function updateDrag(e) {
    if (!dragging) return;
    const s = wireSvg.getBoundingClientRect();
    dragging.wire.set(wirePath(dragging.start.x, dragging.start.y, e.clientX - s.left, e.clientY - s.top));
}

function endDrag(e) {
    if (!dragging) return;
    const el = document.elementFromPoint(e.clientX, e.clientY);
    const target = el && el.closest ? el.closest('.terminal.right') : null;

    if (target && target.dataset.connected !== '1' &&
        rightDefs[+target.dataset.idx].name === dragging.def.name) {
        const b = anchorOf(target, 'left');
        dragging.wire.set(wirePath(dragging.start.x, dragging.start.y, b.x, b.y));
        dragging.node.dataset.connected = '1';
        target.dataset.connected = '1';
        dragging.node.classList.add('done');
        target.classList.add('done');
        connected++;
        wireProg.textContent = connected + ' / ' + leftDefs.length;
        dragging = null;
        if (connected >= leftDefs.length) setTimeout(() => finishAll(true), 200);
        return;
    }

    dragging.wire.g.remove(); // missed / wrong colour
    dragging = null;
}

document.addEventListener('mousemove', updateDrag);
document.addEventListener('mouseup', endDrag);

/* ── shared finish / teardown ────────────────────────────────────────────── */
function finishAll(success) {
    if (phase === 'idle') return;
    phase = 'idle';
    cancelAnimationFrame(rafId);
    dragging = null;
    flashEl.classList.add(success ? 'good' : 'bad');
    setTimeout(() => {
        post('result', { success });
        teardown();
    }, success ? 320 : 420);
}

function teardown() {
    root.classList.remove('show');
    flashEl.classList.remove('good', 'bad');
    timerFill.style.transform = 'scaleX(1)';
    wireTimer.style.transform = 'scaleX(1)';
    tabletView.classList.remove('hidden');
    wireView.classList.remove('active');
    wireSvg.innerHTML = '';
}

function cancel() {
    if (phase === 'idle') return;
    phase = 'idle';
    cancelAnimationFrame(rafId);
    dragging = null;
    post('close', {});
    teardown();
}

/* ── NUI <-> Lua ─────────────────────────────────────────────────────────── */
function post(name, data) {
    fetch('https://' + RESOURCE + '/' + name, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(data || {}),
    }).catch(() => {});
}

window.addEventListener('message', (e) => {
    const msg = e.data || {};
    if (msg.action === 'open') {
        cfg = msg;
        root.classList.add('show');
        startTablet();
    }
});

document.addEventListener('keydown', (e) => { if (e.key === 'Escape') cancel(); });

setInterval(() => {
    const d = new Date();
    let h = d.getHours() % 12; if (h === 0) h = 12;
    clockEl.textContent = h + ':' + String(d.getMinutes()).padStart(2, '0');
}, 1000);
