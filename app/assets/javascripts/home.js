$(document).ready(function(){


	$('.submit').mouseover(function(){
		$(this).css("height", "2.3em");
		$(this).css("width", "2.3em");
	});

	$('.submit').mouseleave(function(){
		$(this).css("height", "2em");
		$(this).css("width", "2em");
	});
});