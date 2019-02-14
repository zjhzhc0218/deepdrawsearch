// JavaScript Document
window.Url=function(){
    var Url2='/deepsearch/';
    // var Url1 = window.location.href;
    // var Url2 = Url1.substring(0, Url1.indexOf('/', Url1.indexOf('://',0)+3));
    return Url2
}
var Url = window.Url();

function all(){
    //二维码位置
    if($(window).width()>1500){
        var leftWdith=($(window).width()-1200)/2+1215;
        $(".index_core").css("left",leftWdith)
        $(window).resize(function(){
            var leftWdith=($(window).width()-1200)/2+1215;
            $(".index_core").css("left",leftWdith)
        })
    }

    $(".index_his").click(function () {
        alert("该功能正在维护中！")
    })
    $(".footer_ab").click(function () {
        $("#weModal").css("display","block");
        $("#weModal").addClass("in")
        $(".all_bg").css("display","block");
    })
    $(".footer_cont").click(function () {
        $("#tellweModal").css("display","block");
        $("#tellweModal").addClass("in")
        $(".all_bg").css("display","block");
    })
    $("button.close,.modal-footer button").click(function(){
        $(".modal").stop(true).fadeOut(0);
        $(".modal").removeClass("in")
        $(".all_bg").stop(true).fadeOut(0);
    })
}
all();
$(".index_his").click(function () {
    alert("该功能正在维护中！")
})

// console.log(sessionStorage.getItem("user"))




//默认弹框样式
window.alert = function (msg){
    dialog.showTips(msg, "warn");
}
var dialog = {
    /*
     type为firm时，url传回调参数
     */
    showTips : function (msg,type,url){

        var htmlCon="";


        htmlCon='<div class="wap_tanc" style="display: block;">'+
            '<div class="wap_tanc_bg"></div>'+
            '<div class="wap_tanc_con" style="display: block;">'+
            '<h5>'+msg+'</h5>'+
            '<div class="wap_tanc_btn clearfix">'+
            '<a href="javascript:void(0)" style="width:100%;" class="close1">确定</a>'+
            '</div>'+
            '</div>'+
            '</div>';

        $('.wap_tanc').remove();
        $('body').append(htmlCon);
        var url_function = url;
        //$('body').prepend("pllp");

        $('.close1').click(function(){
            $('.wap_tanc').stop(true).fadeOut(300);
            $('.wap_tanc_con').stop(true).fadeOut(300);
            if(typeof url == "function" && type=='warn'){url_function();}
            return false;
        });

        $(".reload").click(function(){
            location.reload();
        });
        $(".continue").click(function (){
            // url();
            $('.close1').trigger("click");
        })



    }
}
//

var signLogin = function() {
    /*if($scope.username) {
        $http({
                method: 'post',
                url: '/deepsearch/removeSession',
                params: {},
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                transformRequest: function (data) {
                    var str = '';
                    for (var i in data) {
                        str += i + '=' + data[i] + '&';
                    }
                }
            }
        )
    }*/
    var url='/deepsearch/sign';
    location.href = url;
};