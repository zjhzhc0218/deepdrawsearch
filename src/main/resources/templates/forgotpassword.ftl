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

<div ng-controller="signupController" class="signup">
    <div  class="container-fluid" >
        <div class="row"  >
            <div class="col-md-4" >
            </div>
            <div class="col-md-4" style="margin-top: 9%;text-align: center;color: #e3e2e2;">
                <h1>找回密码</h1>
                <input type="text" ng-model="name" name="u" placeholder="用户名" required="required"/>

                <input type="password" ng-model="password" name="p" placeholder="原密码" required="required"/>


                <input type="password" ng-model="passwordAgain1" name="p" placeholder="新密码" required="required"/>


                <input type="password" ng-model="passwordAgain2" name="p" placeholder="再次输入密码" required="required"/>


                <button  ng-click="forgot()" class="btn btn-primary btn-block btn-large">修改密码</button>
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
<script src="/deepsearch/js/forgotpasswordController.js"></script>

</html>
