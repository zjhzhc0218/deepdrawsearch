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
<body ng-app="history" ng-controller="historyController">
<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<!--  / warpper  -->
    <div class="warpper">
        <div class="container">
            <div class="all_nav">
                您当前的位置：<a href="index">白马查</a>><a>历史价格查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>历史价格查询</p>
                </div>
                <div class="toolALL_con">
                    <!-- 历史价格查询 -->
                    <div role="tabpanel" class="tab-pane" class="content">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"   ng-model="searchWordsHistory" id="showinput"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
                            <button class="btn search-btnN"  ng-click="searchHistory()" >查询</button>
                        </div>


                    </div>

                    <div class="search-info" id="jqrs" >
                        <div style="width: 100%" ng-if="history.msg == null " ng-show="history.vm.value!=0&&history.vm.value!=100">
                            <div ng-class="{progress: true, 'progress-striped': history.vm.striped}">
                                <div ng-class="['progress-bar', history.vm.style]" ng-style="{width: history.vm.value + '%'}">
                                    <div ng-if="history.vm.showLabel"  ng-bind="history.vm.value+'%'"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="search-info" >
                        <div class="noViolation " ng-show="history.msg != null" style="color: red;font-size: 30px" ng-bind="history.msg">
                        </div>
                    </div>

                    <!-- 历史价格结果界面 -->

                    <div class="history_result" ng-show="history.examedContext != null">
                        <div class="history_result_tit3">
                            <div class="history_result_tit3_tit">查询结果</div>
                            <div class="history_result_box3 clearfix">
                                <div class="history_result3_img"><img ng-src="{{history.examedContext.dp_info.img}}" width="100%"></div>
                                <div class="history_result3_text" ng-bind="history.examedContext.dp_info.title"></div>
                            </div>
                        </div>

                        <div class="history_result_tit clearfix">
                            <h2 class="tit">历史最低</h2>
                            <div class="history_result_right">
                                <span ng-click="switchDay(1)">全部</span><span class="active" ng-click="switchDay(2)">180天</span><span ng-click="switchDay(3)">60天</span><span ng-click="switchDay(4)">30天</span>
                            </div>
                        </div>
                        <div class="history_result_tit2">
                            价格：<span class="high">最高<font ng-bind="high"></font></span><span class="low">最低<font ng-bind="low"></font></span>
                        </div>
                        <div id="his_result">

                        </div>
                    </div>
                    <!-- 历史价格结果界面 -->
                    <!-- 历史价格查询 -->
                    <#--<div class="toolALL_info">-->
                        <#--<div class="toolALL_info_box">-->
                            <#--<h5 class="toolALL_info_tit">历史价格查询数据正在维护中！</h5>-->
                            <#--<div class="toolALL_info_text">-->
                                <#--<p>xxxxxx</p>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</div>-->
                </div>
            </div>
        </div>
    </div>
<!--  / warpper  -->
<!--  / footer  -->
<#include "//footer.ftl">
<!--  / footer  -->
</body>
<script src="/deepsearch/js/echarts.common.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="/deepsearch/js/spop/spop.min.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="/deepsearch/js/historyController.js"></script>
<script src="/deepsearch/js/jquery.scrollstop.min.js"></script>
<script src="/deepsearch/js/index.js"></script>
<script>
    $(function () {
        $(".history_result_right span").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        })
    })
</script>
</html>