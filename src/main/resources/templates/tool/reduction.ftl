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
        <script src="/deepsearch/js/index.js"></script>

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
                您当前的位置：<a href="index">白马查</a>><a>指数还原</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>指数还原</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane" class="content" id="zhishu">
                        <#--<div class="search-view" style="margin-top: 30px">-->
                        <#--<input type="text"   ng-model="zhishu.searchWordsXy"  placeholder="请输入淘宝或天猫交易指数(大于2100)，然后点击 &quot;查询&quot; 按钮"/>-->
                        <#--<button class="btn  search-btnN" href="javascript:;" ng-click="searchZhishu()" ng-disabled="zhishu.working">查询</button>-->
                        <#--</div>-->

                        <div class="reduction_con">
                            <div class="reduction_list">
                                <span class="active" ng-click="checkZhiShu('jyzs')">交易指数</span><span ng-click="checkZhiShu('llzs')">流量指数</span><span ng-click="checkZhiShu('zfzhlzs')">支付转化率指数</span><span ng-click="checkZhiShu('kqzs')">客群指数</span><span ng-click="checkZhiShu('ssrq')">搜索人气</span><span ng-click="checkZhiShu('jgrq')">加购人气</span><span ng-click="checkZhiShu('scrq')">收藏人气</span>
                            </div>
                            <div class="reduction_box_fa  clearfix">
                                <div class="reduction_box one">
                                    <div class="tit clearfix">
                                        <h2><img src="/deepsearch/img/pollsmall.gif" /><font>交易指数</font></h2>
                                        <span></span>
                                    </div>
                                    <div class="reduction_box_text">
                                        <p>请输入要计算的<font>交易指数</font>，一行一个（支持从excel复制粘贴），单次最大支持10000个指数同时批量计算！</p>
                                    </div>
                                    <div class="reduction_box_input">
                                        <textarea placeholder="请输入您提供的数据" ng-model="zhishu.searchWordsXy"></textarea>
                                    </div>
                                </div>
                                <div class="reduction_bt" >
                                    <span ng-click="searchZhishu()" ng-disabled="zhishus.working" >转化成<font>交易金额</font></span>
                                </div>
                                <div class="reduction_box two">
                                    <div class="tit clearfix">
                                        <h2><img src="/deepsearch/img/viewpay.gif" class="active" /><img src="/deepsearch/img/activitysmall.gif" /><img src="/deepsearch/img/viewpay.gif" /><img src="/deepsearch/img/activitysmall.gif" />
                                            <img src="/deepsearch/img/activitysmall.gif" /><img src="/deepsearch/img/tradesmall.gif" /><img src="/deepsearch/img/oshr.png" />
                                            <font class="active">交易金额</font><font>访客人数</font><font>支付转化率</font><font>支付人数</font><font>搜索人数</font><font>加购人数</font><font>收藏人数</font></h2>
                                        <span></span>
                                    </div>
                                    <div class="reduction_box_text">
                                        <p>可以直接复制粘贴到excel使用，误差0.01%左右，如果需使用指导或验证帮助可联系微信！</p>
                                    </div>
                                    <div class="reduction_box_input">
                        <textarea disabled>{{zhishu.examedContext}}
                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <#-- <div class="search-info" id="zhishuRs" style="width: 75%;margin-left: 200px">
                             <div style="width: 90%" ng-if="zhishu.msg == null " ng-show="zhishu.vm.value!=0&&zhishu.vm.value!=100">
                                 <div ng-class="{progress: true, 'progress-striped': zhishu.vm.striped}">
                                     <div ng-class="['progress-bar', zhishu.vm.style]" ng-style="{width: zhishu.vm.value + '%'}">
                                         <div ng-if="zhishu.vm.showLabel">{{zhishu.vm.value}}%</div>
                                     </div>
                                 </div>
                             </div>
                             <div class="noViolation " ng-show="zhishu.msg != null" style="color: red;font-size: 30px">
                                 {{zhishu.msg}}
                             </div>
                             <div href="javascript:;" ng-show="zhishu.examedContext != null" class="info-item">
                                 <div class="reductionIndex" id="dsr">
                                     <div>
                                         <h5 style="display: inline">销售金额：</h5>
                                         <h1 ng-if="zhishu.searchWordsXy<=2100">交易指数过小</h1>
                                         <h1 ng-if="zhishu.searchWordsXy>2100" id="item_score" ng-bind="zhishu.examedContext"></h1>
                                     </div>

                                     <h5>交易指数： <span class="count" id="item_score" ng-bind="zhishu.searchWordsXy"></span></h5>
                                 </div>

                                 &lt;#&ndash;<ul class="dsr-info" id="dsr" style="">&ndash;&gt;
                                 &lt;#&ndash;<li class="J_RateInfoTrigger dsr-item selected">&ndash;&gt;
                                 &lt;#&ndash;<div class="item-scrib">&ndash;&gt;
                                 &lt;#&ndash;<span class="title" style="">销售金额：</span>&ndash;&gt;
                                 &lt;#&ndash;<em style="color:#f60" class="count" id="item_score" ng-bind="zhishu.examedContext"></em>&ndash;&gt;
                                 &lt;#&ndash;</div>&ndash;&gt;
                                 &lt;#&ndash;<div class="item-scrib">&ndash;&gt;
                                 &lt;#&ndash;<span class="title" style="">交易指数：</span>&ndash;&gt;
                                 &lt;#&ndash;<em style="color:#f60" class="count" id="item_score" ng-bind="zhishu.searchWordsXy"></em>&ndash;&gt;
                                 &lt;#&ndash;</div>&ndash;&gt;
                                 &lt;#&ndash;</li>&ndash;&gt;
                                 &lt;#&ndash;</ul>&ndash;&gt;
                             </div>
                         </div>-->
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
<script>
    //指数还原点击事件
    $(".reduction_list span").click(function(){
        var index=$(this).index();
        // alert(index);
        $(this).addClass("active").siblings().removeClass("active");
        $(".reduction_box.two .tit h2 font").removeClass("active");
        $(".reduction_box.two .tit h2 font").eq(index).addClass("active");
        $(".reduction_box.two .tit h2 img").removeClass("active");
        $(".reduction_box.two .tit h2 img").eq(index).addClass("active");
        $(".reduction_explain .search-desc").eq(index).addClass("active").siblings().removeClass("active");
        var name=$(this).text();
        var name2=$(".reduction_box.two .tit h2 font").eq(index).text();
        $(".reduction_box.one .tit h2 font,.reduction_box_text p font").text(name)
        $(".reduction_bt span font").text(name2);
    })
</script>
</html>