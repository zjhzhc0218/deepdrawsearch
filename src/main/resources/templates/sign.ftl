<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>用户登录</title>
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


<div class="header" style="background-color: #3367ef">
    <div class="header-wrapper" >
    <a class="left"  href="http://www.baimacha.com"><div class="logo"></div></a>
    <span class="header-title">用户中心</span>
</div>

</div>
<div class="passport">
    <div class="bk20"></div>
    <div class="wrapper">
        <div id="cas" class="main">
            <div id="content" class="main-body" style="width: 100%;height: 650px" >
                <div id="form"  >
                    <div id="fm1" class="fm-v "  method="post" style="width: 490px">
                        <div id="msg" class="errors"></div>
                        <h2>用户登录</h2>
                        <div class="row fl-controls-left">
                            <label for="email" class="fl-label" style="line-height: 42px">手机号:</label>
                            <input type="text" ng-model="name" name="u" class="required text" placeholder="手机号" required="required"/>

                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label" style="line-height: 42px">密　码:</label>

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
                            <input class="btn-submit" type="button" ng-click="openSignup()"  value="注册" style="background:#f73">
                        </div>
                        <div class="row btn-row">
                            <a href="#" ng-click="forgot()"  style="margin-left: 100px;color:#000;text-decoration: underline">忘记&nbsp;/&nbsp;修改密码？</a>
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
<#--<script type="text/javascript" src="/deepsearch/css/tao/base.js"></script>-->
<#--<script type="text/javascript" src="/deepsearch/css/tao/login.js"></script>-->
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/angular/encrypt.js"></script>
<script src="/deepsearch/js/signController.js"></script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?cd0084c107ed760839e9ae15fe18c8f9";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</html>
