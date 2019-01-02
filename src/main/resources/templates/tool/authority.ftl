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
                您当前的位置：<a href="index">白马查</a>><a>隐形降权查询</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>隐形降权查询</p>
                </div>
                <div class="toolALL_con">
                    <div role="tabpanel" class="tab-pane" class="content" id="jiangquan">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"   ng-model="jiangquan.searchWordsJq"  placeholder="请输入店铺旺旺ID，然后点击 &quot;查询&quot; 按钮"/>
                            <button class="btn  search-btnN" href="javascript:;" ng-click="searchJiangQuan()" ng-disabled="jiangquan.working">查询</button>
                        </div>
                        <div class="search-desc" style="margin-left: 249px;margin-top: -38;">
                            <p class="title"> 店铺宝贝隐形降权查询</p>
                            <#--<p> 1.隐形降权是淘宝作弊检测体系自动检测发现宝贝有问题，但是没有明确的证据或者还不是很严重的情况，就是犯罪嫌疑人，对这些宝贝商至店铺采取降权处理。</p>
                            <p> 2.隐形降权一般和以下因素有关：刷销量：有黑号参与、转化率低、支付宝使用率低。</p>
                            <p><font>注意：宝贝隐形降权只提供参考，非淘宝官方数据</font></p>-->
                            <div style="line-height: 1.6rem">
                                <h4>什么是隐形降权？<a href="#" ng-click="jqWords('div_p1')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                                <p class="div_p1" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #FE8034">隐形降权</span>是淘宝作弊检测体系自动检测发现宝贝有问题，但是没有明确的证据或者还不是很严重的情况 下，对这些宝贝或者店铺采取<span style="color: #FE8034">降权处理</span>。</p>
                            </div>

                            <div style="line-height: 1.6rem">
                                <h4>隐形降权跟哪些因素有关？<a href="#" ng-click="jqWords('div_p2')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. <span style="color: #FE8034">频繁修改</span>宝贝的标题、描述、属性；滥用、堆砌关键词，频繁的修改宝贝价格。</p>
                                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. <span style="color: #FE8034">虚假交易，炒作信用</span>，有淘宝监控的账号(黑号)购买了这个宝贝，被淘宝判断有刷销量嫌疑。</p>
                                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. <span style="color: #FE8034">宝贝转化率，支付宝使用率</span>出现异常。</p>
                                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. <span style="color: #FE8034">类目错放，标题、图片、描述</span>等不一致。</p>
                            </div>

                            <div style="line-height: 1.6rem">
                                <h4>如何看懂权重差值？<a href="#" ng-click="jqWords('div_p3')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.淘宝权重差值是根据一个宝贝的<span style="color: #FE8034">销量权重</span>和<span style="color: #FE8034">人气权重</span>比较得出来的一个数值(非淘宝官方数据，不需要处理）。</p>
                                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.<span style="color: #FE8034">淘宝权重差值是0的时候</span>，说明此商品权重正常，排名正常，是一个很正常的商品。</p>
                                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.<span style="color: #FE8034">淘宝权重差值是正数（>0)的时候</span>，说明此商品根据淘宝搜索排名比较前，比正常搜索排名要靠前。</p>
                                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.<span style="color: #FE8034">淘宝权重差值是负数（<0）的时候</span>，说明此商品可能已经被查降权了，权重差值负数越大，排名就越 靠后。</p>
                            </div>

                        </div>

                        <div class="search-info" id="jqrs" >
                            <div style="width: 100%" ng-if="jiangquan.msg == null " ng-show="jiangquan.vm.value!=0&&jiangquan.vm.value!=100">
                                <div ng-class="{progress: true, 'progress-striped': jiangquan.vm.striped}">
                                    <div ng-class="['progress-bar', jiangquan.vm.style]" ng-style="{width: jiangquan.vm.value + '%'}">
                                        <div ng-if="jiangquan.vm.showLabel">{{jiangquan.vm.value}}%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="noViolation " ng-show="jiangquan.msg != null" style="color: red;font-size: 30px">
                                {{jiangquan.msg}}
                            </div>
                            <div class="result-context" ng-show="jiangquan.examedContext != null&&jiangquan.examedContext.length>0" >
                                <table class="table table-hover" style="  display: block;width:100%;margin-bottom: 0;">
                                    <thead>
                                    <tr style="width:100%">
                                        <td style="width: 30px;text-align: center"><label>图片</label></td>
                                        <td style="width: 120px;text-align: center"><label>标题</label></td>
                                        <td style="width: 90px;text-align: center"><label>销量</label></td>
                                        <td style="width: 90px;text-align: center"><label>价格</label></td>
                                        <#--<td style="width: 50px;text-align: center"><label>价格</label></td>-->
                                        <td style="width: 90px;text-align: center"><label>库存</label></td>
                                        <td style="width: 90px;text-align: center"><label>权重值</label></td>
                                        <td style="width: 120px;text-align: center"><label>说明</label></td>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="data in jiangquan.examedContext " >
                                        <td ng-repeat="node in data | orderBy:'id'"  style="text-align: center">
                                            <a href="{{node.href}}" target="_blank" style="text-decoration:none" ><img style="width: 100px;height: 100px;margin-top: 10px" ng-if="node.name=='img'" ng-src="{{node.value}}"></a>
                                            <span style="font-size: 18px;line-height: 120px" ng-if="node.name!='img'&&node.name!='title'">{{node.value}}</span>
                                            <a ng-if="node.name ==  'title'"  href="{{node.href}}"  target="_blank" style="text-decoration:none;line-height: 120px">{{node.value}}</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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
</html>