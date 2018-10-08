<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>sign</title>
	<link rel="stylesheet" href="/deepsearch/css/normalize.css">
	<link rel="stylesheet" href="/deepsearch/css/login.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
</head>
<style type="text/css">
    body {
        color: black;
    }
</style>

<body ng-app="sign">

<div ng-controller="signController" class="sign">

    <div  class="container-fluid" >
        <div class="row"  >
            <div class="col-md-4" >
            </div>
            <div class="col-md-4"  style="margin-top: 9%;text-align: center;color: #e3e2e2;">
				<h1>sign/登录</h1>
				<input type="text" ng-model="name" name="u" placeholder="用户名" required="required"/>

				<input type="password" ng-model="password" name="p" placeholder="密码" required="required"/>


				<button  ng-click="sign()" class="btn btn-primary btn-block btn-large">登录</button>
				<button  ng-click="forgot()" class="btn btn-primary btn-block btn-large">忘记密码</button>
				<button  ng-click="openSignup()" class="btn btn-primary btn-block btn-large">Create an account/注册账号</button>
			</div>
        </div>
        <div class="col-md-4" >


        </div>
    </div>
</div>



</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signController.js"></script>

</html>
