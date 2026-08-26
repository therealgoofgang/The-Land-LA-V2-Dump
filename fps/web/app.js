const overlay = document.getElementById("overlay");
const presetsEl = document.getElementById("presets");
const tabsEl = document.getElementById("tabs");
const settingsEl = document.getElementById("settings");
const fpsValueEl = document.getElementById("fps-value");
const fpsEl = document.getElementById("fps");
const footerHintEl = document.getElementById("footer-hint");

const hudEl = document.getElementById("bench-hud");
const benchLabelEl = document.getElementById("bench-label");
const benchCountEl = document.getElementById("bench-count");
const benchStageEl = document.getElementById("bench-stage");
const benchBarEl = document.getElementById("bench-bar");

const resultsEl = document.getElementById("results");
const resultRowsEl = document.getElementById("result-rows");
const resultSummaryEl = document.getElementById("result-summary");
const verdictsEl = document.getElementById("verdicts");
const customsEl = document.getElementById("customs");
const suggestedBtn = document.getElementById("result-suggested");

// Below this, a difference is measurement noise rather than a real gain.
const NOISE_FLOOR = 2;

// The preset recommendation aims for the best-looking preset that still holds this.
const TARGET_FPS = 60;

const resourceName = typeof GetParentResourceName === "function" ? GetParentResourceName() : "fps";

let categories = [];
let presets = [];
let values = {};
let defaults = {};
let activeTab = null;
let menuOpen = false;
let benchRunning = false;
let suggestedPresetId = null;

const post = (endpoint, body) =>
	fetch(`https://${resourceName}/${endpoint}`, {
		method: "POST",
		headers: { "Content-Type": "application/json; charset=UTF-8" },
		body: JSON.stringify(body || {}),
	}).catch(() => {});

const eachItem = (fn) => categories.forEach((c) => c.items.forEach(fn));

const matchesPreset = (preset) =>
	Object.keys(defaults).every((id) => {
		const expected = id in preset.values ? preset.values[id] : defaults[id];
		return values[id] === expected;
	});

const paintSlider = (input) => {
	const min = Number(input.min);
	const max = Number(input.max);
	const pct = ((Number(input.value) - min) / (max - min)) * 100;
	input.style.setProperty("--fill", `${pct}%`);
};

const renderPresets = () => {
	presetsEl.replaceChildren();

	presets.forEach((preset) => {
		const chip = document.createElement("button");
		chip.type = "button";
		chip.className = "preset";
		chip.dataset.preset = preset.id;
		chip.title = preset.hint || "";

		const label = document.createElement("span");
		label.className = "preset__label";
		label.textContent = preset.label;
		chip.append(label);

		chip.addEventListener("click", () => {
			values = { ...defaults, ...preset.values };
			renderSettings();
			syncPresets();
			footerHintEl.textContent = preset.hint || "";
		});

		presetsEl.append(chip);
	});
};

const syncPresets = () => {
	presetsEl.querySelectorAll(".preset").forEach((chip) => {
		const preset = presets.find((p) => p.id === chip.dataset.preset);
		chip.classList.toggle("preset--active", Boolean(preset) && matchesPreset(preset));
	});
};

const renderTabs = () => {
	tabsEl.replaceChildren();

	categories.forEach((category) => {
		const tab = document.createElement("button");
		tab.type = "button";
		tab.className = "tab";
		tab.dataset.tab = category.id;

		const icon = document.createElement("span");
		icon.className = "tab__icon";
		icon.textContent = category.icon || "•";

		const label = document.createElement("span");
		label.className = "tab__label";
		label.textContent = category.label;

		tab.append(icon, label);
		tab.addEventListener("click", () => {
			activeTab = category.id;
			renderSettings();
			syncTabs();
		});

		tabsEl.append(tab);
	});
};

const syncTabs = () => {
	tabsEl.querySelectorAll(".tab").forEach((tab) => {
		tab.classList.toggle("tab--active", tab.dataset.tab === activeTab);
	});
};

const buildToggle = (item) => {
	const control = document.createElement("label");
	control.className = "switch";

	const input = document.createElement("input");
	input.type = "checkbox";
	input.className = "switch__input";
	input.dataset.setting = item.id;
	input.checked = Boolean(values[item.id]);

	const track = document.createElement("span");
	track.className = "switch__track";

	input.addEventListener("change", () => {
		values[item.id] = input.checked;
		syncPresets();
	});

	control.append(input, track);
	return control;
};

