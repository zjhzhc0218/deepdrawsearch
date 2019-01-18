<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10,IE=11">
        <meta http-equiv="X-UA-Compatible" content="IE=8,9,10,11">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <meta name="format-detection" content="telephone=no" />
        <link rel="shortcut icon" href="/codeimg/baima.ico" />
        <title>白马查--电商在线查询工具</title>
        <meta name="keywords" content=" " />
        <meta name="description" content=" " />
        <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/deepsearch/css/index.css">
        <link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
	<script src="/deepsearch/js/extension.js"></script>
        <link rel="stylesheet" type="text/css" href="/deepsearch/css/common.css">
        <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
        <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
        <link rel="stylesheet" href="https://3.swiper.com.cn/dist/css/swiper.min.css">
        <script src="https://3.swiper.com.cn/dist/js/swiper.min.js"></script>
        <#--<script src="https://cdn.jsdelivr.net/npm/vue"></script>-->
        <#--<script src="/deepsearch/js/pagination.js"></script>-->
        <!--[if lte IE 9]>
        <script src="/deepsearch/js/respond.min.js"></script>
        <script src="/deepsearch/js/html5shiv.js"></script>
        <![endif]-->

    </head>
    <style type="text/css">
        .error{
            font-size: 22px;
            color:red;
        }
    </style>
<body ng-app="search" ng-controller="searchController">
<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<!--  / warpper  -->
    <div class="warpper">
        <div class="container">
            <div class="all_nav">
                    您当前的位置：<a href="index">白马查</a>><a>违禁词查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>违禁词查询</p>
                </div>
                <div class="toolALL_con">
                    <div class="prohibited_con clearfix">
                        <div class="prohibited_left">
                            <div class="prohibited_box left">
                                <textarea ng-model="searchWordsWjc" placeholder="在此粘贴文案,按动上方按钮后，根据文稿长短，请您耐心等待5-45秒"></textarea>
                            </div>
                            <div class="prohibited_left_tit" >
                                <h5 class="box" ng-click="searchWjc()"><img src="/deepsearch/images/search2.png"> <span>点击查询</span></h5>
                            </div>
                        </div>
                        <div class="prohibited_left">
                            <div class="prohibited_box right">
                                <div class="prohibited_box_son" ng-bind-html="app.examedContext | to_trusted" disabled></div>
                            </div>
                            <div class="prohibited_left_tit">
                                <h5 class="box2"><img src="/deepsearch/images/tips.png"> 新广告法禁用词已用<span style="color: #ff4800">橙色</span>高亮字体标出,请您参考修改，审慎发布</h5>
                            </div>
                        </div>
                    </div>
                    <#--<div role="tabpanel" class="tab-pane" class="content" id="weijin" style="">-->
                        <#--<div class="search-view" style="margin-top: 30px">-->
                            <#--<textarea  ng-show="app.hideDetail == false" ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 &quot;查询&quot; 按钮">-->
                            <#--</textarea>-->
                            <#--<div class="wordShowC"  ng-show="app.hideDetail == true" ng-bind-html="app.examedContext | to_trusted">-->
                            <#--</div>-->
                            <#--<button class="btn search-btnN" ng-show="app.hideDetail == false" href="javascript:;" ng-click="searchWjc()" ng-disabled="app.working" >查询</button>-->
                            <#--<button class="btn search-btnB" ng-show="app.hideDetail == true"  href="javascript:;" ng-click="hideDetail()"  >继续检测</button>-->
                        <#--</div>-->


                        <div class="search-info" id="wjcrs" >
                            <div style="width: 100%"  ng-show="app.vm.value!=0&&app.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': app.vm.striped}">
                                    <div ng-class="['progress-bar', app.vm.style]" ng-style="{width: app.vm.value + '%'}">
                                        <div ng-if="app.vm.showLabel" ng-bind="app.vm.value+'%'"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <#--</div>-->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">淘宝违禁词/敏感词/新广告法违禁词检测工具</h5>
                            <div class="toolALL_info_text">
                                <p> 已收录各类违禁词、敏感词超过20000个，且词库还在不断更新中。</font></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--  / warpper  -->
<!--  / footer  -->
<#include "//footer.ftl">
<!--  / footer  -->
</body>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="/deepsearch/js/spop/spop.min.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="/deepsearch/js/searchController.js"></script>
<script src="/deepsearch/js/jquery.scrollstop.min.js"></script>
<script src="/deepsearch/js/index.js"></script>
<script>

</script>
</html>