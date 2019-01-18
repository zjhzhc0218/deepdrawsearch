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
<body ng-app="search" ng-controller="searchController">
<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<!--  / warpper  -->
    <div class="warpper">
        <div class="container">
            <div class="all_nav">
                您当前的位置：<a href="index">白马查</a>><a>展现查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>展现查询</p>
                </div>
                <div class="toolALL_con">
                    <!-- 淘宝展现结束 -->
                    <div role="tabpanel" class="tab-pane" class="content" id="zhanxian">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"   ng-model="zhanxian.searchWordsXy" id="showinput"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchZhanxian()" ng-disabled="zhanxian.working">查询</button>
                        </div>

                        <div class="search-info" id="zhanxianRs" style="width: 75%;margin:0 auto">
                            <div style="width: 90%" ng-if="zhanxian.msg == null " ng-show="zhanxian.vm.value!=0&&zhanxian.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': zhanxian.vm.striped}">
                                    <div ng-class="['progress-bar', zhanxian.vm.style]" ng-style="{width: zhanxian.vm.value + '%'}">
                                        <div ng-if="zhanxian.vm.showLabel" ng-bind="zhanxian.vm.value+'%'" ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-show="zhanxian.msg != null"  ng-bind="zhanxian.msg">
                            </div>
                            <div href="javascript:;" ng-show="zhanxian.examedContext != null" class="info-item">
                                <div class="zhanxian_con">
                                    <div class="zhanxian_box clearfix">
                                        <a href="{{zhanxian.examedContext.a_href}}" target="_blank" ><img ng-src="{{zhanxian.examedContext.img}}"></a>
                                        <div class="zhanxian_box_text"><p  ng-bind="zhanxian.examedContext.text"></p></div>
                                    </div>
                                    <div class="zhanxian_list"><span ng-repeat="item in zhanxian.examedContext.content" ng-bind="item"></span></div>
                                </div>
                                <#--<div class="reductionIndex" id="dsr">-->

                                <#-- <div>
                                        <h5 style="display: inline">销售金额：</h5>
                                        <h1 ng-if="zhishu.searchWordsXy<=2100">交易指数过小</h1>
                                        <h1 ng-if="zhishu.searchWordsXy>2100" id="item_score" ng-bind="zhishu.examedContext"></h1>
                                    </div>
                                    <h5>交易指数： <span class="count" id="item_score" ng-bind="zhishu.searchWordsXy"></span></h5>-->
                                <#--</div>-->
                            </div>
                        </div>
                    </div>
                    <!-- 淘宝展现结束 -->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">为什么要用展现查询</h5>
                            <div class="toolALL_info_text">
                                <p>根据旺旺或者宝贝ID查询电脑端或者无线端的展现词,分析同行或者自己的流量入口！</p>
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
  /*  var str =window.location.href;
    str2 = str.match(/id=(\d*)/);
    // alert(str2[1])
    if(str2){
        var str3=str2;
        $("#showinput").val(str3)
    }*/
    // document.getElementById('#showinput').value=str2[1];
</script>
</html>