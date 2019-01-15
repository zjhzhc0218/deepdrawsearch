<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>用户登录</title>
    <link rel="shortcut icon" href="/codeimg/baima.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/tao/app.css"></head>
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
    <script src="/deepsearch/js/vue.min.js"></script>
</head>
<style type="text/css">
   /* body {
        color: black;
    }*/
</style>
<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<body ng-app="sign" ng-controller="signController">


<#--<div class="header" style="background-color: #3367ef">-->
    <#--<div class="header-wrapper" style="margin-left: 5%">-->
    <#--<a class="left"  href="http://www.baimacha.com"><div class="logo"></div></a>-->
    <#--<span class="header-title">用户中心</span>-->
<#--</div>-->

</div>
<div class="passport">
    <div class="bk20"></div>
    <div class="wrapper">
        <div id="cas" class="main">
            <div id="content" class="main-body" style="width: 100%;height: 800px" >
                <div class="float_weixin" style="right: 2%;position: absolute;">
                    <h4 style="margin-top: 35%">客服微信号：</h4>
                    <img src="/codeimg/codeImg.jpg" style="width: 110px">
                </div>
                <div style="width: 43%;height: 500px;background-color: white;text-align: center;position: relative;float: left;top: 40px;left: 9%;">
                    <img src="/codeimg/6.jpg" style="width: 450px;padding-top: 18%;">
                </div>
                <div id="form" style="position: relative;margin-left: 52.1%;">
                    <div id="fm1" class="fm-v "  method="post" style="position: absolute;width: 490px;margin-top: 0;top: 40px;height: 500px;">
                        <div id="msg" class="errors"></div>
                        <h2 style="margin-top: 18%;text-align: center">用户登录</h2>

                        <div class="row fl-controls-left" style="margin-left: 0;margin-top: 40px">
                            <p class="fl-label" style="line-height: 42px;color: black;font-size: 17px;">手机号:</p>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="手机号" required="required"/>
                        </div>

                        <div class="row fl-controls-left" style="margin-left: 0;">
                            <p class="fl-label" style="line-height: 42px;color: black;font-size: 17px;">密　码:</p>
                            <input type="password" ng-model="password"  class="required password" name="p" placeholder="密码" required="required"/>
                        </div>

                        <div class="row btn-row" style="padding-top:10px;margin-left: 0;">
                            <input id="btn-login" class="btn-submit"  type="button"  style="margin-left:100px"  value="登录" ng-click="sign()" >
                            <input class="btn-submit" type="button" ng-click="openSignup()"  value="注册" style="background:#f73">
                        </div>

                        <div class="row btn-row" style="margin-left: 0;">
                            <a href="#" ng-click="forgot()"  style="margin-left: 100px;color:#000;text-decoration: underline">忘记&nbsp;/&nbsp;修改密码？</a>
                        </div>

                    </>
                </div>
            </div>

        </div>

    </div>
    <div class="bk20"></div>
</div>
<div class="footer" style="position:fixed;bottom:0;width:100%;background-color:#e5e5e5;height: 40px;line-height: 40px;padding: 0">
    <p>杭州兴淘网络科技有限公司  浙ICP备18047066号</p>
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signController.js"></script>
<script src="/deepsearch/js/index.js"></script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?cd0084c107ed760839e9ae15fe18c8f9";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</html>
