// JavaScript Document

function all(){
	var leftWdith=($(window).width()-1200)/2+1215;
    $(".index_core").css("left",leftWdith)
    $(window).resize(function(){
    	var leftWdith=($(window).width()-1200)/2+1215;
    	$(".index_core").css("left",leftWdith)
    })

}
console.log(sessionStorage.getItem("user"))

