// JavaScript Document

function all(){
	var leftWdith=($(window).width()-1200)/2+1200;
    $(".index_core").css("left",leftWdith)
    $(window).resize(function(){
    	var leftWdith=($(window).width()-1200)/2+1200;
    	$(".index_core").css("left",leftWdith)
    })
}