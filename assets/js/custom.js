﻿
/*=============================================================
    Authour URI: www.binarytheme.com
    License: Commons Attribution 3.0

    http://creativecommons.org/licenses/by/3.0/

    100% Free To use For Personal And Commercial Use.
    IN EXCHANGE JUST GIVE US CREDITS AND TELL YOUR FRIENDS ABOUT US
   
    ========================================================  */

(function ($) {
    "use strict";
    var mainApp = {
       
        reviews_fun:function()
        {
            ($)(function () {
                $('#carousel-example').carousel({
                    interval: 3000 // TIME IN MILLI SECONDS
                });
            });

        },
     
        custom_fun:function()
        {

        },

    }
   
   
    $(document).ready(function () {
        mainApp.reviews_fun();
        mainApp.custom_fun();

    });
}(jQuery));
jQuery(document).ready(function(){
	jQuery(".chosen").data("placeholder","Select the genre(s)").chosen();
});
