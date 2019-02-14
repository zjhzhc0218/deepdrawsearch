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
                    您当前的位置：<a href="index">白马查</a>><a>上下架查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>上下架查询</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane"  class="content" id="shangxiajia">
                        <div class="search-view" style="margin-top: 30px" style="margin-top: 30px" style="margin-top: 30px">
                            <input type="text"   ng-model="shangxiajia.searchWordsShangxiajia"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchShangxiajia()" ng-disabled="shangxiajia.working">查询</button>
                        </div>

                        <div class="search-info" id="shangxiajiaRs" style="width: 75%;margin:0 auto;">
                            <div style="width: 90%" ng-if="shangxiajia.msg == null " ng-show="shangxiajia.vm.value!=0&&shangxiajia.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': mulu.vm.striped}">
                                    <div ng-class="['progress-bar', shangxiajia.vm.style]" ng-style="{width: shangxiajia.vm.value + '%'}">
                                        <div ng-if="shangxiajia.vm.showLabel"  ng-bind="shangxiajia.vm.value+'%'"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-show="shangxiajia.msg != null" style="color: red;font-size: 30px" ng-bind="shangxiajia.msg">
                            </div>

                            <!-- 查询记录开始 -->
                            <div class="result-context" ng-show="shangxiajia.examedContext != null" >
                                <table class="table table-hover up_table " style="  display: block;width:100%;margin-bottom: 0px;">
                                    <thead>
                                    <tr style="width:100%">
                                        <td style="text-align: center"><label>商品图片</label></td>
                                        <td style="text-align: center"><label>宝贝名称</label></td>
                                        <td style="text-align: center"><label>上架时间</label></td>
                                        <td style="text-align: center"><label>下架时间</label></td>
                                        <td style="text-align: center"><label>剩余时间</label></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr style="width:100%" >
                                        <td>
                                            <a href="{{shangxiajia.examedContext.url}}" target="_blank"><img class="up_img" ng-src="{{shangxiajia.examedContext.img}}"></a>
                                        <#--<b style="color:#f60"  ng-bind="shangxiajia.examedContext[0].value"></b>-->
                                        </td>
                                        <td ><b   ng-bind="shangxiajia.examedContext.title"></b></td>
                                        <td><b   ng-bind="shangxiajia.examedContext._start_time"></b></td>
                                        <td><b  ng-bind="shangxiajia.examedContext._end_time"></b></td>
                                        <td ><b  ng-bind="shangxiajia.examedContext.days"></b>天<b ng-bind="shangxiajia.examedContext.hours"></b>小时<b ng-bind="shangxiajia.examedContext.minutes"></b>分钟</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- 查询记录结束 -->


                    </div>
                    <!-- 上下架查询结束 -->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">淘宝上下架时间应该如何合理安排</h5>
                            <div class="toolALL_info_text">
                                <p> 1.淘宝上下架尽量安排在流量高峰期。据统计，一般在<font class="text_protant">早上9：00-11：00，下午14：00-17：00，晚上19：00-22：00</font>的网上人流量最多。
                                    因而，在宝贝上架时，在这些时间段，分别上些宝贝，或者用工具软件定时上架，<font class="text_protant">在这个时间段每隔几分钟上一个宝贝。</font></p>
                                <p> 2. 不要将宝贝设置在一天全部上架。如果将宝贝设置在一天内全部上架，那一周之内，店铺只会有一天是排名靠前的。而其他的六天时间，由于店铺没有快下架的宝贝，
                                    无法排序到前几页，掌柜们很可能就会门庭冷落了。<font class="text_protant">所以，建议掌柜们把宝贝门分成7天，在7天的不同时间段内，分批上架。</font></p>
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