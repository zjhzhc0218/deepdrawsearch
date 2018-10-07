<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>忘记密码</title>
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

<div ng-controller="signupController" class="signup">
    <div  class="container-fluid" >
        <div class="row"  >
            <div class="col-md-4" >
            </div>
            <div class="col-md-4" style="margin-top: 9%;text-align: center;color: #e3e2e2;">
                <h1>忘记密码</h1>
                <#--<input type="text" ng-model="name" name="u" placeholder="用户名" required="required"/>-->

                <#--<input type="password" ng-model="password" name="p" placeholder="原密码" required="required"/>-->


                    <#--<input type="text" ng-model="name" name="u" placeholder="用户名" required="required"/>-->


                <input type="text" style="margin-top: 5px;margin-bottom: 5px" ng-model="name" name="u" placeholder="手机号" required="required"/>

                <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                    <div class=" col-md-8">
                        <input type="text" placeholder="获取手机验证码"  class="js5-form3-input"    ng-model="showAuthCode"></input>
                    </div>
                    <div class="col-md-4">
                        <button ng-bind="timing" ng-click="changeVerify()" class="btn btn-primary" style=" width: 98%; height: 41px;"  ng-disabled="selected >= 0"></button>

                    </div>
                </div>

                <input type="password" style="margin-top: 5px;margin-bottom: 5px" ng-model="passwordAgain1" name="p" placeholder="密码" required="required"/>

                <input type="password" style="margin-top: 5px;margin-bottom: 5px" ng-model="passwordAgain2" name="p" placeholder="再次输入密码" required="required"/>

                <#--<div class="row" style="margin-top: 5px;margin-bottom: 5px">-->
                    <#--&lt;#&ndash;<input type="password" style="margin-top: 5px;margin-bottom: 5px" ng-model="password" name="p" placeholder="密码" required="required"/>&ndash;&gt;-->
                    <#--<input type="password" style="margin-top: 5px;margin-bottom: 5px"  ng-model="passwordAgain1" name="p" placeholder="新密码" required="required"/>-->
                <#--</div>-->

                <#--<div class="row" style="margin-top: 5px;margin-bottom: 5px">-->
                    <#--<input type="password" ng-model="passwordAgain2" name="p" placeholder="再次输入密码" required="required"/>-->
                <#--</div>-->

                <#--<input type="password" ng-model="passwordAgain1" name="p" placeholder="新密码" required="required"/>-->


                <#--<input type="password" ng-model="passwordAgain2" name="p" placeholder="再次输入密码" required="required"/>-->


                <button  ng-click="forgot()" class="btn btn-primary btn-block btn-large">忘记密码</button>
                <button  ng-click="openSign()" class="btn btn-primary btn-block btn-large">返回登录界面</button>
            </div>
            <div class="col-md-4"  >
			</div>
</div>



</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/forgotpasswordController.js"></script>

</html>
