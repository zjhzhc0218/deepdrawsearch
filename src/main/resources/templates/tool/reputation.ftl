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
                            <#--    <div class="noViolation " ng-show="xinYu.hasNoViolation == true" style="color: red;font-size: 30px">
                                    该号不存在，请检测是否输入有误!
                                </div>-->
                                <div class="noViolation " ng-show="xinYu.msg != null" style="color: red;font-size: 30px" ng-bind="xinYu.msg">
                                </div>
                            <#-- <a href="javascript:;"  ng-show="xinYu.examedContext != null"  class="info-item"  ng-repeat="d in xinYu.examedContext" >
                                 <div class="item-left" ng-if="d.id!=2&&d.id!=3">
                                     <span>{{d.name}}</span>
                                     <p> <label ng-if="d.id!=null&&d.id!=15" ng-bind="d.value" style="margin-bottom: -4px;" >
                                     </label>
                                         <img ng-if="d.id!=null&&d.id==1" href="{{d.addr}}" ng-data-original="{{d.pic}}" />
                                         <img  ng-if="d.id!=null&&d.id==15" ng-data-original="{{d.value}}"/>
                                     </p>
                                 </div>
                                </a>-->
                                <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item active">

                                    <div class="item-left" style="background-color: #f4f7e4;top: 7px;">
                                        淘宝买家：
                                        <div  style="width:auto;color: #FE7738;position: relative">
                                            <a ng-href="{{xinYu.examedContext[0].addr}}" target="_blank" style="font-size: 16px;color: red;float: left">
                                                {{xinYu.examedContext[0].value}}&nbsp;&nbsp;
                                            </a>
                                            <a ng-href="{{xinYu.examedContext[0].addr}}" target="_blank" style="font-size: 16px;color: red;float: left">
                                                <img ng-src="{{xinYu.examedContext[0].pic}}" >
                                            </a>
                                            <b style="float: left;margin-top: 3px">&nbsp;&nbsp;{{xinYu.examedContext[1].value}}</b>
                                        </div>
                                    </div>

                                    <div class="item-right" style="background-color: #f4f7e4">
                                        实名认证：
                                        <p style="color: red">{{xinYu.examedContext[2].value}}</p>
                                    </div>
                                </div>

                                <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                                    <div class="item-left">
                                        注册时间：
                                        <p style="color: green">{{xinYu.examedContext[3].value}}</p>
                                    </div>
                                    <div class="item-right">
                                        最后登录：
                                        <p style="color: green">{{xinYu.examedContext[4].value}}</p>
                                    </div>
                                </div>

                                <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                                    <div class="item-left">
                                        店铺信息：
                                        <p>{{xinYu.examedContext[5].value}}</p>
                                    </div>
                                    <div class="item-right">
                                        所在地区：
                                        <p style="color: green">{{xinYu.examedContext[6].value}}</p>
                                    </div>
                                </div>

                                <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                                    <div class="item-left">
                                        买家信用：<b style="color: green">{{xinYu.examedContext[7].value}}</b>&nbsp;
                                        每周平均：<b style="color: green">&nbsp;{{xinYu.examedContext[8].value}}</b>&nbsp;
                                        <img id="dd" ng-src="{{xinYu.examedContext[9].value}}">
                                        &nbsp;<b style="color: red">{{xinYu.examedContext[10].value}}</b>
                                    </div>
                                    <div class="item-right">
                                        卖家信用：<b style="color: green">{{xinYu.examedContext[11].value}}</b>
                                        &nbsp;<img ng-src="{{xinYu.examedContext[12].value}}">
                                        <b style="color: red">&nbsp;{{xinYu.examedContext[13].value}}</b>
                                    </div>
                                </div>

                                <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                                    <div class="item-left">
                                        男号女号：<b style="color: green">{{xinYu.examedContext[14].value}}</b>
                                        &nbsp;&nbsp;账号热度：<b style="color: #FE7738">{{xinYu.examedContext[15].value}}</b>
                                    </div>
                                    <div class="item-right">
                                        活  跃  度：<p style="color: green">{{xinYu.examedContext[16].value}}</p>
                                    </div>
                                </div>

                            <#--<div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                                <div class="item-left">
                                    &nbsp;查询  ip:
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;{{xinYu.examedContext[17].value}}</p>
                                </div>
                                <div class="item-right">
                                    查询时间：
                                    <p>&nbsp;&nbsp;{{xinYu.examedContext[18].value}}</p>
                                </div>
                            </div>-->

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