'use strict';
/**
 * Change resolution and refresh refresh_rate. Remember the
 * starting resolution so it can be restored when quitting mpv.
 * 
 * input.conf:
 *  q		  script-message reset-resolution; quit
 * 
**/
var old_resolution;

mp.register_event("file-loaded", function() {
	var dw = mp.get_property_number("video-params/dw");
	var dh = mp.get_property_number("video-params/dh");
	if (!dw) {
            dw = mp.get_property_number("dwidth");
            if (!dw) {
		mp.set_property("user-data/res", "");
		mp.set_property("user-data/ar",	 "");
		return "";
	    }
            dh = mp.get_property_number("dheight");
        }
        var fps = mp.get_property_number("container-fps");
        if (dh <= 1080) {
            dw = 1920;
            dh = 1080;
        } else if (dh <= 1440) {
            dw = 2560;
            dh = 1440;
        } else {
            dw = 3840;
            dh = 2160;
        }
        mp.commandv("script-message", "set-resolution", dw, dh, fps);
        // mp.commandv("run", "way-displays", "-s", "MODE", "!^BNQ BenQ PJ .*$", dw, dh, fps);
});

mp.register_script_message("set-resolution", function(width, height, refresh_rate) {
        if (!refresh_rate) refresh_rate = 60;
        old_resolution = [1920, 1080, 60];
        mp.commandv("run", "way-displays", "-s", "MODE", "!^BNQ BenQ PJ .*$", width, height, refresh_rate);
});

mp.register_script_message("reset-resolution", function() {
        mp.commandv("run", "way-displays", "-s", "MODE", "!^BNQ BenQ PJ .*$", old_resolution[0], old_resolution[1], old_resolution[2]);
});
