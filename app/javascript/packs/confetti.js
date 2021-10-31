import ConfettiGenerator from "confetti-js";
import $ from 'jquery';

function runConfetti(button, seconds) {
    var canvas = document.getElementById('confetti');
    var confettiSettings = {target: canvas, width: window.innerWidth, height: window.innerHeight};
    var confetti = new ConfettiGenerator(confettiSettings);
    confetti.render();
    setTimeout(() => {
        confetti.clear();
    }, seconds * 1000);
}

$(document).on('turbolinks:load', function () {
    $('button#canvas-confetti').on(
        'click',
        function (el) {
            runConfetti(el, 3);
        }
    );
});
