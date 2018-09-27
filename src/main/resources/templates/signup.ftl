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
                    <div  class="signup " style="text-align: center">
                        <h1>注册</h1>
                        <input type="text" ng-model="name" name="u" placeholder="手机号" required="required"/>
                        <input type="password" ng-model="password" name="p" placeholder="密码" required="required"/>


                        <input type="text" placeholder="区分大小写" class="js5-form3-input" id="js5-form3-input" ng-model="writeCode"  maxlength="6" ng-keyup="mykey($event)">
                        <#--<div class="form-group" style="width: 400px">
                            <input type="text"  class="js5-authCode" value=""  style="width: 200px" id="js5-authCode" ng-model="showAuthCode"  disabled="disabled" >
                            <!--disabled="disabled"禁止验证码框文字被选中&ndash;&gt;
                            <button  class="btn btn-primary btn-block btn-large " style="width: 100px" ng-click="changeVerify()">获取</button>
                        </div>-->
                        <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                            <div class=" col-md-8">
                                <input type="text" class="js5-authCode" value=""  style="width: 99%;font-size: 18px;text-align: center"  ng-model="showAuthCode"  disabled="disabled" ></input>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style=" width: 98%; height: 41px;" ng-click="changeVerify()">获取</button>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                            <div class=" col-md-8">
                                <input type="text" placeholder="请输入邀请码" class="js5-form3-input"  ng-model="signCode"   ng-model="signCode">
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style=" width: 98%; height: 41px;" ng-mouseenter="down()" ng-mouseleave="over()">扫二维码获取</button>
                            </div>
                        </div>

                        <div id="codeUrl" style="width: 200px;height: 200px;background-color: white; left: 98%;;top: 301px;border-radius:3px;width: 200px;position: absolute; height: 200px;display: none">
                            <img  style="width: 198px;height:198px;"src="/deepsearch/img/codeImg.png">
                        </div>
                        <button  ng-click="registered()" class="btn btn-primary btn-block btn-large">注册</button>
                        <button  ng-click="openSign()" class="btn btn-primary btn-block btn-large">登录账号</button>
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