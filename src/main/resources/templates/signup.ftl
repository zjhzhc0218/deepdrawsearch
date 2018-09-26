<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>sign</title>
	<link rel="stylesheet" href="/deepsearch/css/normalize.css">
	<link rel="stylesheet" href="/deepsearch/css/login.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
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
                        <input type="text" ng-model="name" name="u" placeholder="用户名" required="required"
                               pattern="^[0-9]{1,11}$"/>
                        <div ng-messages="signup.name.$error">
                            <div ng-message="required">用户名必须填写.</div>
                            <div ng-message="md-maxlength">手机号码11位</div>
                            <div ng-message="pattern">用户名是手机号码，应全部由数字组成.</div>
                        </div>
                        <input type="password" ng-model="password" name="p" placeholder="密码" required="required"
                               pattern="^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{8,25}$"/>
                        <div ng-messages="signup.password.$error">
                            <div ng-message="required">密码必须填写.</div>
                            <div ng-message="pattern">密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</div>
                        </div>

                        <input type="text" placeholder="不区分大小写" class="js5-form3-input" id="js5-form3-input" ng-model="writeCode"  maxlength="6" ng-keyup="mykey($event)">
                        <#--<div class="form-group" style="width: 400px">
                            <input type="text"  class="js5-authCode" value=""  style="width: 200px" id="js5-authCode" ng-model="showAuthCode"  disabled="disabled" >
                            <!--disabled="disabled"禁止验证码框文字被选中&ndash;&gt;
                            <button  class="btn btn-primary btn-block btn-large " style="width: 100px" ng-click="changeVerify()">获取</button>
                        </div>-->
                        <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                            <div class=" col-md-8">
                                <input type="text" class="js5-authCode" value=""  style="width: 394px" id="js5-authCode" ng-model="showAuthCode"  disabled="disabled" ></input>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style=" width: 181px; height: 41px;" ng-click="changeVerify()">获取</button>
                            </div>
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
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signupController.js"></script>

</html>
