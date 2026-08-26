const CLASS = 'high';
const taxes = document.querySelector('.taxes');
const taxesClose = document.querySelector('.taxes__close');

const timerHours = document.querySelector('.taxes__timer-hours');
const timerMinutes = document.querySelector('.taxes__timer-minutes');
const timerUnit = document.querySelector('.taxes__timer small');

const UpdateContent = () => {
    document.querySelectorAll('[data-i18n]').forEach((element) => {
        const key = element.getAttribute('data-i18n');
        element.innerHTML = i18next.t(key);
    });
};

const ChangeLanguage = (lang) => {
    i18next.changeLanguage(lang, () => {
        document.querySelectorAll('[data-i18n]').forEach((element) => {
            const key = element.getAttribute('data-i18n');
            element.innerHTML = i18next.t(key);
        });
    });
};

// Ensure money is always rendered as an integer with thousands separators
const formatMoneyInt = (value) => {
    const numeric = (typeof value === 'number')
        ? value
        : parseFloat(String(value).replace(/,/g, '').trim());
    const n = Number.isFinite(numeric) ? Math.floor(numeric) : 0;
    return n.toLocaleString('en-US');
};

const ToDataUrl = (url, callback) => {
    var xhr = new XMLHttpRequest();
    xhr.onload = function() {
        var reader = new FileReader();
        reader.onloadend = function() {
            callback(reader.result);
        }
        reader.readAsDataURL(xhr.response);
    };
    xhr.open('GET', url);
    xhr.responseType = 'blob';
    xhr.send();
};

setTimeout(() => {

    window.$(() => {
    
        window.addEventListener('message', (event) => {
            switch (event.data.action) {
                case 'open':
                    window.$('.taxes').addClass('show');
                    window.$('#pname').html(event.data.pData.name);
                    window.$('#cashBalance').text('$' + formatMoneyInt(event.data.worth.cash));
                    window.$('#bankBalance').text('$' + formatMoneyInt(event.data.worth.bank));
                    window.$('#totalWorth').text('$' + formatMoneyInt(event.data.worth.total));
                    
                    // Mostrar el loader inicialmente y ocultar el timer real
                    window.$('.taxes__timer-content').hide().css('opacity','0');
                    window.$('.taxes__timer-loader').show();
                    
                    i18next.use(i18nextBrowserLanguageDetector).init({
                        resources: event.data.translations,
                        fallbackLng: event.data.language,
                        debug: true,
                    }, (err, t) => {
                        if (err) return console.error(err);
                        UpdateContent();
                    });
                    ChangeLanguage(event.data.language);
                    document.documentElement.style.setProperty('--primary-color', event.data.color);
                    window.$('#userimage').attr('src', event.data.mug.base64);
                    break;
                    // case 'time':
                    //     if (event.data.time !== undefined) {
                    //         const totalSeconds = event.data.time * 60;
                    //         if(totalSeconds < 60) {
                    //             // Mostrar en segundos si es menor a 60 segundos
                    //             timerHours.textContent = "00";
                    //             timerMinutes.textContent = totalSeconds < 10 ? `0${Math.floor(totalSeconds)}` : Math.floor(totalSeconds);
                    //             timerUnit.textContent = 'S'; // segundos
                    //         } else if(totalSeconds < 3600) {
                    //             // Menos de una hora: formato mm:ss
                    //             const minutes = Math.floor(totalSeconds / 60);
                    //             const seconds = Math.floor(totalSeconds % 60);
                    //             timerHours.textContent = minutes < 10 ? `0${minutes}` : minutes;
                    //             timerMinutes.textContent = seconds < 10 ? `0${seconds}` : seconds;
                    //             timerUnit.textContent = 'M'; // minutos
                    //         } else {
                    //             // Una hora o más: formato hh:mm
                    //             const hours = Math.floor(totalSeconds / 3600);
                    //             const minutes = Math.floor((totalSeconds % 3600) / 60);
                    //             timerHours.textContent = hours < 10 ? `0${hours}` : hours;
                    //             timerMinutes.textContent = minutes < 10 ? `0${minutes}` : minutes;
                    //             timerUnit.textContent = 'H'; // horas
                    //         }
                            
                    //         window.$('.taxes__timer-loader').hide();
                    //         window.$('.taxes__timer-content').show().css('opacity','1');
                    //     }
                    //     break;
                case 'getMug':
                    ToDataUrl(event.data.img, (base64) => {
                        window.$.post(`https://${GetParentResourceName()}/mugshot`, JSON.stringify({
                            base64: base64,
                            handle: event.data.handle,
                            id: event.data.id
                        }));
                    });
                    break;
            }
        });
        
        window.$('.taxes__close').on('click', () => {
            window.$('.taxes').removeClass('show');
            window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({ }));
        });
        
        document.addEventListener('keydown', (event) => {
            if (event.keyCode == 27) {
                window.$('.taxes').removeClass('show');
                window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({ }));
            }
        });
    
    });

}, 100);