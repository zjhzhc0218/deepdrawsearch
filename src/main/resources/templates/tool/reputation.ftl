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
                    您当前的位置：<a href="index">白马查</a>><a>买家信誉查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>买家信誉查询</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane" class="content" id="xinyu">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"   ng-model="xinYu.searchWordsXy"  placeholder="请输入买家淘宝账号，然后点击 &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchXinyu()" ng-disabled="xinYu.working">查询</button>
                        </div>

                        <div class="search-info" id="xyrs">
                            <div style="width: 90%" ng-if="xinYu.msg == null " ng-show="xinYu.vm.value!=0&&xinYu.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': xinYu.vm.striped}">
                                    <div ng-class="['progress-bar', xinYu.vm.style]" ng-style="{width: xinYu.vm.value + '%'}">
                                        <div ng-if="xinYu.vm.showLabel" ng-bind="xinYu.vm.value+'%'"></div>
                                    </div>
                                </div>
                            </div>
                                <div class="noViolation " ng-show="xinYu.msg != null" style="color: red;font-size: 30px" ng-bind="xinYu.msg">
                                </div>
                                <div ng-show="xinYu.examedContext != null">
                                    <table class="table table-striped table-bordered table-hover table-condensed up_table table_reputation" >
                                        <tbody>
                                        <tr>
                                            <td>
                                                淘宝买家：<span class="clearfix" style="display: inline-block;width: auto;"><a ng-href="{{xinYu.examedContext[0].addr}}" target="_blank" style="font-size: 16px;color: red;float: left" ng-bind="xinYu.examedContext[0].value">
                                                        &nbsp;&nbsp;
                                                    </a>
                                                    <a ng-href="{{xinYu.examedContext[0].addr}}" target="_blank" style="font-size: 16px;color: red;float: left">
                                                        <img ng-src="{{xinYu.examedContext[0].pic}}" >
                                                    </a>&nbsp;&nbsp;
                                                    <b style="float: left;margin-top: 3px" ng-bind="xinYu.examedContext[1].value"></b></span>
                                            </td>
                                            <td>
                                                实名认证：
                                                <span style="color: red" ng-bind="xinYu.examedContext[2].value"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                注册时间：
                                                <span style="color: green" ng-bind="xinYu.examedContext[3].value"></span>
                                            </td>
                                            <td>
                                                最后登录：
                                                <span style="color: green" ng-bind="xinYu.examedContext[4].value"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                店铺信息：
                                                <span ng-bind="xinYu.examedContext[5].value"></span>
                                            </td>
                                            <td>
                                                所在地区：
                                                <span style="color: green" ng-bind="xinYu.examedContext[6].value"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                买家信用：<b style="color: green" ng-bind="xinYu.examedContext[7].value"></b>&nbsp;
                                                每周平均：<b style="color: green" ng-bind="xinYu.examedContext[8].value">&nbsp;</b>&nbsp;
                                                <img id="dd" ng-src="{{xinYu.examedContext[9].value}}">
                                                &nbsp;<b style="color: red" ng-bind="xinYu.examedContext[10].value"></b>
                                            </td>
                                            <td>
                                                卖家信用：<b style="color: green" ng-bind="xinYu.examedContext[11].value"></b>
                                                &nbsp;<img ng-src="{{xinYu.examedContext[12].value}}">
                                                <b style="color: red" ng-bind="xinYu.examedContext[13].value">&nbsp;</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                男号女号：<b style="color: green" ng-bind="xinYu.examedContext[14].value"></b>
                                                &nbsp;&nbsp;账号热度：<b style="color: #FE7738" ng-bind="xinYu.examedContext[15].value"></b>
                                            </td>
                                            <td>
                                                活  跃  度：<span style="color: green" ng-bind="xinYu.examedContext[16].value"></span>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>


                        </div>
                    </div>
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">买家信誉查询说明</h5>
                            <div class="toolALL_info_text">
                                <p> 1. <font class="text_protant">注册时间小于30天的</font>，被认定为小号/新号，有可能是骗子，应当谨慎交易。</p>
                                <p> 2. <font class="text_protant">买家中差评数量以及中差评信息超过一定的比例</font>，则有可能是职业中差评师。</p>
                                <p> 3. <font class="text_protant">宝贝转化率，支付宝使用率</font>出现异常。</p>
                                <p> 4. 经常刷的小号，<font class="text_protant">当周购物单量超过一定量（6-10单）</font>，则有可能是黑号。</p>
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