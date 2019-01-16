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
                您当前的位置：<a href="index">白马查</a>><a>下拉框选词</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>下拉框选词</p>
                </div>
                <div class="toolALL_con">
                    <!-- 下拉框选词开始 -->
                    <div role="tabpanel" class="tab-pane"  class="content" id="xialakuang">
                        <div class="search-view" style="margin-top: 30px" style="margin-top: 30px" style="margin-top: 30px">
                            <input type="text"   ng-model="xialakuang.searchWordsXialakuang"  placeholder="输入您感兴趣的产品核心词，即可查看对应的下拉框推荐词，相关宝贝数和推荐属性词： &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchXialakuang()" ng-disabled="xialakuang.working">查询</button>
                        </div>
                        <!-- 下拉框选词内容展现 -->
                        <div class="search-info" id="xialakuangrs" >
                            <div style="width: 100%" ng-if="xialakuang.msg == null " ng-show="xialakuang.vm.value!=0&&xialakuang.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': jiangquan.vm.striped}">
                                    <div ng-class="['progress-bar', xialakuang.vm.style]" ng-style="{width: xialakuang.vm.value + '%'}">
                                        <div ng-if="xialakuang.vm.showLabel" ng-bind="xialakuang.vm.value+'%'"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-show="xialakuang.msg != null" style="color: red;font-size: 30px" ng-bind="xialakuang.msg">
                            </div>
                            <div class="result-context" ng-show="xialakuang.examedContext != null&&xialakuang.examedContext.length>0" >
                                <table class="table table-striped table-bordered table-hover table-condensed" style="  width:100%;margin-bottom: 0;">
                                    <thead>
                                    <tr style="width:100%">
                                        <td style="text-align: center"><label>对应关键词</label></td>
                                        <td style="text-align: center"><label>对应数量</label></td>
                                        <#--<td style="width: 90px;text-align: center"><label>销量</label></td>-->
                                        <#--<td style="width: 90px;text-align: center"><label>价格</label></td>-->
                                        <#--&lt;#&ndash;<td style="width: 50px;text-align: center"><label>价格</label></td>&ndash;&gt;-->
                                        <#--<td style="width: 90px;text-align: center"><label>库存</label></td>-->
                                        <#--<td style="width: 90px;text-align: center"><label>权重值</label></td>-->
                                        <#--<td style="width: 120px;text-align: center"><label>说明</label></td>-->

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="data in xialakuang.examedContext " >
                                        <td >
                                            <b   ng-bind="data.name"></b>
                                        </td>
                                        <td >
                                            <b   ng-bind="data.num"></b>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- 下拉框选词内容展现结束 -->

                    </div>
                    <!-- 下拉框选词结束 -->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">为什么要用下拉框选词功能？</h5>
                            <div class="toolALL_info_text">
                                <p><font class="text_protant"> 淘宝搜索下拉框选词</font>
                                    是通过淘宝、天猫、手机淘宝搜索下拉框查询淘宝搜索指数高、流量高、转化率高的关键词，并获取各关键词对应的在线相关宝贝数量及其推荐属性词。
                                    <font class="text_protant">对于查询到的这些关键词</font>建议亲们使用生意参谋对其成交指数进行数据分析来选取真正适合自己宝贝的关键词，是<font class="text_protant">淘宝商家标题优化和直通车选词的好助手。</font></p>
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
</html>