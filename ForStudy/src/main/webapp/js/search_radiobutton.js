$(".expander").click(function() {
	  $(this).next().toggleClass("open");
	  $(this).toggleClass("active");
	});
$(function(){
$('#rb1').click(function(){
    $('#rb1-1').slideToggle("slow");
    $("#rb2-1").slideUp( 0, '');
    $("#rb3-1").slideUp( 0, '');
    $("#rb4-1").slideUp( 0, '');
    $("#rb5-1").slideUp( 0, '');
    $("#rb6-1").slideUp( 0, '');
    $(this).toggleClass("active");
});
});
$(function(){
$('#rb2').click(function(){
    $('#rb2-1').slideToggle("slow");
    $("#rb1-1").slideUp( 0, '');
    $("#rb3-1").slideUp( 0, '');
    $("#rb4-1").slideUp( 0, '');
    $("#rb5-1").slideUp( 0, '');
    $("#rb6-1").slideUp( 0, '');
    $(this).toggleClass("active");   
});
});
$(function(){
$('#rb3').click(function(){
    $('#rb3-1').slideToggle("slow");
    $("#rb1-1").slideUp( 0, '');
    $("#rb2-1").slideUp( 0, '');
    $("#rb4-1").slideUp( 0, '');
    $("#rb5-1").slideUp( 0, '');
    $("#rb6-1").slideUp( 0, '');
    $(this).toggleClass("active");
});
});
$(function(){
$('#rb4').click(function(){
    $('#rb4-1').slideToggle("slow");
    $("#rb1-1").slideUp( 0, '');
    $("#rb2-1").slideUp( 0, '');
    $("#rb3-1").slideUp( 0, '');
    $("#rb5-1").slideUp( 0, '');
    $("#rb6-1").slideUp( 0, '');
    $(this).toggleClass("active");
});
});
$(function(){
$('#rb5').click(function(){
    $('#rb5-1').slideToggle("slow");
    $("#rb1-1").slideUp( 0, '');
    $("#rb2-1").slideUp( 0, '');
    $("#rb3-1").slideUp( 0, '');
    $("#rb4-1").slideUp( 0, '');
    $("#rb6-1").slideUp( 0, '');
    $(this).toggleClass("active");
});
});
$(function(){
$('#rb6').click(function(){
    $('#rb6-1').slideToggle("slow");
    $("#rb1-1").slideUp( 0, '');
    $("#rb2-1").slideUp( 0, '');
    $("#rb3-1").slideUp( 0, '');
    $("#rb4-1").slideUp( 0, '');
    $("#rb5-1").slideUp( 0, '');
    $(this).toggleClass("active");
});
});