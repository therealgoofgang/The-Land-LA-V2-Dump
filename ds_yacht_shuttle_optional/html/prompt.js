const prompt = document.getElementById('prompt');
const label = document.getElementById('label');

window.addEventListener('message', (event) => {
    const data = event.data || {};

    if (data.action !== 'shuttlePrompt') {
        return;
    }

    if (typeof data.label === 'string' && data.label.length > 0) {
        label.textContent = data.label;
    }

    const visible = data.visible === true;
    prompt.classList.toggle('visible', visible);
    prompt.setAttribute('aria-hidden', visible ? 'false' : 'true');
});
