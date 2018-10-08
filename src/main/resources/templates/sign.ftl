<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>sign</title>
    <link rel="stylesheet" type="text/css" href="/deepsearch/css/tao/app.css"></head>
	<#--<link rel="stylesheet" href="/deepsearch/css/normalize.css">-->
	<#--<link rel="stylesheet" href="/deepsearch/css/login.css">-->
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
</head>
<style type="text/css">
   /* body {
        color: black;
    }*/
</style>

<body ng-app="sign" ng-controller="signController">

<#--<div ng-controller="signController" class="sign">

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
</div>-->

<div class="header">
    <div class="header-wrapper" "="">

    <a href="https://www.taodaxiang.com/" class="left"><div class=""></div></a>
    <span class="header-title">用户中心</span>
    <div class="nav"> <label>卖家查询工具</label><span class="split">|</span><#--<a href="https://bbs.taodaxiang.com/">论坛</a>-->
    </div>
</div>

</div>
<div class="passport">
    <div class="bk20"></div>
    <div class="wrapper">
        <div id="cas" class="main">
            <div id="content" class="main-body" >
                <div id="form"  >
                    <div id="fm1" class="fm-v "  method="post">
                        <div id="msg" class="errors"></div>
                        <h2>登录</h2>
                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label">用户名:</label>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="用户名" required="required"/>

                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label">密　码:</label>

                            <input type="password" ng-model="password"  class="required password" name="p" placeholder="密码" required="required"/>
                            <#--<input id="password" name="password" class="required password" tabindex="2" accesskey="p" type="password" value="" size="25">-->
                        </div>
                       <#-- <div class="row fl-controls-left">
                            <label for="code" class="fl-label">验证码:</label>
                            <input id="code" name="code" class="required text" tabindex="3" accesskey="c" type="text" value="" size="4" maxlength="4" style="width:80px;float:left;margin-left:20px;">
                            <img src="./用户登陆 - 淘大象卖家工具箱_files/call.php" onclick="this.src=this.src+&#39;&amp;&#39;+Math.random()" style="float: left; margin-left: 10px; cursor: pointer; display: block;" onload="this.style.display=&#39;block&#39;" id="code_img">
                        </div>-->
                        <div class="row btn-row" style="padding-top:10px;clear:both;">
                            <#--<button  id="btn-login" ng-click="sign()" class="btn btn-primary btn-block btn-large" style="margin-left:100px" name="submit" accesskey="l" >登录</button>-->
                            <input id="btn-login" class="btn-submit"  type="button"  style="margin-left:100px"  value="登录" ng-click="sign()" >
                            <span style="margin-left:20px;font-size:12px">没有账号？</span>
                            <input class="btn-submit" type="button" ng-click="openSignup()"  value="免费注册" style="background:#f73">
                        </div>
                        <div class="row btn-row">
                            <a href="#" ng-click="forgot()"  style="text-decoration:none;margin-left: 100px;color:#000">忘记登录密码？</a>
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
<script type="text/javascript" src="/deepsearch/css/tao/base.js"></script>
<script type="text/javascript" src="/deepsearch/css/tao/login.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signController.js"></script>

</html>
