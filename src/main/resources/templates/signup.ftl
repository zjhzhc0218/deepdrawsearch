<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/tao/app.css"></head>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
</head>
<style type="text/css">
    /*body {*/
        /*color: black;*/
    /*}*/
</style>
<body ng-app="signup" ng-controller="signupController">


<div class="header" style="background-color: #3367ef">
    <div class="header-wrapper" >
        <a href="#" class="left"><div class="logo"></div></a>
        <span class="header-title">用户中心</span>
    </div>


</div>
<div class="passport">
    <div class="bk20"></div>
    <div class="wrapper">
        <div id="cas" class="main">
            <div id="content" class="main-body" style="width: 100%;height: 650px" >
                <div id="form"  >
                    <div id="fm1" class="fm-v "  method="post">
                        <div id="msg" class="errors"></div>
                        <h2>用户注册</h2>
                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label">手机号:</label>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="手机号" required="required"/>
                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label">密　码:</label>
                            <input type="password" ng-model="password"  class="required password" name="p" placeholder="密码" required="required"/>
                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label">再输密码:</label>
                            <input type="password" ng-model="passwordAgain"  class="required password" name="p" placeholder="再次输入密码" required="required"/>
                        </div>
                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label">手机验证:</label>
                            <input type="text" ng-model="showAuthCode" name="u" class="required text"  placeholder="手机验证码" required="required"/>
                            <button ng-bind="timing" ng-click="changeVerify()"  style=" margin-left:100px; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #000000;"  ng-disabled="selected >= 0">
                        </div>

                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label">邀请码验证:</label>
                            <input type="text" ng-model="signCode" name="u" class="required text"  placeholder="邀请码" required="required"/>
                            <button style="margin-left:100px;" ng-mouseenter="down()" ng-mouseleave="over()">扫二维码查看空间背景图片获取邀请码</button>
                            <div id="codeUrl" style="width: 200px;height: 200px;background-color: white; left: 55%;;top: 301px;border-radius:3px;width: 200px;position: absolute; height: 200px;display: none">
                                <img  style="width: 198px;height:198px;"src="/deepsearch/img/codeImg.jpg">
                            </div>
                        </div>


                        <div class="row btn-row" style="padding-top:10px;clear:both;">
                            <input id="btn-login"  class="btn-submit"  type="button"  style="margin-left:100px"  value="注册用户" ng-click="registered()" >
                            <span style="margin-left:20px;font-size:12px"> </span>
                            <input class="btn-submit" type="button" ng-click="openSign()"  value="登录界面" style="background:#f73">
                        </div>

                    </>
                </div>
            </div>
        </div>
    </div>
    <div class="bk20"></div>
</div>
<div class="footer">
    <p>© 2014-2018 深绘 版权所有</p>
</div>

</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/angular/jquery.qrcode.min.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signupController.js"></script>
</html>
