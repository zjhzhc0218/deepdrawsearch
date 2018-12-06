<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/tao/app.css"></head>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <link rel="stylesheet" href="/deepsearch/css/jigsaw.css">
<style>
    .container {
        width: 310px;
        margin:  auto;
    }
    #msg {
        width: 100%;
        line-height: 40px;
        font-size: 14px;
        text-align: center;
    }
    a:link,a:visited,a:hover,a:active {
        margin-left: 100px;
        color: #0366D6;
    }
</style>
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
                <div id="form" >
                    <div id="fm1" class="fm-v "  method="post" style="margin-top: 0px">
                        <div id="msg" class="errors"></div>
                        <h2>用户注册</h2>
                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label">手机号:</label>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="手机号" required="required" style="width: 310px"/>
                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label">密　码:</label>
                            <input type="password" ng-model="password"  class="required password" name="p" placeholder="密码" required="required" style="width: 310px"/>
                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label">再输密码:</label>
                            <input type="password" ng-model="passwordAgain"  class="required password" name="p" placeholder="再次输入密码" required="required" style="width: 310px"/>
                        </div>

                        <div class="container" style="margin-left: 70px;margin-bottom: 10px">
                            <div id="captcha" style="position: relative;"></div>
                            <div id="msg" style=""></div>
                        </div>

                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label">手机验证:</label>
                            <input type="text" ng-model="showAuthCode" name="u" class="required text"  placeholder="手机验证码" required="required" style="width: 310px"/>
                            <button ng-bind="timing" ng-click="changeVerify()" style="position: absolute;margin-left: 0;text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);color: #000000;width: 56px;height: 42px;margin-top: -30;top: 563px;left: 838px;"  ng-disabled="selected >= 0">
                        </div>

                        <#--<div class="row fl-controls-left">-->
                            <#--<label for="email" class="fl-label">手机验证:</label>-->
                            <#--<input type="text" ng-model="showAuthCode" name="u" class="required text"  placeholder="手机验证码" required="required"/>-->
                            <#--<button ng-bind="timing" ng-click="changeVerify()"  style=" margin-left:100px; text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #000000;"  ng-disabled="selected >= 0">-->
                        <#--</div>-->


                        <#--<div class="row btn-row" style="padding-top:10px;clear:both;">-->
                            <#--<input id="btn-login"  class="btn-submit"  type="button"  style="margin-left:100px"  value="注册" ng-click="registered()" >-->
                            <#--<span style="margin-left:20px;font-size:12px"> </span>-->
                            <#--<input class="btn-submit" type="button" ng-click="openSign()"  value="登录界面" style="background:#f73">-->
                        <#--</div>-->

                        <div class="row btn-row" style="padding-top:10px;clear:both;">
                            <input id="btn-login"  class="btn-submit"  type="button"  style="margin-left:100px"  value="注册" ng-click="registered()"  >
                            <span style="margin-left:20px;font-size:12px"> </span>
                            <input class="btn-submit" type="button" ng-click="openSign()"  value="登录界面" style="background:#f73">
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bk20"></div>
</div>
<div class="modal fade" id="tixing" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
        <div class="modal-dialog" role="document" style="width: 400px;height: 400px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size: 45px">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" style="color: red;font-size: 25px">温馨提醒：</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <label style="font-size: 20px ;text-align: center">新注册用户有10次体验使用次数</label></br>
                    <label style="font-size: 20px ;text-align: center">添加微信，获取永久查询次数</label>
                    <img src="/deepsearch/img/codeImg.jpg" style="width: 200px">
                </div>
                <div class="modal-footer">
                <#--<button type="button" class="btn btn-primary" ng-click="signLogin()">确认</button>-->
                    <input id="btn-login"  class="btn-submit"  type="button"  style="height: 36px;width: 71px"  value="我知道了" ng-click="registered()" >&nbsp;&nbsp;&nbsp;
                    <#--<input id="btn-login"  class="btn-submit"  type="button"  style="height: 36px;width: 71px"  value="暂不添加" ng-click="registered()" >-->
                </div>
            </div>
        </div>
    </div>
<div class="footer" style="position:fixed;bottom:0;width:100%;background-color:#e5e5e5;height: 40px;line-height: 40px;padding: 0">
    <p>杭州兴淘网络科技有限公司  浙ICP备18047066号</p>
</div>

</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/angular/jquery.qrcode.min.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signupController.js"></script>
<script src="/deepsearch/js/jigsaw.js"></script>
<script>
    jigsaw.init(document.getElementById('captcha'), function () {
        document.getElementById('msg').innerHTML = '登录成功！'
    })
</script>
</html>