const buildSlider = (item) => {
	const control = document.createElement("div");
	control.className = "slider";

	const input = document.createElement("input");
	input.type = "range";
	input.className = "slider__input";
	input.dataset.setting = item.id;
	input.min = item.min;
	input.max = item.max;
	input.step = item.step;
	input.value = values[item.id];

	const output = document.createElement("span");
	output.className = "slider__value";
	output.textContent = `${values[item.id]}${item.unit || ""}`;

	input.addEventListener("input", () => {
		const value = Number(input.value);
		values[item.id] = value;
		output.textContent = `${value}${item.unit || ""}`;
		paintSlider(input);
		syncPresets();
	});

	control.append(input, output);
	paintSlider(input);
	return control;
};

const renderSettings = () => {
	settingsEl.replaceChildren();

	const category = categories.find((c) => c.id === activeTab);
	if (!category) return;

	category.items.forEach((item) => {
		const row = document.createElement("div");
		row.className = "setting";
		if (item.warn) row.classList.add("setting--warn");

		const text = document.createElement("div");
		text.className = "setting__text";

		const label = document.createElement("span");
		label.className = "setting__label";
		label.textContent = item.label;
		text.append(label);

		if (item.hint) {
			const hint = document.createElement("span");
			hint.className = "setting__hint";
			hint.textContent = item.hint;
			text.append(hint);
		}

		row.append(text, item.type === "slider" ? buildSlider(item) : buildToggle(item));
		settingsEl.append(row);
	});

	settingsEl.scrollTop = 0;
};

const showPanel = () => {
	overlay.classList.add("overlay--visible");
	overlay.setAttribute("aria-hidden", "false");
};

const hidePanel = () => {
	overlay.classList.remove("overlay--visible");
	overlay.setAttribute("aria-hidden", "true");
};

const openMenu = (data) => {
	categories = data.categories || [];
	presets = data.presets || [];
	values = { ...data.values };

	defaults = {};
	eachItem((item) => {
		defaults[item.id] = item.default;
	});

	activeTab = categories.length ? categories[0].id : null;

	renderPresets();
	renderTabs();
	renderSettings();
	syncTabs();
	syncPresets();

	hudEl.hidden = true;
	resultsEl.hidden = true;
	footerHintEl.innerHTML = "Press <kbd>Esc</kbd> to discard changes.";

	if (data.phaseSeconds && data.phaseCount) {
		const minutes = Math.round((data.phaseSeconds * data.phaseCount) / 60 * 10) / 10;
		const benchBtn = document.getElementById("benchmark");
		benchBtn.textContent = `Benchmark all (~${minutes} min)`;
		benchBtn.title = `${data.phaseCount} phases: every setting isolated, every preset, and your staged settings.`;
	}

	showPanel();
	menuOpen = true;
};

const closeMenu = () => {
	hidePanel();
	fpsValueEl.textContent = "--";
	menuOpen = false;
};

const apply = () => {
	if (!menuOpen || benchRunning) return;
	closeMenu();
	post("apply", { values });
};

const cancel = () => {
	if (!menuOpen || benchRunning) return;
	closeMenu();
	post("cancel");
};

/* ── Benchmark ─────────────────────────────────────────────────────────── */

const startBenchmark = () => {
	if (!menuOpen || benchRunning) return;

	benchRunning = true;
	menuOpen = false;
	resultsEl.hidden = true;
	benchBarEl.style.width = "0%";
	benchLabelEl.textContent = "Starting";
	benchCountEl.textContent = "";
	benchStageEl.textContent = "Letting LODs settle";

	// The panel would occlude the camera and add its own draw cost to every phase.
	hidePanel();
	hudEl.hidden = false;

	post("benchmark", { values });
};

const onBenchProgress = (data) => {
	if (!benchRunning) return;

	benchLabelEl.textContent = data.label;
	benchCountEl.textContent = `${data.index} / ${data.count}`;

	const stage = data.stage === "warmup" ? "Letting LODs settle" : "Sampling frames";
	benchStageEl.textContent = `${stage} · ${data.secondsLeft}s`;
	benchBarEl.style.width = `${data.progress}%`;
};

const endBenchmark = () => {
	benchRunning = false;
	benchBarEl.style.width = "100%";
	hudEl.hidden = true;
	menuOpen = true;
	showPanel();
};

const onBenchAborted = () => {
	endBenchmark();
	footerHintEl.textContent = "Benchmark aborted. Nothing was changed.";
};

const signed = (n) => `${n > 0 ? "+" : ""}${n}`;

const addResultRow = (row, baseline, modifier) => {
	const tr = document.createElement("tr");
	if (modifier) tr.className = `result__row--${modifier}`;

	const label = document.createElement("th");
	label.textContent = row.label;

	const avg = document.createElement("td");
	avg.textContent = row.avg;

	const low = document.createElement("td");
	low.textContent = row.low;

	const delta = document.createElement("td");

	if (row.id === "baseline") {
		delta.textContent = "—";
		delta.className = "result__delta";
	} else {
		const gain = row.avg - baseline.avg;
		delta.textContent = signed(gain);
		delta.className = "result__delta";
		if (gain >= NOISE_FLOOR) delta.classList.add("result__delta--gain");
		else if (gain <= -NOISE_FLOOR) delta.classList.add("result__delta--loss");
		else delta.classList.add("result__delta--noise");
	}

	tr.append(label, avg, low, delta);
	resultRowsEl.append(tr);
};

