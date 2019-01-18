<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>用户注册</title>
    <link rel="shortcut icon" href="/codeimg/baima.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/tao/app.css"></head>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <link rel="stylesheet" href="/deepsearch/css/jigsaw.css">
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
	<script src="/deepsearch/js/extension.js"></script>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <#--<script src="https://cdn.jsdelivr.net/npm/vue"></script>-->
<style>
    .conta {
        width: 310px;
        margin:  auto;
    }
    #msg {
        width: 100%;
        line-height: 40px;
        font-size: 14px;
        text-align: center;
    }
    /*a:link,a:visited,a:hover,a:active {*/
        /*margin-left: 100px;*/
        /*color: #0366D6;*/
    /*}*/
    /*手机以及ipad隐藏*/
    @media (max-width: 1024px){
        .huakuai{
            display: none;
        }
    }
</style>
</head>
<style type="text/css">
    .index_frame{
        display: none!important;
    }
</style>

<body>
<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<div  ng-app="signup" ng-controller="signupController">
<#--<div class="header" style="background-color: #3367ef">-->
    <#--<div class="header-wrapper" style="margin-left: 5%">-->
        <#--<a class="left"  href="http://www.baimacha.com"><div class="logo"></div></a>-->
        <#--<span class="header-title">用户中心</span>-->
    <#--</div>-->


<#--</div>-->
<div class="passport">
    <div class="bk20"></div>
    <div class="wrapper">
        <div id="cas" class="main">
            <div id="content" class="main-body" style="width: 100%;height: 600px;" >
                <div style="width: 43%;height:580px;background-color: white;text-align: center;position: relative;float: left;top: 40px;left: 9%">
                    <img src="/codeimg/6.jpg" style="width: 450px;padding-top: 150px;">
                </div>
                <div id="form" style="margin-left: 52.1%;">
                    <div id="fm1" class="fm-v "  method="post" style="margin-top: 0;margin-left: 0;">
                        <div id="msg" class="errors"></div>
                        <h2>用户注册</h2>
                        <div class="row fl-controls-left" style="height: 42px;">
                            <label for="email" class="fl-label" style="line-height: 42px">手 机 号:</label>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="请输入手机号码" required="required" style="width: 310px"/>
                        </div>
                        <div class="row fl-controls-left" style="height: 42px;">
                            <label for="password" class="fl-label" style="line-height: 42px">密　  码:</label>
                            <input type="password" ng-model="password"  class="required password" name="p" placeholder="请输入6位以上密码" required="required" style="width: 310px"/>
                        </div>
                        <div class="row fl-controls-left" style="height: 42px;">
                            <label for="password" class="fl-label" style="line-height: 42px">再输密码:</label>
                            <input type="password" ng-model="passwordAgain"  class="required password" name="p" placeholder="请重复输入密码" required="required" style="width: 310px"/>
                        </div>

                        <div class="conta huakuai" style="margin-left: 86px;margin-bottom: 10px;height: 200px;width: 345px;">
                            <div id="captcha" style="position: relative;"></div>
                            <div id="msg" style=""></div>
                        </div>

                        <div class="row fl-controls-left" style="height: 42px;width: 410px;position: relative">
                            <label for="email" class="fl-label" style="line-height: 42px">手机验证:</label>
                            <input type="text" ng-model="showAuthCode" name="u" class="required text"  placeholder="请输入手机验证码" required="required" style="width:310px"/>
                            <button ng-bind="timing" ng-click="changeVerify()" style="text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);color: #000000;width: 56px;height: 42px;position: absolute;top: 0;right: 0"  ng-disabled="selected >= 0">
                        </div>

                        <div class="row btn-row" style="padding-top:10px;">
                            <input id="btn-login"  class="btn-submit"  type="button"  style="margin-left:100px"  value="确认" ng-click="registered()"  >
                            <span style="margin-left:20px;font-size:12px"> </span>
                            <input class="btn-submit" type="button" ng-click="openSign()"  value="返回" style="background:#f73">
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bk20"></div>
</div>

<#--<div class="footer" style="position:fixed;bottom:0;width:100%;background-color:#e5e5e5;height: 40px;line-height: 40px;padding: 0">-->
    <#--<p>杭州兴淘网络科技有限公司  浙ICP备18047066号</p>-->
<#--</div>-->
        <!--  / footer  -->
    <#include "//footer.ftl">
    <!--  / footer  -->
</div>

</body>
<script src="/deepsearch/js/layer/layer.js"></script>
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/angular/jquery.qrcode.min.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signupController.js"></script>
<script src="/deepsearch/js/jigsaw.js"></script>
<script src="/deepsearch/js/index.js"></script>
<script>
    //判断是否为ie浏览器
    var navigatorName = "Microsoft Internet Explorer";
    var isIE = false;
    if( navigator.appName == navigatorName ){
        isIE = true;
        $(".huakuai").stop(true).fadeOut(0)
    }
    jigsaw.init(document.getElementById('captcha'), function () {
        document.getElementById('msg').innerHTML = '登录成功！'
    })


</script>
</html>
