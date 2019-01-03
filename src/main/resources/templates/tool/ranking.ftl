<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10,IE=11">
        <meta http-equiv="X-UA-Compatible" content="IE=8,9,10,11">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <meta name="format-detection" content="telephone=no" />
        <link rel="shortcut icon" href="/deepsearch/images/dzlogo.ico" />
        <title>index</title>
        <meta name="keywords" content=" " />
        <meta name="description" content=" " />
        <link rel="stylesheet" href="/deepsearch/css/bootstrap/bootstrap.css">
        <script src="/deepsearch/js/jquery-2.1.4.min.js"></script>
        <script src="/deepsearch/js/bootstrap/bootstrap.js"></script>
        <script src="/deepsearch/js/jquery-ui.min.js"></script>

        <link rel="stylesheet" type="text/css" href="/deepsearch/css/index.css">
        <link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
        <link rel="stylesheet" type="text/css" href="/deepsearch/css/common.css">
        <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
        <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="/deepsearch/css/swiper-3.4.1.min.css">
        <script src="/deepsearch/js/swiper-3.4.1.min.js"></script>
        <#--<script src="/deepsearch/js/vue.min.js"></script>-->
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
                您当前的位置：<a href="index">白马查</a>><a>无线排名</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>无线排名</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane "class="content" id="paimin" >
                        <div class="search-view" style="margin-top: 30px;margin-right: 264px;">
                            <table>
                                <tr>
                                    <td><label>关&nbsp;&nbsp;&nbsp;&nbsp;键&nbsp;&nbsp;&nbsp;&nbsp;词：</label></td>
                                    <td>
                                        <input type="text"  class="form-control" style="width: 263px;border-radius:5px;height: 40px;" ng-model="bbPaiMing.keyWords"  />
                                    </td>
                                </tr>
                                <tr style="">
                                    <td><label style="margin-top: 12px">宝贝ID(链接)：</label></td>
                                    <td>
                                        <input type="text"   class="form-control" style="width: 263px;border-radius:5px;height: 40px;margin-top: 12px " ng-model="bbPaiMing.tbaoId"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <button style="margin-top: -41px;margin-left: 441px;position: absolute; line-height: 41px;" class="btn  search-btn" href="javascript:;" ng-click="searchPaiming()" ng-disabled="bbPaiMing.working">查询</button>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div class="search-info" id="pmrs" >
                            <div style="width: 100%" ng-if="bbPaiMing.msg == null " ng-show="bbPaiMing.vm.value!=0&&bbPaiMing.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': bbPaiMing.vm.striped}">
                                    <div ng-class="['progress-bar', bbPaiMing.vm.style]" ng-style="{width: bbPaiMing.vm.value + '%'}">
                                        <div ng-if="bbPaiMing.vm.showLabel" ng-bind="bbPaiMing.vm.value+'%'"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-if="bbPaiMing.msg != null" style="color: red;font-size: 30px" ng-bind="bbPaiMing.msg">
                            </div>
                            <div class="result-context" ng-if="bbPaiMing.examedContext != null" >
                                <table class="table table-hover" ng-show="bbPaiMing.examedContext != null" style="  display: block;width:100%;height: 95%;overflow-y: hidden;">
                                    <thead>
                                    <tr ng-cloak>
                                        <td style="width: 60px;text-align: center"><label ng-bind="'图片链接'"></label></td>
                                        <td style="width: 80px;text-align: center"><label ng-bind="'标题'"></label></td>
                                        <td style="width: 228px;text-align: center"><label ng-bind="'宝贝坐标'"></label></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="data in bbPaiMing.examedContext " >
                                        <td ng-repeat="(x,y) in data ">
                                            <img ng-if="x == 'pic'" ng-src="{{y}}">
                                            <span style="font-size: 22px" ng-if="x == 'title'" ng-bind="y"></span>
                                            <span style="font-size: 22px;color: green" ng-if="x == 'zoom'"  ng-bind="y"></span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">为什么要用宝贝排名查询功能</h5>
                            <div class="toolALL_info_text">
                                <p><font class="text_protant">宝贝的排名</font>决定了宝贝的展现量，也就影响了宝贝的流量及成交量，所以运营在做推广的时候非常关注 宝贝的排名变化。但是由于淘宝的千人千面导致我们在本地电脑上看不到宝贝的<font class="text_protant">客观排名</font>，其次本地查 询需要手工去一页一页查询，非常耗时。</p>
                            </div>
                        </div>
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">为什么要用宝贝排名查询功能</h5>
                            <div class="toolALL_info_text">
                                <p>白马查采用目前最先进的<font class="text_protant">分布式云服务器查询模式</font>，模拟了无痕用户的搜索结果，采用<font class="text_protant">大数据技术</font>客观展现宝贝在全网的排名情况，让您更了解自己宝贝的<font class="text_protant">真实排名</font>。</p>
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