const addVerdict = (title, body, tone) => {
	const card = document.createElement("div");
	card.className = `verdict${tone ? ` verdict--${tone}` : ""}`;

	const titleEl = document.createElement("span");
	titleEl.className = "verdict__title";
	titleEl.textContent = title;

	const bodyEl = document.createElement("span");
	bodyEl.className = "verdict__body";
	bodyEl.textContent = body;

	card.append(titleEl, bodyEl);
	verdictsEl.append(card);
};

// Build three tailor-made presets from this machine's measured results. Each setting's
// isolated gain is traded against its schema-declared visualCost: Performance takes every
// measured win regardless of looks, Balanced takes only wins the player won't notice, and
// Quality spends the invisible wins on extra draw distance sized by measured headroom.
const buildCustoms = (isolated, rows, baseline) => {
	const itemById = {};
	eachItem((item) => (itemById[item.id] = item));

	const gainOf = {};
	isolated.forEach((r) => (gainOf[r.id] = r.avg - baseline.avg));

	const gainers = isolated.filter((r) => itemById[r.id] && gainOf[r.id] >= NOISE_FLOOR);
	if (!gainers.length) return [];

	const make = (ids) => {
		const built = { ...defaults };
		ids.forEach((id) => (built[id] = itemById[id].bench));
		return built;
	};
	const estimate = (ids, base) => Math.round(base + ids.reduce((sum, id) => sum + gainOf[id], 0));

	const perfIds = gainers.map((r) => r.id);
	const balIds = gainers.filter((r) => (itemById[r.id].visualCost ?? 2) <= 1).map((r) => r.id);
	const freeIds = gainers.filter((r) => (itemById[r.id].visualCost ?? 2) === 0).map((r) => r.id);

	const customs = [
		{
			label: "Custom Performance",
			blurb: "Every setting that measurably helped on your PC — and nothing that didn't.",
			values: make(perfIds),
			est: estimate(perfIds, baseline.avg),
		},
		{
			label: "Custom Balanced",
			blurb: "Only the wins you won't see. The game still looks right.",
			values: make(balIds),
			est: estimate(balIds, baseline.avg),
		},
	];

	// Quality: invisible wins fund extra draw distance, sized by the measured presets.
	const ultra = rows.find((r) => r.id === "preset:ultra");
	const quality = rows.find((r) => r.id === "preset:quality");
	const qValues = make(freeIds);
	let qBase = baseline.avg;
	let qBlurb = "Vanilla looks plus the invisible wins.";

	if (ultra && ultra.avg >= TARGET_FPS) {
		qValues.lodScale = 200;
		qValues.shadowDistance = 150;
		qBase = ultra.avg;
		qBlurb = "Your PC holds 60 at double draw distance — take it, plus the invisible wins.";
	} else if (quality && quality.avg >= TARGET_FPS) {
		qValues.lodScale = 140;
		qValues.shadowDistance = 120;
		qBase = quality.avg;
		qBlurb = "Extended draw distance your PC can hold, plus the invisible wins.";
	}

	customs.push({ label: "Custom Quality", blurb: qBlurb, values: qValues, est: estimate(freeIds, qBase) });

	return customs;
};

const renderCustoms = (customs) => {
	customsEl.replaceChildren();

	customs.forEach((custom) => {
		const card = document.createElement("div");
		card.className = "custom";

		const title = document.createElement("span");
		title.className = "custom__title";
		title.textContent = custom.label;

		const est = document.createElement("span");
		est.className = "custom__est";
		est.textContent = `~${custom.est} FPS`;

		const blurb = document.createElement("span");
		blurb.className = "custom__blurb";
		blurb.textContent = custom.blurb;

		const use = document.createElement("button");
		use.type = "button";
		use.className = "button button--ghost custom__use";
		use.textContent = "Use";
		use.addEventListener("click", () => {
			values = { ...custom.values };
			resultsEl.hidden = true;
			renderSettings();
			syncPresets();
			apply();
		});

		card.append(title, est, blurb, use);
		customsEl.append(card);
	});
};

const pickSuggestedPreset = (rows, baseline) => {
	// presets[] arrives ordered best-looking first; baseline doubles as Default.
	const measured = presets
		.map((p) => {
			if (p.id === "default") return { preset: p, avg: baseline.avg };
			const row = rows.find((r) => r.id === `preset:${p.id}`);
			return row ? { preset: p, avg: row.avg } : null;
		})
		.filter(Boolean);

	return (
		measured.find((m) => m.avg >= TARGET_FPS) ||
		measured.reduce((best, m) => (m.avg > best.avg ? m : best), measured[0])
	);
};

