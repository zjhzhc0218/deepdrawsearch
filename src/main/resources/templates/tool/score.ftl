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
                    您当前的位置：<a href="index">白马查</a>><a>动态评分查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>动态评分查询</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane" class="content" id="dongtaipingfeng">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"   ng-model="dtPingFeng.searchWordsXy"  placeholder="请输入旺旺账号，然后点击 &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchPingfeng()" ng-disabled="dtPingFeng.working">查询</button>
                        </div>

                        <div class="search-info" id="dtPingFengRs">
                            <div style="width: 90%" ng-if="dtPingFeng.msg == null " ng-show="dtPingFeng.vm.value!=0&&dtPingFeng.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': dtPingFeng.vm.striped}">
                                    <div ng-class="['progress-bar', dtPingFeng.vm.style]" ng-style="{width: dtPingFeng.vm.value + '%'}">
                                        <div ng-if="dtPingFeng.vm.showLabel">{{dtPingFeng.vm.value}}%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-show="dtPingFeng.msg != null" style="color: red;font-size: 30px">
                                {{dtPingFeng.msg}}
                            </div>
                            <div href="javascript:;" ng-show="dtPingFeng.examedContext != null" class="info-item">
                                <ul class="dsr-info" id="dsr" style="">
                                    <li class="J_RateInfoTrigger dsr-item selected">
                                        <div class="item-scrib">
                                            <span class="title" style="">宝贝与描述相符：</span>
                                            <em class="count" id="item_score" ng-bind="dtPingFeng.examedContext[0].value"></em>分
                                            <em title="计算规则:(店铺得分-同行业平均分)/(同行业店铺最高得分-同行业平均分)"><strong class="percent over" id="">比同行业平均水平高 <b style="color:#f60" ng-bind="dtPingFeng.examedContext[1].value"></b></strong></em>
                                        </div>
                                        <div style="position:relative;left:100px;" class="avg" ng-show="dtPingFeng.examedContext[2].value!= ''"> 行业平均得分约：<b style="color:#f60" ng-bind="dtPingFeng.examedContext[2].value"></b>，抵挡<b style="color:#f60" ng-bind="dtPingFeng.examedContext[3].value"></b>单<b style="color:#f60" ng-bind="dtPingFeng.examedContext[4].value"></b>分后飘绿</div>

                                    </li>
                                    <li class="J_RateInfoTrigger dsr-item selected">
                                        <div class="item-scrib">
                                            <span class="title">卖家的服务态度：</span>
                                            <em class="count" id="service_score"  ng-bind="dtPingFeng.examedContext[5].value"></em>分
                                            <em title="计算规则:(店铺得分-同行业平均分)/(同行业店铺最高得分-同行业平均分)"><strong class="percent over" id="">比同行业平均水平高 <b style="color:#f60"  ng-bind="dtPingFeng.examedContext[6].value"></b></strong></em>
                                        </div>
                                        <div style="position:relative;left:100px;" class="avg" ng-show="dtPingFeng.examedContext[7].value!= ''"> 行业平均得分约：<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[7].value"></b>，抵挡<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[8].value"></b>单<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[9].value"></b>分后飘绿</div>
                                    </li>
                                    <li class="J_RateInfoTrigger dsr-item selected">
                                        <div class="item-scrib">
                                            <span class="title">卖家发货的速度：</span>
                                            <em class="count" id="delivery_score"  ng-bind="dtPingFeng.examedContext[10].value"></em>分
                                            <em title="计算规则:(店铺得分-同行业平均分)/(同行业店铺最高得分-同行业平均分)"><strong class="percent over" id="">比同行业平均水平高 <b style="color:#f60"  ng-bind="dtPingFeng.examedContext[11].value"></b></strong></em>
                                        </div>
                                        <div style="position:relative;left:100px;" class="avg" ng-show="dtPingFeng.examedContext[12].value!=''"> 行业平均得分约：<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[12].value"></b>，抵挡<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[13].value"></b>单<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[14].value"></b>分后飘绿</div>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">如何提高店铺动态评分(DSR)？</h5>
                            <div class="toolALL_info_text">
                                <p> 1.提高对顾客的服务态度，发货速度，完善商品的描叙。让顾客舒心购物!</p>
                                <p> 2. <font class="text_protant">顾客收到宝贝后，主动联系顾客是否满意</font>。从而提醒顾客好评并打5分。</p>
                                <p> 3. 邀请你的朋友关照下你，从而获得5分好评!</p>
                                <p> 4. <font class="text_protant">加入一些互刷平台，或是互刷团队来提高动态评分</font>，安全，方便，快捷。</p>
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