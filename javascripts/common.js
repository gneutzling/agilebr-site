/**
 * DOM is Ready!
 * 
 */
$(document).ready(function () {
	SimpleParallax();
});


/**
 * Animates background on scroll event.
 * 
 */
function SimpleParallax () {
	var teaser = document.getElementsByClassName('jumbotron')[0],
		speed = 5;
	
	window.onscroll = function() {
		var yOffset = window.pageYOffset;
		teaser.style.backgroundPosition = "center " + (yOffset / speed) + "px";
	};
};