const showResults = (data) => {
	endBenchmark();

	const rows = data.rows || [];
	const baseline = rows.find((r) => r.id === "baseline");
	const combined = rows.find((r) => r.id === "combined");

	resultRowsEl.replaceChildren();
	verdictsEl.replaceChildren();
	customsEl.replaceChildren();
	suggestedBtn.hidden = true;
	suggestedPresetId = null;

	if (!baseline) {
		resultSummaryEl.textContent = "The run did not complete a baseline phase.";
		resultsEl.hidden = false;
		return;
	}

	const isolated = rows
		.filter((r) => r.id !== "baseline" && r.id !== "combined" && !r.id.startsWith("preset:"))
		.sort((a, b) => b.avg - a.avg);
	const presetRows = rows.filter((r) => r.id.startsWith("preset:"));

	// Table: baseline, then settings biggest-win-first, then presets, then your settings.
	addResultRow(baseline, baseline);
	isolated.forEach((r) => addResultRow(r, baseline));
	presetRows.forEach((r) => addResultRow(r, baseline, "preset"));
	if (combined) addResultRow(combined, baseline, "combined");

	resultSummaryEl.textContent = `Baseline ${baseline.avg} FPS average, ${baseline.low} on 1% lows.`;

	if (isolated.length) {
		const most = isolated[0];
		const least = isolated[isolated.length - 1];

		addVerdict(
			"Most gained",
			`${most.label}: ${signed(most.avg - baseline.avg)} FPS`,
			most.avg - baseline.avg >= NOISE_FLOOR ? "gain" : undefined
		);
		addVerdict(
			"Least gained",
			`${least.label}: ${signed(least.avg - baseline.avg)} FPS`,
			least.avg - baseline.avg <= -NOISE_FLOOR ? "loss" : undefined
		);

		// Settings that measurably help but are not in what the player has staged.
		const unused = isolated.filter(
			(r) => r.avg - baseline.avg >= NOISE_FLOOR && values[r.id] === defaults[r.id]
		);
		if (unused.length) {
			addVerdict(
				"Worth enabling",
				unused.slice(0, 3).map((r) => `${r.label} (${signed(r.avg - baseline.avg)})`).join(", ")
			);
		}
	}

	renderCustoms(buildCustoms(isolated, rows, baseline));

	const suggestion = pickSuggestedPreset(rows, baseline);
	if (suggestion) {
		const meets = suggestion.avg >= TARGET_FPS;
		addVerdict(
			"Suggested preset",
			`${suggestion.preset.label} — ${suggestion.avg} FPS ` +
				(meets ? `(best-looking option holding ${TARGET_FPS}+)` : `(fastest available; nothing held ${TARGET_FPS})`),
			"suggest"
		);

		suggestedPresetId = suggestion.preset.id;
		suggestedBtn.textContent = `Use ${suggestion.preset.label}`;
		suggestedBtn.hidden = false;
	}

	resultsEl.hidden = false;
};

const setFps = (fps) => {
	fpsValueEl.textContent = fps;
	fpsEl.classList.toggle("fps--good", fps >= 60);
	fpsEl.classList.toggle("fps--fair", fps >= 30 && fps < 60);
	fpsEl.classList.toggle("fps--poor", fps < 30);
};

document.getElementById("apply").addEventListener("click", apply);
document.getElementById("close").addEventListener("click", cancel);
document.getElementById("benchmark").addEventListener("click", startBenchmark);

document.getElementById("reset").addEventListener("click", () => {
	if (benchRunning) return;
	values = { ...defaults };
	renderSettings();
	syncPresets();
});

document.getElementById("result-back").addEventListener("click", () => {
	resultsEl.hidden = true;
});

document.getElementById("result-apply").addEventListener("click", () => {
	resultsEl.hidden = true;
	apply();
});

suggestedBtn.addEventListener("click", () => {
	const preset = presets.find((p) => p.id === suggestedPresetId);
	if (!preset) return;

	values = { ...defaults, ...preset.values };
	resultsEl.hidden = true;
	renderSettings();
	syncPresets();
	apply();
});

window.addEventListener("message", (evt) => {
	const { action, data } = evt.data || {};

	if (action === "OPEN_MENU") return openMenu(data);
	if (action === "FPS" && menuOpen) return setFps(data.fps);
	if (action === "BENCH_PROGRESS") return onBenchProgress(data);
	if (action === "BENCH_RESULT") return showResults(data);
	if (action === "BENCH_ABORTED") return onBenchAborted();
});

document.addEventListener("keyup", (evt) => {
	// Aborting a run is the game's job: the NUI holds no focus while one is in flight.
	if (evt.key === "Escape") cancel();
});
