$(function () {
    $('.bubbleInfo').each(function () {
			xOffset = 10;
			yOffset = 20;		
	
        var distance = 10;
        var time = 250;
        var hideDelay = 200;

        var hideDelayTimer = null;

        var beingShown = false;
        var shown = false;
        var trigger = $('.trigger', this);
        var info = $('.popup', this).css('opacity', 0);

				show_function = function (e) {
            if (hideDelayTimer) clearTimeout(hideDelayTimer);
            if (beingShown || shown) {
                // don't trigger the animation again
                return;
            } else {
                // reset position of info box
                beingShown = true;

								info.css("top",(e.pageY - xOffset) + "px")
								.css("left",(e.pageX + yOffset) + "px")
                .css({
                    // bottom: -40,
                    // left: -33,
                    display: 'block'
                }).animate({
                    top: '-=' + distance + 'px',
                    opacity: 1
                }, time, 'swing', function() {
                    beingShown = false;
                    shown = true;
                });
            }

            return false;
        };

				hide_function = function () {
            if (hideDelayTimer) clearTimeout(hideDelayTimer);
            hideDelayTimer = setTimeout(function () {
                hideDelayTimer = null;
                info.animate({
                    top: '-=' + distance + 'px',
                    opacity: 0
                }, time, 'swing', function () {
                    shown = false;
                    info.css('display', 'none');
                });

            }, hideDelay);
            return false;
        };
				

        $([trigger.get(0), info.get(0)]).mouseover(show_function).mouseout(hide_function);
    });
});