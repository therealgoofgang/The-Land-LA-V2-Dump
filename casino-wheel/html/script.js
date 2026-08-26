(function () {
    'use strict';

    var canvas = document.getElementById('wheel');
    var ctx    = canvas.getContext('2d');
    var notif  = document.getElementById('notif');
    var W = canvas.width, H = canvas.height;
    var cx = W / 2, cy = H / 2;

    var segments     = [];
    var currentAngle = 0;
    var spinning     = false;
    var notifTimer   = null;
    var glowAlpha    = 0;
    var glowFading   = false;

    // -----------------------------------------------------------
    // DRAW
    // -----------------------------------------------------------
    function draw(rotation) {
        var n = segments.length;
        if (n === 0) return;

        var arc    = (2 * Math.PI) / n;
        var radius = cx - 30;

        ctx.clearRect(0, 0, W, H);

        // Outer glow ring (pulses on win)
        if (glowAlpha > 0) {
            ctx.save();
            ctx.beginPath();
            ctx.arc(cx, cy, radius + 12, 0, 2 * Math.PI);
            ctx.strokeStyle = 'rgba(255, 215, 0, ' + glowAlpha + ')';
            ctx.lineWidth = 6;
            ctx.shadowColor = 'rgba(255, 215, 0, ' + glowAlpha + ')';
            ctx.shadowBlur = 20;
            ctx.stroke();
            ctx.restore();
        }

        // Outer ring
        ctx.beginPath();
        ctx.arc(cx, cy, radius + 3, 0, 2 * Math.PI);
        ctx.strokeStyle = 'rgba(255,255,255,0.6)';
        ctx.lineWidth = 2;
        ctx.stroke();

        // Segments
        for (var i = 0; i < n; i++) {
            var start = rotation + i * arc - Math.PI / 2;
            var end_  = start + arc;
            var mid   = start + arc / 2;
            var seg   = segments[i];

            ctx.save();
            ctx.beginPath();
            ctx.moveTo(cx, cy);
            ctx.arc(cx, cy, radius, start, end_);
            ctx.closePath();
            ctx.fillStyle = seg.color;
            ctx.fill();
            ctx.strokeStyle = 'rgba(0,0,0,0.3)';
            ctx.lineWidth = 1;
            ctx.stroke();
            ctx.restore();

            // Label
            ctx.save();
            ctx.translate(cx, cy);
            ctx.rotate(mid);
            ctx.textAlign = 'right';
            ctx.fillStyle = seg.textColor || '#fff';
            ctx.font = 'bold 14px "Segoe UI", Arial, sans-serif';
            ctx.shadowColor = 'rgba(0,0,0,0.8)';
            ctx.shadowBlur = 3;
            ctx.fillText(seg.label, radius - 16, 5);
            ctx.restore();
        }

        // Tick markers around the edge
        for (var i = 0; i < n; i++) {
            var tickAngle = rotation + i * arc - Math.PI / 2;
            ctx.save();
            ctx.translate(cx, cy);
            ctx.rotate(tickAngle);
            ctx.fillStyle = '#FFD700';
            ctx.shadowColor = 'rgba(0,0,0,0.5)';
            ctx.shadowBlur = 2;
            ctx.fillRect(radius - 8, -1.5, 8, 3);
            ctx.restore();
        }

        // Center hub
        var g = ctx.createRadialGradient(cx, cy, 3, cx, cy, 22);
        g.addColorStop(0, '#FFD700');
        g.addColorStop(1, '#8B6914');
        ctx.beginPath();
        ctx.arc(cx, cy, 20, 0, 2 * Math.PI);
        ctx.fillStyle = g;
        ctx.fill();
        ctx.strokeStyle = '#FFD700';
        ctx.lineWidth = 2;
        ctx.stroke();

        // Hub text
        ctx.fillStyle = '#fff';
        ctx.font = 'bold 10px "Segoe UI", sans-serif';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.shadowColor = 'rgba(0,0,0,0.5)';
        ctx.shadowBlur = 2;
        ctx.fillText('SPIN', cx, cy);
    }

    // -----------------------------------------------------------
    // GLOW PULSE (after spin lands)
    // -----------------------------------------------------------
    function startGlow() {
        glowAlpha = 0;
        glowFading = false;
        var pulseCount = 0;
        var maxPulses = 6;

        function pulse() {
            if (pulseCount >= maxPulses) {
                glowAlpha = 0;
                draw(currentAngle);
                return;
            }
            // Fade in
            glowAlpha += 0.05;
            if (glowAlpha >= 0.8) {
                glowFading = true;
            }
            if (glowFading) {
                glowAlpha -= 0.1;
                if (glowAlpha <= 0) {
                    glowAlpha = 0;
                    glowFading = false;
                    pulseCount++;
                }
            }
            draw(currentAngle);
            requestAnimationFrame(pulse);
        }
        requestAnimationFrame(pulse);
    }

    // -----------------------------------------------------------
    // SPIN
    // -----------------------------------------------------------
    function spinTo(targetSeg, totalSegs, duration) {
        if (spinning) return;
        spinning = true;
        glowAlpha = 0;

        var arc = (2 * Math.PI) / totalSegs;
        var segCenter   = (targetSeg - 1) * arc + arc / 2;
        var targetAngle = -segCenter;
        var fullSpins   = (5 + Math.floor(Math.random() * 4)) * 2 * Math.PI;
        var normalCur   = currentAngle % (2 * Math.PI);
        var totalSpin   = fullSpins + targetAngle - normalCur;
        var startTime   = performance.now();
        var startAngle  = currentAngle;
        var dur         = duration || 8000;

        // Smoother ease-out with slight bounce feel
        function easeOut(t) {
            return 1 - Math.pow(1 - t, 4.5);
        }

        function tick(now) {
            var p = Math.min((now - startTime) / dur, 1);
            currentAngle = startAngle + totalSpin * easeOut(p);
            draw(currentAngle);
            if (p < 1) {
                requestAnimationFrame(tick);
            } else {
                currentAngle = startAngle + totalSpin;
                draw(currentAngle);
                spinning = false;
                startGlow();
            }
        }
        requestAnimationFrame(tick);
    }

    // -----------------------------------------------------------
    // NOTIFICATION (improved styling)
    // -----------------------------------------------------------
    function showNotif(msg, type) {
        if (notifTimer) clearTimeout(notifTimer);
        notif.textContent = msg;
        notif.className = (type || 'info') + ' show';
        notifTimer = setTimeout(function () {
            notif.className = 'hide';
        }, 4000);
    }

    // -----------------------------------------------------------
    // MESSAGE HANDLER
    // -----------------------------------------------------------
    window.addEventListener('message', function (e) {
        var d = e.data;
        if (!d || !d.type) return;
        switch (d.type) {
            case 'init':
                segments = d.segments || [];
                draw(0);
                break;
            case 'spin':
                spinTo(d.segment, d.totalSegments, d.duration || 8000);
                break;
            case 'notification':
                showNotif(d.message, d.notifType);
                break;
        }
    });

    draw(0);
})();
