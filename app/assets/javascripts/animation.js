$(document).ready(function() {

    $("#menu").hover(function(){
        $(".line").css("margin-top", ".8em");
    }, function() {
      $(".line").css("margin-top", ".4em");
    });
});

$(document).ready(function() {

    $("#ex1").click(function(){
        $(".signin").toggle();
         $("#signup_but").css("visibility", "visible");
        
    });

     $("#ex2").click(function(){
        $(".signup").toggle();
        $("#login_but").css("visibility", "visible");
    });

});

$(document).ready(function() {

    $("#menu").click(function(){
        // $("#off_left").css("overflow","visible")
        $("#user_show").css("left", "10em");
    });

    $("#ex3").click(function(){
        $("#user_show").css("left", "83em");
        // $("#off_left").css("overflow","hidden")
    });
});

$(document).ready(function() {

     $("#many").click(function(){
        $(".spread").toggleClass("one_vid");
        $(".ven").toggleClass("ven2");
        $(".con_date").toggleClass("con_date2");
    });

});

$(window).load(function() {
    var target = $(".content").offset().top;
    var interval = setInterval(function() {
        if ($(window).scrollTop() >= target) {
            $('#concert_header').addClass('stuck');
            $('.pillars_menu').addClass('hue');
        } else {
            $('#concert_header').removeClass('stuck');
            $('.pillars_menu').removeClass('hue');
        }
    }, 100);
});

