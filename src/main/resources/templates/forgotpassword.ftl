<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>用户改密</title>
    <link rel="shortcut icon" href="/deepsearch/img/baima.ico" type="image/x-icon"/>
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
        <a href="#" class="left"  href="http://www.baimacha.com"><div class="logo"></div></a>
        <span class="header-title">用户中心</span>
    </div>
</div>

<div class="passport">
    <div class="bk20"></div>
    <div class="wrapper">
        <div id="cas" class="main">
            <div id="content" class="main-body" style="width: 100%;height: 800px" >

                <div style="width: 43%;height: 500px;background-color: white;text-align: center;position: relative;float: left;top: 40px;left: 9%;">
                    <img src="/deepsearch/img/6.jpg" style="width: 450px;padding-top: 18%;">
                </div>

                <div id="form"  style="margin-left: 52.1%;padding-top: 0;">
                    <div id="fm1" class="fm-v "  method="post" style="height: 500px">

                        <div id="msg" class="errors"></div>

                        <h2 style="margin-top: 15%;text-align: center">忘记密码</h2>

                        <div class="row fl-controls-left" style="height: 42px;margin-left: 50px;margin-top: 25px">
                            <p for="email" class="fl-label" style="line-height: 42px;color: black;font-size: 16px;">手 机 号:</p>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="请输入注册的手机号" required="required"/>
                        </div>

                     <#--<div class="row fl-controls-left">-->
                         <#--<label for="email" class="fl-label">手机验证:</label>-->
                         <#--<input type="text" ng-model="showAuthCode" name="u" class="required text"  placeholder="手机验证码" required="required"/>-->
                         <#--<button ng-bind="timing" ng-click="changeVerify()"  style=" margin-left:100px; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #000000;"  ng-disabled="selected >= 0">-->
                     <#--</div>-->

                    <div class="row fl-controls-left" style="height: 42px;width: 370px;position: relative;margin-left: 50px;">
                        <p for="email" class="fl-label" style="line-height: 42px;color: black;font-size: 16px;">手机验证:</p>
                        <input type="text" ng-model="showAuthCode" name="u" class="required text"  placeholder="请输入手机验证码" required="required" style="width:270px"/>
                        <button ng-bind="timing" ng-click="changeVerify()" style="text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);color: #000000;width: 56px;height: 42px;position: absolute;top: 0;right: 0"  ng-disabled="selected >= 0">
                    </div>

                    <div class="row fl-controls-left" style="height: 42px;margin-left: 50px;">
                        <p for="password" class="fl-label" style="line-height: 42px;color: black;font-size: 16px;">密  　码:</p>
                        <input type="password" ng-model="passwordAgain1"  class="required password" name="p" placeholder="请输入要修改的密码" required="required"/>
                    </div>

                    <div class="row fl-controls-left" style="height: 42px;margin-left: 50px;">
                        <p for="password" class="fl-label" style="line-height: 42px;color: black;font-size: 16px;">确认密码:</p>
                        <input type="password" ng-model="passwordAgain2"  class="required password" name="p" placeholder="请再次确认修改密码" required="required"/>
                    </div>

                    <div class="row btn-row"  style="height: 42px;margin-left: 73px;margin-top: 15px">
                        <input id="btn-login" class="btn-submit"  type="button"  style="margin-left:100px"  value="确认" ng-click="forgot()" >
                        <span style="margin-left:20px;font-size:12px"> </span>
                        <input class="btn-submit" type="button" ng-click="openSign()"  value="返回" style="background:#f73">
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
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/forgotpasswordController.js"></script>

</html>
