<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>sign</title>
	<link rel="stylesheet" href="/css/normalize.css">
	<link rel="stylesheet" href="/css/login.css">
</head>

<body ng-app="sign">

<div ng-controller="signController" class="sign">
	<h1>sign/登录</h1>
	<input type="text" ng-model="name" name="u" placeholder="用户名" required="required"
		   pattern="^[0-9]{1,11}$"/>
	<div ng-messages="sign.name.$error">
		<div ng-message="required">用户名必须填写.</div>
		<div ng-message="md-maxlength">手机号码11位</div>
		<div ng-message="pattern">用户名是手机号码，应全部由数字组成.</div>
	</div>
	<input type="password" ng-model="password" name="p" placeholder="密码" required="required"
		   pattern="^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{8,25}$"/>
	<div ng-messages="sign.password.$error">
		<div ng-message="required">密码必须填写.</div>
		<div ng-message="pattern">密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</div>
	</div>

	<button  ng-click="sign()" class="btn btn-primary btn-block btn-large">登录</button>
	<button  ng-click="forgot()" class="btn btn-primary btn-block btn-large">忘记密码</button>
	<button  ng-click="openSignup()" class="btn btn-primary btn-block btn-large">Create an account/注册账号</button>
</div>



</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/js/angular/angular.js"></script>
<script src="/js/angular/encrypt.js"></script>
<script src="/js/signController.js"></script>

</html>
