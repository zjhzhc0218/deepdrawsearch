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
                您当前的位置：<a href="index">白马查</a>><a>标题优化</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>标题优化</p>
                </div>
                <div class="toolALL_con">
                    <!-- 标题优化 -->
                    <div role="tabpanel" class="tab-pane" class="content">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"id="showinput"  placeholder="请输入宝贝链接或者宝贝ID &quot;点击“诊断” 按钮进行优化" v-model="titleText" />
                            <button class="btn search-btnN" @click="search(titleText)">诊断</button>
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

                    <div class="titleResult clearfix" >
                        <div class="history_result_tit3_tit">诊断报告</div>
                        <div class="titleResult_con1">
                            <div class="titleResult_con1_box clearfix">
                                <div class="titleResult_con1_img">
                                    <img src="//img.alicdn.com/imgextra/i2/2620545230/TB22wgZz8yWBuNkSmFPXXXguVXa_!!2620545230-0-item_pic.jpg" width="100%">
                                </div>
                                <div class="titleResult_con1_text">
                                    <p><span>宝贝所属类目： </span>手表>>欧美腕表</p>
                                    <p><span>市场竞争度：  </span><font>3</font>个同款宝贝</p>
                                    <p><span>商家旺旺： </span>emporioarmani腕表旗舰店</p>
                                </div>
                                <div class="titleResult_con1_score">
                                    <h3>标题分数</h3>
                                    <h5>83<font>分</font></h5>
                                </div>
                            </div>
                            <div class="titleResult_con1_box2">
                                <div class="tit">标题拆分词组：<span>15</span> 个</div>
                                <div class="titleResult_lable">
                                    <span>Armani</span><span>阿玛尼</span><span>2018</span><span>新款</span><span>皮带</span><span>商务</span><span>风</span>
                                </div>
                            </div>
                        </div>
                        <div class="titleResult_con2 clearfix">
                            <div class="titleResult_con2_box">
                                <span class="tit">标题长度：</span>
                                <img src="/deepsearch/images/ok.png" class="img">
                                <span class="text">标题长度30个汉字</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">营 销 词：</span>
                                <img src="/deepsearch/images/warning_icon.png" class="img">
                                <span class="text">包含营销词【新款】，建议去除</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">特殊字符：</span>
                                <img src="/deepsearch/images/ok.png" class="img">
                                <span class="text">标题不含特殊字符</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">重 复 词：</span>
                                <img src="/deepsearch/images/ok.png" class="img">
                                <span class="text">无重复关键词</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">标题热词：</span>
                                <img src="/deepsearch/images/ok.png" class="img">
                                <span class="text">标题包含相关热搜词【手表】【表】【手表男】等</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">违 禁 词：</span>
                                <img src="/deepsearch/images/ok.png" class="img">
                                <span class="text">无违禁词，请继续保持</span>
                            </div>
                        </div>
                    </div>
                    <!-- 历史价格结果界面 -->
                    <!-- 历史价格查询 -->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">标题优化使用说明：</h5>
                            <div class="toolALL_info_text">
                                <p>不要优化爆款宝贝，每次优化宝贝标题改动不要超过30%，例如30个字改3个词，以免被系统判定“偷换宝贝”</p>
                                <p>不要频繁更新标题，否则可能会被降权，一周最多优化一次。</p>
                                <p>同类宝贝标题不可完全相同，否则系统判定“重复铺货”</p>
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
                titleText:'',
                titleInfo:[],

            },
            created:function () {
                var _this=this;

            },
            mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
            },
            methods: { //专用于定义方法
                search:function(name){
                    var _this=this;
                    if(name==""){
                        alert("请输入产品关键字")
                    }
                    else{
                        //直通车
                        $.ajax({
                            type: 'get',
                            url:Url+ 'getTitleYH',
                            dataType: 'json',
                            data:{
                                searchWords:name
                            },
                            success: function (data) {
                                _this.titleInfo=data.data
                                console.log(_this.dictionInfo)
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