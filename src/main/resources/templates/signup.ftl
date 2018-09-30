<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>sign</title>
	<link rel="stylesheet" href="/deepsearch/css/normalize.css">
	<link rel="stylesheet" href="/deepsearch/css/login.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>

</head>
<style type="text/css">
    body {
        color: black;
    }
</style>
<body ng-app="signup">

<div  ng-controller="signupController">
    <div  class="container-fluid" >
                    <div class="row"  >
                        <div class="col-md-4" >
                        </div>
                        <div class="col-md-4" style="margin-top: 9%;" >
                        <div  class="signup " style="text-align: center;color: #e3e2e2;">
                        <h1>注册</h1>

                        <input type="text" style="margin-top: 5px;margin-bottom: 5px" ng-model="name" name="u" placeholder="手机号" required="required"/>

                            <input type="password" style="margin-top: 5px;margin-bottom: 5px" ng-model="password" name="p" placeholder="密码" required="required"/>

                            <input type="password" style="margin-top: 5px;margin-bottom: 5px" ng-model="passwordAgain" name="p" placeholder="再次输入密码" required="required"/>

                        <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                            <div class=" col-md-8">
                                <input type="text" placeholder="获取手机验证码"  class="js5-form3-input"    ng-model="showAuthCode"></input>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style=" width: 98%; height: 41px;" ng-click="changeVerify()">获取</button>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                            <div class=" col-md-8">
                                <input type="text" placeholder="请输入邀请码" class="js5-form3-input"  ng-model="signCode" ></input>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style=" width: 98%; height: 41px;" ng-mouseenter="down()" ng-mouseleave="over()">扫二维码获取</button>
                            </div>
                        </div>

                        <div id="codeUrl" style="width: 200px;height: 200px;background-color: white; left: 98%;;top: 301px;border-radius:3px;width: 200px;position: absolute; height: 200px;display: none">
                            <img  style="width: 198px;height:198px;"src="/deepsearch/img/codeImg.png">
                        </div>



                        <button  ng-click="registered()" class="btn btn-primary btn-block btn-large">确认注册</button>
                        <button  ng-click="openSign()" class="btn btn-primary btn-block btn-large">（已有账号）登录账号</button>
                    </div>
                </div>
                <div class="col-md-4" >


                </div>
            </div>
    </div>
</div>



</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/angular/jquery.qrcode.min.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signupController.js"></script>
</html>
