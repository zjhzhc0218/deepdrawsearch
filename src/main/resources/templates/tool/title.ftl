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
                您当前的位置：<a href="index">白马查</a>><a>标题诊断</a>
            </div>
            <div class="toolALL">
                <div class="toolALL_nav">
                    <p>标题诊断</p>
                </div>
                <div class="toolALL_con">
                    <!-- 标题优化 -->
                    <div role="tabpanel" class="tab-pane" class="content">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"id="showinput"  placeholder="请输入宝贝链接或者宝贝ID &quot;点击“诊断” 按钮进行优化" v-model="titleText" />
                            <button class="btn search-btnN" @click="search(titleText)">诊断</button>
                        </div>

                    </div>

                    <div class="search-info" id="jqrs" >
                        <div style="width: 100%" v-if="time.working" v-show="time.vm.value!=0&&time.vm.value!=100">
                            <div class="progress progress-striped" >
                                <div class="progress-bar" :class="time.vm.style" :style="{width: time.vm.value + '%'}">
                                    <div v-if="time.vm.showLabel" >{{time.vm.value}}%</div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="search-info"  v-show="time.msg != null">
                        <div class="noViolation " style="color: red;font-size: 30px">
                            {{time.msg}}
                        </div>
                    </div>

                    <!-- 历史价格结果界面 -->

                    <div class="titleResult clearfix" v-show="titleInfo!=''">
                        <div class="history_result_tit3_tit">诊断报告</div>
                        <div class="titleResult_con1">
                            <div class="titleResult_con1_box clearfix">
                                <div class="titleResult_con1_img">
                                    <img :src="titleInfo.img" width="100%">
                                </div>
                                <div class="titleResult_con1_text">
                                    <p><span>宝贝所属类目： </span>{{titleInfo.leimu}}</p>
                                    <p><span>市场竞争度：  </span><font>{{titleInfo.jingzheng}}</font>个同款宝贝</p>
                                    <p><span>商家旺旺： </span>{{titleInfo.wwid}}</p>
                                </div>
                                <div class="titleResult_con1_score">
                                    <h3>标题分数</h3>
                                    <h5>{{titleInfo.score}}<font>分</font></h5>
                                </div>
                            </div>
                            <div class="titleResult_con1_box2">
                                <div class="tit">标题拆分词组：<span>{{titleInfo.split_title_num}}</span> 个</div>
                                <div class="titleResult_lable">
                                    <span v-for="item in titleInfo.split_title">{{item}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="titleResult_con2 clearfix">
                            <div class="titleResult_con2_box">
                                <span class="tit">标题长度：</span>
                                <img :src="titleInfo.specialSymbol_judge==2?'/deepsearch/images/ok.png':'/deepsearch/images/warning_icon.png'" class="img">
                                <span class="text">{{titleInfo.specialSymbol}}</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">营 销 词：</span>
                                <img :src="titleInfo.salesWords_judge==2?'/deepsearch/images/ok.png':'/deepsearch/images/warning_icon.png'" class="img">
                                <span class="text">{{titleInfo.salesWords}}</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">特殊字符：</span>
                                <img :src="titleInfo.specialSymbol_judge==2?'/deepsearch/images/ok.png':'/deepsearch/images/warning_icon.png'" class="img">
                                <span class="text">{{titleInfo.specialSymbol}}</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">重 复 词：</span>
                                <img :src="titleInfo.duplicateWords_judge==2?'/deepsearch/images/ok.png':'/deepsearch/images/warning_icon.png'" class="img">
                                <span class="text">{{titleInfo.duplicateWords}}</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">标题热词：</span>
                                <img :src="titleInfo.hotWords_judge==2?'/deepsearch/images/ok.png':'/deepsearch/images/warning_icon.png'" class="img">
                                <span class="text">{{titleInfo.hotWords}}</span>
                            </div>
                            <div class="titleResult_con2_box">
                                <span class="tit">违 禁 词：</span>
                                <img :src="titleInfo.duplicateWords_judge==2?'/deepsearch/images/ok.png':'/deepsearch/images/warning_icon.png'" class="img">
                                <span class="text">{{titleInfo.forbiddenWOrds}}</span>
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
                time:{
                    msg:null,
                    working:true,
                    vm:{
                        value:0,
                        style:'progress-bar-info',
                        showLabel:true,
                        striped:true

                    }

                }

            },
            created:function () {
                var _this=this;

            },
            mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
            },
            methods: { //专用于定义方法
                search:function(name){
                    var _this=this;
                    if(sessionStorage.getItem("user") ==null || sessionStorage.getItem("user")=='null'){
                        $('#myModal').modal('show');
                    }
                    else {
                        //初始化进度条
                        _this.time.msg = null
                        _this.time.vm.value = 0
                        _this.time.working = true
                        _this.titleInfo = '';
                        if (name == "") {
                            alert("请输入产品关键字")
                        } else {
                            buttonOff()
                            var interval = setInterval(function () {
                                _this.time.vm.value++;
                                if (_this.time.vm.value == 100) {
                                    _this.time.msg = "查询超时！请重新查询";
                                    _this.time.working = false;
                                    clearInterval(interval);
                                    bton();
                                }
                            }, 200);
                            //直通车
                            $.ajax({
                                type: 'get',
                                url: Url + 'getTitleYH',
                                dataType: 'json',
                                data: {
                                    searchWords: name
                                },
                                success: function (data) {

                                    _this.titleInfo = data.data.replace(/'/g, '"');
                                    _this.titleInfo = eval('(' + _this.titleInfo + ')');
                                    console.log(_this.titleInfo)
                                    //数据出现隐藏进度条
                                    clearInterval(interval);
                                    _this.time.working = false;
                                    buttonON()
                                    _this.$nextTick(function () {

                                    })

                                }
                            })
                        }
                    }
                }
            }
        })
        function buttonOff(){
            $(".search-btnN").attr("disabled",true);
        }
        function buttonON(){
            $(".search-btnN").attr("disabled",false);
        }
    })
</script>
</html>