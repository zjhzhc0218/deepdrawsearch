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
                您当前的位置：<a href="index">白马查</a>><a>宝贝类目查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>宝贝类目查询</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane" class="content" id="mulu">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"   ng-model="searchWordsMulu"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchMulu()" ng-disabled="mulu.working">查询</button>
                        </div>

                        <div class="search-info" id="dtPingFengRs" style="width: 75%;margin-left: 200px">
                            <div style="width: 90%" ng-if="mulu.msg == null " ng-show="mulu.vm.value!=0&&mulu.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': mulu.vm.striped}">
                                    <div ng-class="['progress-bar', mulu.vm.style]" ng-style="{width: mulu.vm.value + '%'}">
                                        <div ng-if="mulu.vm.showLabel">{{mulu.vm.value}}%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-show="mulu.msg != null" style="color: red;font-size: 30px">
                                {{mulu.msg}}
                            </div>

                            <div href="javascript:;" ng-show="mulu.examedContext != null" class="info-item" style="display: block;text-align:center; color; black;font-size: 24px;margin-left: -200px">
                                {{mulu.examedContext}}
                            </div>

                        </div>



                    </div>
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">为什么要用宝贝类目查询</h5>
                            <div class="toolALL_info_text">
                                <p>本工具可以在线查询天猫、淘宝商品宝贝类目属性。再也不用去问别人怎么查看淘宝产品类目了。</p>
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