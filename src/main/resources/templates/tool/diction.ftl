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
                    <p>直通车选词</p>
                </div>
                <div class="toolALL_con">
                    <!-- 历史价格查询 -->
                    <div role="tabpanel" class="tab-pane" class="content">
                        <div class="search-view" style="margin-top: 30px">
                            <input type="text"id="showinput"  placeholder="请输入产品核心词 &quot;点击“查询” 按钮进行淘词" v-model="dictionText" />
                            <button class="btn search-btnN" @click="search(dictionText)">查询</button>
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

                    <div class="diction_result" v-show="dictionInfo!=''">
                        <div class="dictionRe_tit">
                            <h6 class="dictionRe_one">通过过滤后，查到关键词数量为{{dictionle}}个</h6>
                            <div class="dictionRe_menu clearfix">
                                <h5 class="dictionRe_menu_tit">类目筛选：</h5>
                                <div class="dictionRe_menu_list">
                                    <ul>
                                        <li v-for="(item,index) in dictionMenu" @click="menuSelect(item.data)">{{item.title}}</li>
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
                                        <td>竞争度</td>
                                        <td>搜索趋势</td>
                                        <td>推荐类目</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#--<tr class="diction_one_tr">-->
                                        <#--<td><span class="diction_table_tit">卫衣</span></td>-->
                                        <#--<td>278	</td>-->
                                        <#--<td>3	</td>-->
                                        <#--<td>0.96%</td>-->
                                        <#--<td>0.00%</td>-->
                                        <#--<td>11</td>-->
                                        <#--<td><span class="diction_line up"><b style="width: 10%;"></b></span></td>-->
                                        <#--<td>运动服/休闲服装>>运动卫衣/套头衫</td>-->
                                    <#--</tr>-->
                                    <tr v-for="(item1,index) in currentPageData">
                                        <td>{{item1.id}}.<span class="diction_table_tit">{{item1.a_text}}</span></td>
                                        <td>{{item1.zhanxian}}</td>
                                        <td>{{item1.dianji}}</td>
                                        <td>{{item1.dianjilv}}</td>
                                        <td>{{item1.zhuanhua}}</td>
                                        <td>{{item1.jingzheng}}</td>
                                        <td>
                                            <span class="diction_line" v-show="item1.type==1"><b :style="{'width':item1.qushi+'%'}"></b></span>
                                            <span class="diction_line up " v-show="item1.type==2"><b :style="{'width':item1.qushi+'%'}"></b></span>
                                        </td>
                                        <td>{{item1.leimu}}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="pageN_box" v-show="totalPage>1">
                                <button @click="prevPage()" class="pageNud">
                                    上一页
                                </button>
                                <div class="pageN_num">第<input type="text" v-model="currentPage2" onkeyup="value=value.replace(/[^\d]/g,'')" /><span class="pageN_jump pageNud" @click="pageN_jump">跳转</span>/共{{totalPage}}页</div>

                                <button @click="nextPage()" class="pageNud">
                                    下一页
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- 历史价格结果界面 -->
                    <!-- 历史价格查询 -->
                    <div class="toolALL_info">
                        <div class="toolALL_info_box">
                            <h5 class="toolALL_info_tit">直通车选词使用说明</h5>
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
                dictionInfo:[],
                dictionInfo2:[], //所有数据
                dictionMenu:[],
                dictionQs:[],
                dictionle:0,
                userInfo:'',
                time:{
                    msg:null,
                    working:true,
                    vm:{
                        value:0,
                        style:'progress-bar-info',
                        showLabel:true,
                        striped:true

                    }

                },
                totalPage: 1, // 统共页数，默认为1
                currentPage: 1, //当前页数 ，默认为1
                currentPage2:1,
                pageSize:30, // 每页显示数量
                currentPageData: [] //当前页显示内容
            },
            created:function () {
                var _this=this;
            },
            mounted() {
                var _this=this;

            },
            methods: { //专用于定义方法
                search:function (name) {
                    var _this=this;
                    if(sessionStorage.getItem("user") ==null || sessionStorage.getItem("user")=='null'){
                        $('#myModal').modal('show');
                    }
                    else{
                        //初始化进度条
                        _this.time.msg=null
                        _this.time.vm.value=0
                        _this.time.working=true
                        _this.dictionInfo=''

                        if(name==""){
                            alert("请输入产品关键字")
                        }
                        else{
                            btoff();

                            var interval = setInterval(function(){
                                _this.time.vm.value++;
                                if (_this.time.vm.value == 100) {
                                    _this.time.msg = "查询超时！请重新查询";
                                    _this.time.working = false;
                                    clearInterval(interval);
                                    bton();
                                }
                            }, 600);

                            //直通车
                            $.ajax({
                                type: 'get',
                                url:Url+ 'getZtongCar',
                                dataType: 'json',
                                data:{
                                    searchWords:name
                                },
                                success: function (data) {
                                    _this.dictionInfo=data.data.replace(/'/g, '"')
                                    _this.dictionInfo=eval('(' + _this.dictionInfo + ')');
                                    _this.dictionInfo2=_this.dictionInfo[0];
                                    _this.dictionle=_this.dictionInfo2.length;
                                    //转化成类目数组
                                    var res = _this.dictionInfo[1]
                                    list = []
                                    for (var i=0;i<res.length;i++) {
                                        for (var d in res[i]) {
                                            var cc = {};
                                            cc.title = d;
                                            cc.data =  res[i][d];
                                            list.push(cc)
                                        }
                                    }
                                    _this.dictionMenu=list;
                                    // console.log(_this.dictionMenu);
                                    // console.log( _this.dictionInfo)
                                    _this.$nextTick(function () {

                                        //趋势转化为百分比
                                        for (var i=0;i<_this.dictionInfo2.length;i++) {
                                            _this.dictionInfo2[i].qushi=parseFloat(this.dictionInfo2[i].qushi)*100
                                            if(_this.dictionInfo2[i].qushi>=0){
                                                _this.dictionInfo2[i]['type']=1;
                                            }else{
                                                _this.dictionInfo2[i].qushi=Math.abs(_this.dictionInfo2[i].qushi)
                                                _this.dictionInfo2[i]['type']=2;
                                            }
                                            _this.dictionInfo2[i]['id']=i+1;
                                        }
                                        // console.log(_this.dictionInfo2);
                                        // 计算一共有几页
                                        _this.totalPage = Math.ceil(_this.dictionInfo2.length / _this.pageSize);
                                        // 计算得0时设置为1
                                        _this.totalPage = _this.totalPage == 0 ? 1 : _this.totalPage;
                                        _this.getCurrentPageData();
                                    })
                                    //数据出现隐藏进度条
                                    clearInterval(interval);
                                    _this.time.working=false;
                                    bton();

                                }
                            })

                        }
                    }
                },
                // 设置当前页面数据，对数组操作的截取规则为[0~9],[10~20]...,
                // 当currentPage为1时，我们显示(0*pageSize+1)-1*pageSize，当currentPage为2时，我们显示(1*pageSize+1)-2*pageSize...
                getCurrentPageData:function() {
                    var _this=this;
                    var begin = (_this.currentPage - 1) * _this.pageSize;
                    var end = _this.currentPage * _this.pageSize;
                    _this.currentPageData = _this.dictionInfo2.slice(
                        begin,
                        end
                    );
                },
                //上一页
                prevPage:function() {
                    // console.log(this.currentPage);
                    if (this.currentPage == 1) {
                        return false;
                    } else {
                        this.currentPage--;
                        this.getCurrentPageData();
                    }
                    this.currentPage2=this.currentPage
                },
                // 下一页
                nextPage:function() {

                    if (this.currentPage == this.totalPage) {
                        return false;
                    } else {
                        this.currentPage++;
                        this.getCurrentPageData();
                    }
                    this.currentPage2=this.currentPage
                },
                //跳转页面
                pageN_jump:function(){
                    var _this=this;
                    if(_this.currentPage>_this.totalPage || _this.currentPage<=0){
                        alert("请输入正确的页数")
                    }
                    else{

                        this.currentPage=this.currentPage2
                        this.getCurrentPageData();

                    }
                },
                //根据类目选择
                menuSelect:function (arr) {
                    var _this=this;
                    _this.currentPage=1;
                    _this.currentPage2=1;
                    //趋势转化为百分比
                    for (var i=0;i<arr.length;i++) {
                        var sf=arr[i].qushi=parseFloat(arr[i].qushi)
                        if(sf>1){
                        }else{
                            arr[i].qushi=parseFloat(arr[i].qushi)*100
                            if(arr[i].qushi>=0){
                                arr[i]['type']=1;
                            }else{
                                arr[i].qushi=Math.abs(arr[i].qushi)
                                arr[i]['type']=2;
                            }
                            arr[i]['id']=i+1;
                        }


                    }
                    _this.dictionInfo2=[];
                    _this.dictionInfo2=arr;
                    // console.log(_this.dictionInfo2);
                    // console.log(_this.currentPage);
                    // 计算一共有几页
                    _this.totalPage = Math.ceil(_this.dictionInfo2.length / _this.pageSize);
                    // 计算得0时设置为1
                    _this.totalPage = _this.totalPage == 0 ? 1 : _this.totalPage;
                    _this.getCurrentPageData();
                }
                
            }


        })


        function btoff() {
              $(".btn.search-btnN").attr('disabled',true);
        }
        function bton() {
            $(".btn.search-btnN").attr('disabled',false);
        }
    })
</script>
</html>