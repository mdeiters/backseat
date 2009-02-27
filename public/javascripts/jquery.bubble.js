$(function () {
    $('.tooltip').each(function () {
        var time = 250;
        var hideDelay = 200;
        var hideDelayTimer = null;
        var showing = false;
        var visible = false;
        
				var trigger = $('.trigger', this);
        var info = $('.popup', this).css('opacity', 0);
				
				var top = trigger.position()['top'] - 12;	
				var left = trigger.position()['left'] + 30;
				var window_width = $(window).width();
				if((left + info.width()) > window_width)
					left = trigger.position()['left'] - (info.width() + 30);
				
				show_function = function (e) {
            if (hideDelayTimer) clearTimeout(hideDelayTimer);
            if (showing || visible) {
                // don't trigger the animation again
                return;
            } else {
								showing = true;
								// reset position of info box
				        info.css("top", top).css("left",left).css({display: 'block'})
                info.animate({opacity: 1}, time, 'swing', function() {
									showing = false;
									visible = true;
								});
            }
            return false;
        };

				hide_function = function () {
            if (hideDelayTimer) clearTimeout(hideDelayTimer);
            hideDelayTimer = setTimeout(function () {
                hideDelayTimer = null;
                info.animate({opacity: 0}, time, 'swing', function () {
                    visible = false;
                    info.css('display', 'none');
                });
            }, hideDelay);
            return false;
        };

        $([trigger.get(0), info.get(0)]).mouseover(show_function).mouseout(hide_function) //#.click(hide_function);
    });
});