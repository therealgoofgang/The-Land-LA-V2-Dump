/* =========================================================================
   BuBu Workshop — NUI app
   Listens for namespaced bubuCraft:* messages so it doesn't interfere
   with the shop UI's 'open'/'close' actions.
   ========================================================================= */

(function () {
    const IMG_BASE = 'https://cdn2.nullnetwork.ca/2adc0505f31cd560/inventory/';

    const RARITY_COLOR = {
        common:    'var(--bubu-r-common)',
        uncommon:  'var(--bubu-r-uncommon)',
        rare:      'var(--bubu-r-rare)',
        epic:      'var(--bubu-r-epic)',
        legendary: 'var(--bubu-r-legendary)',
        mythic:    'var(--bubu-r-mythic)',
    };

    const state = {
        recipes:  [],
        counts:   {},
        selected: 0,
        crafting: false,
    };

    const root       = document.getElementById('bubu-craft-root');
    const recipeList = document.getElementById('bubuRecipeList');
    const detail     = document.getElementById('bubuDetail');
    const closeBtn   = document.getElementById('bubuCloseBtn');
    const confetti   = document.getElementById('bubuConfetti');

    // ---------- helpers ----------
    const prettify = (key) =>
        key.replace(/_/g, ' ').replace(/\b\w/g, (m) => m.toUpperCase());

    const imgFor = (item) => `${IMG_BASE}${item}.png`;

    const canCraft = (recipe) =>
        recipe.ingredients.every(
            (ing) => (state.counts[ing.item] || 0) >= ing.count
        );

    // ---------- rendering ----------
    function renderRecipeList() {
        recipeList.innerHTML = '';
        state.recipes.forEach((r, i) => {
            const craftable = canCraft(r);
            const card = document.createElement('div');
            card.className =
                'bubu-recipe-card' +
                (i === state.selected ? ' active' : '') +
                (craftable ? ' craftable' : '');
            card.style.setProperty(
                '--rarity-color',
                RARITY_COLOR[r.rarity] || 'var(--bubu-r-common)'
            );
            card.innerHTML = `
                <div class="bubu-recipe-card__thumb" style="background-image: url('${imgFor(r.resultItem)}')"></div>
                <div class="bubu-recipe-card__info">
                    <div class="bubu-recipe-card__name">${r.name}</div>
                    <div class="bubu-recipe-card__rarity">${r.rarity}</div>
                </div>
                <div class="bubu-recipe-card__check" title="${craftable ? 'Ready!' : 'Missing items'}">
                    ${craftable ? '✓' : '✗'}
                </div>
            `;
            card.addEventListener('click', () => {
                state.selected = i;
                renderRecipeList();
                renderDetail();
            });
            recipeList.appendChild(card);
        });
    }

    function renderDetail() {
        const r = state.recipes[state.selected];
        if (!r) {
            detail.innerHTML = `<div class="bubu-empty-state">Pick a recipe ✿</div>`;
            return;
        }
        const rarityColor = RARITY_COLOR[r.rarity] || 'var(--bubu-r-common)';
        const craftable = canCraft(r);

        detail.style.setProperty('--rarity-color', rarityColor);

        const ingredientsHTML = r.ingredients
            .map((ing) => {
                const have = state.counts[ing.item] || 0;
                const ok = have >= ing.count;
                return `
                    <div class="bubu-ingredient ${ok ? 'ok' : ''}">
                        <div class="bubu-ingredient-thumb" style="background-image: url('${imgFor(ing.item)}')"></div>
                        <div class="bubu-ingredient-info">
                            <div class="bubu-ingredient-name">${prettify(ing.item)}</div>
                            <div class="bubu-ingredient-count">${have} / ${ing.count}</div>
                        </div>
                    </div>
                `;
            })
            .join('');

        detail.innerHTML = `
            <div class="bubu-detail-hero">
                <div class="bubu-detail-thumb" style="background-image: url('${imgFor(r.resultItem)}'); --rarity-color: ${rarityColor};"></div>
                <div class="bubu-detail-heading">
                    <div class="bubu-detail-name">${r.name}</div>
                    <span class="bubu-detail-rarity" style="background: ${rarityColor}; box-shadow: 0 4px 10px -2px ${rarityColor}; padding: 8px 20px; line-height: 1.4;">${r.rarity}</span>
                </div>
            </div>

            <div class="bubu-ingredients-label">You'll need</div>
            <div class="bubu-ingredients-grid">${ingredientsHTML}</div>

            <button class="bubu-craft-btn ${state.crafting ? 'crafting' : ''}" id="bubuCraftBtn" ${(!craftable || state.crafting) ? 'disabled' : ''}>
                ${state.crafting ? 'Crafting…' : craftable ? '✿ Craft now' : 'Missing ingredients'}
            </button>
        `;

        const btn = document.getElementById('bubuCraftBtn');
        if (btn) btn.addEventListener('click', onCraftClick);
    }

    // ---------- craft flow ----------
    function onCraftClick() {
        if (state.crafting) return;
        const r = state.recipes[state.selected];
        if (!r || !canCraft(r)) return;

        state.crafting = true;
        renderDetail();

        // Send ONLY the 1-based index
        fetchNUI('bubuCraft_craft', { index: state.selected + 1 });

        // Failsafe if server never responds
        setTimeout(() => {
            if (state.crafting) {
                state.crafting = false;
                renderDetail();
            }
        }, 8000);
    }

    function burstConfetti() {
        confetti.innerHTML = '';
        const colors = ['#ff9dc1', '#ffef9e', '#bde4ff', '#b8f0d6', '#e3d1ff', '#ff5fa0'];
        for (let i = 0; i < 40; i++) {
            const bit = document.createElement('div');
            bit.className = 'bubu-confetti__bit';
            bit.style.background = colors[i % colors.length];
            const angle = (Math.PI * 2 * i) / 40 + (Math.random() - 0.5) * 0.3;
            const dist = 180 + Math.random() * 220;
            bit.style.setProperty('--tx', `${Math.cos(angle) * dist}px`);
            bit.style.setProperty('--ty', `${Math.sin(angle) * dist}px`);
            bit.style.setProperty('--rot', `${Math.random() * 720 - 360}deg`);
            confetti.appendChild(bit);
        }
        confetti.classList.add('active');
        setTimeout(() => confetti.classList.remove('active'), 1500);
    }

    // ---------- NUI bridge ----------
    // ReaperAC (visible in F8 console) clobbers both `fetch` and
    // `XMLHttpRequest` on the main window in some builds. We grab
    // pristine copies from a hidden iframe's contentWindow, which has
    // its own untouched globals.
    let cleanFetch = null;
    let cleanXHR = null;
    (function bootstrapCleanXHR() {
        try {
            const frame = document.createElement('iframe');
            frame.style.display = 'none';
            frame.src = 'about:blank';
            document.documentElement.appendChild(frame);
            if (frame.contentWindow) {
                cleanXHR = frame.contentWindow.XMLHttpRequest;
                cleanFetch = frame.contentWindow.fetch
                    ? frame.contentWindow.fetch.bind(frame.contentWindow)
                    : null;
            }
        } catch (e) {
            console.error('[bubuCraft] clean-XHR bootstrap failed:', e && e.message);
        }
    })();

    function fetchNUI(action, payload = {}) {
        return new Promise((resolve) => {
            const resourceName =
                typeof GetParentResourceName === 'function'
                    ? GetParentResourceName()
                    : 'at_labubu';
            const url = `https://${resourceName}/${action}`;
            const body = JSON.stringify(payload);

            // Prefer clean XHR (fresh from iframe)
            const XHR = cleanXHR || window.XMLHttpRequest;
            if (typeof XHR === 'function') {
                try {
                    const xhr = new XHR();
                    xhr.open('POST', url, true);
                    xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
                    xhr.onload = function () {
                        if (xhr.status >= 200 && xhr.status < 300) {
                            if (!xhr.responseText) return resolve({});
                            try { resolve(JSON.parse(xhr.responseText)); }
                            catch { resolve({}); }
                        } else {
                            console.error('[bubuCraft] NUI', action, 'HTTP', xhr.status);
                            resolve(null);
                        }
                    };
                    xhr.onerror = function () {
                        console.error('[bubuCraft] NUI', action, 'XHR error — URL was', url);
                        resolve(null);
                    };
                    xhr.send(body);
                    return;
                } catch (e) {
                    console.error('[bubuCraft] NUI', action, 'XHR constructor failed:', e && e.message);
                    // fall through to fetch fallback
                }
            }

            // Last resort: clean fetch
            const doFetch = cleanFetch || window.fetch;
            if (typeof doFetch === 'function') {
                try {
                    const p = doFetch(url, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: body,
                    });
                    if (p && typeof p.then === 'function') {
                        p.then((res) => {
                            if (!res) { resolve(null); return; }
                            if (res.text) {
                                return res.text().then((t) => {
                                    if (!t) return resolve({});
                                    try { resolve(JSON.parse(t)); }
                                    catch { resolve({}); }
                                });
                            }
                            resolve({});
                        }).catch((e) => {
                            console.error('[bubuCraft] NUI', action, 'fetch failed:', e && e.message);
                            resolve(null);
                        });
                        return;
                    }
                } catch (e) {
                    console.error('[bubuCraft] NUI', action, 'fetch threw:', e && e.message);
                }
            }

            console.error('[bubuCraft] NUI', action, 'no working transport');
            resolve(null);
        });
    }

    function openUI(recipes, counts) {
        state.recipes  = recipes || [];
        state.counts   = counts  || {};
        state.selected = 0;
        state.crafting = false;
        root.classList.remove('hidden');
        // Hide the shop React UI while we're open — belt-and-braces fallback
        // for builds without :has() support.
        const shopRoot = document.getElementById('root');
        if (shopRoot) shopRoot.style.visibility = 'hidden';
        renderRecipeList();
        renderDetail();
    }

    function closeUI() {
        root.classList.add('hidden');
        const shopRoot = document.getElementById('root');
        if (shopRoot) shopRoot.style.visibility = '';
    }

    // Called when the user clicks X or presses ESC. Hides the UI
    // immediately, then makes sure Lua releases NUI focus. Retries the
    // fetch a couple times in case of transient routing issues.
    async function requestClose() {
        closeUI();
        // Try up to 3 times to reach Lua so focus gets released.
        for (let attempt = 0; attempt < 3; attempt++) {
            const res = await fetchNUI('bubuCraft_close');
            if (res !== null) return; // success
            await new Promise((r) => setTimeout(r, 100));
        }
        console.error('[bubuCraft] Failed to notify Lua of close — NUI focus may be stuck. Press ESC.');
    }

    // Only react to our namespaced actions; ignore everything else
    window.addEventListener('message', (e) => {
        const msg = e.data || {};
        switch (msg.action) {
            case 'bubuCraft:open':
                openUI(msg.recipes, msg.counts);
                break;
            case 'bubuCraft:close':
                closeUI();
                break;
            case 'bubuCraft:updateInventory':
                state.counts = msg.counts || {};
                renderRecipeList();
                renderDetail();
                break;
            case 'bubuCraft:craftResult':
                state.crafting = false;
                if (msg.ok) burstConfetti();
                renderDetail();
                break;
        }
    });

    closeBtn.addEventListener('click', requestClose);

    // ESC only when our UI is visible (don't steal ESC from the shop UI)
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && !root.classList.contains('hidden')) {
            e.preventDefault();
            e.stopPropagation();
            requestClose();
        }
    });
})();
