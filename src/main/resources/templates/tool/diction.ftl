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
        <#--<link rel="stylesheet" href="/deepsearch/css/spop/spop.css">-->
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
<body>
<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<div id="app">
<!--  / warpper  -->
    <div class="warpper">
        <div class="container">
            <div class="all_nav">
                您当前的位置：<a href="index">白马查</a>><a>直通车选词</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>历史价格查询</p>
                </div>
                <div class="toolALL_con">
                    <!-- 历史价格查询 -->
                    <div role="tabpanel" class="tab-pane" class="content">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"id="showinput"  placeholder="请输入产品核心词 &quot;点击“查询” 按钮进行淘词" v-model="dictionText" />
                            <button class="btn search-btnN" @click="search(dictionText)">查询</button>
                        </div>


                    </div>

                    <#--<div class="search-info" id="jqrs" >-->
                        <#--<div style="width: 100%" ng-if="history.msg == null " ng-show="history.vm.value!=0&&history.vm.value!=100">-->
                            <#--<div ng-class="{progress: true, 'progress-striped': history.vm.striped}">-->
                                <#--<div ng-class="['progress-bar', history.vm.style]" ng-style="{width: history.vm.value + '%'}">-->
                                    <#--<div ng-if="history.vm.showLabel"  ng-bind="history.vm.value+'%'"></div>-->
                                <#--</div>-->
                            <#--</div>-->
                        <#--</div>-->

                    <#--</div>-->
                    <#--<div class="search-info" >-->
                        <#--<div class="noViolation " ng-show="history.msg != null" style="color: red;font-size: 30px" ng-bind="history.msg">-->
                        <#--</div>-->
                    <#--</div>-->

                    <!-- 历史价格结果界面 -->

                    <div class="diction_result" >
                        <div class="dictionRe_tit">
                            <h6 class="dictionRe_one">通过过滤后，查到关键词数量为1414个</h6>
                            <div class="dictionRe_menu clearfix">
                                <h5 class="dictionRe_menu_tit">类目筛选：</h5>
                                <div class="dictionRe_menu_list">
                                    <ul>
                                        <li>女装/女士精品>>卫衣/绒衫</li><li>男装>>卫衣</li><li>运动服/休闲服装>>运动卫衣/套头衫</li><li>男装</li><li>女装/女士精品</li><li>童装/婴儿装/亲子装>>卫衣/绒衫</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="diction_result_box">
                            <table class="table table-striped table-bordered table-hover table-condensed all_table ">
                                <thead>
                                    <tr>
                                        <td>关键词</td>
                                        <td>展现指数</td>
                                        <td>点击指数</td>
                                        <td>点击率</td>
                                        <td>转化率</td>
                                        <td>市场均价</td>
                                        <td>竞争度</td>
                                        <td>搜索趋势</td>
                                        <td>推荐类目</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="diction_one_tr">
                                        <td><span class="diction_table_tit">卫衣</span></td>
                                        <td>278	</td>
                                        <td>3	</td>
                                        <td>0.96%</td>
                                        <td>0.00%</td>
                                        <td>¥0.64</td>
                                        <td>11</td>
                                        <td><span class="diction_line up"><b style="width: 10%;"></b></span></td>
                                        <td>运动服/休闲服装>>运动卫衣/套头衫</td>
                                    </tr>
                                    <tr>
                                        <td>1.<span class="diction_table_tit">曼联卫衣</span></td>
                                        <td>278	</td>
                                        <td>3	</td>
                                        <td>0.96%</td>
                                        <td>0.00%</td>
                                        <td>¥0.64</td>
                                        <td>11</td>
                                        <td><span class="diction_line"><b style="width: 10%;"></b></span></td>
                                        <td>运动服/休闲服装>>运动卫衣/套头衫</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 历史价格结果界面 -->
                    <!-- 历史价格查询 -->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">直通车选词使用说明：</h5>
                            <div class="toolALL_info_text">
                                <#--<p>历史价格查询目前支持淘宝，天猫等商城的绝大多数商品</p>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--  / warpper  -->
</div>
<!--  / footer  -->
<#include "//footer.ftl">
<!--  / footer  -->
</body>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/index.js"></script>
<script>
    $(function () {
        var vm=new Vue({
            el:'#app',
            data:{
                dictionText:'',
            },
            created:function () {
                var _this=this;

            },
            mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
            },
            methods: { //专用于定义方法
                search:function (name) {
                    if(name==""){
                        alert("请输入产品关键字")
                    }
                    else{
                        //直通车
                        $.ajax({
                            type: 'get',
                            url:Url+ 'getZtongCar',
                            dataType: 'json',
                            data:{
                                searchWords:name
                            },
                            success: function (data) {
                                _this.$nextTick(function () {

                                })

                            }
                        })
                    }

                }
            }
        })
    })
</script>
</html>