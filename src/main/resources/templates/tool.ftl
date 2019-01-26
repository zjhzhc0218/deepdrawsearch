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
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
	<script src="/deepsearch/js/extension.js"></script>
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/common.css">
	<link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
	<link rel="stylesheet" href="https://3.swiper.com.cn/dist/css/swiper.min.css">
	<script src="https://3.swiper.com.cn/dist/js/swiper.min.js"></script>
	<#--<script src="https://cdn.jsdelivr.net/npm/vue"></script>-->
    <script src="/deepsearch/js/vue.min.js"></script>

	<!--[if lte IE 9]>
	<script src="/deepsearch/js/respond.min.js"></script>
	<script src="/deepsearch/js/html5shiv.js"></script>
	<![endif]-->

</head>
<body >

<!--  / header  -->
	<#include "//header.ftl">
<!--  / header  -->
<div id="app" v-clock >
<!--  / warpper  -->
<div class="warpper ">
	<div class="container">
		<div class="all_nav">
			您当前的位置：<a href="index">白马查</a>><a>数据化运营</a>
		</div>
		<div class="tool_con ">
			<div class="index_ser4 all_mar">
				<div class="index_ser4_tit clearfix">
					<span :class="index==listType?'active':''" v-for='(items,index) in listTit' @click="getList(index)">{{items}}</span>
				</div>
				<div class="index_ser4_con1">
					<div class="row">
						<div class="col-sm-3" v-for="item1 in datamation">
                            <div class="index_ser4_box1" @click="downTy(item1.fileDownloadpath,item1.fileId)">
                                <a >
                                    <div class="img">
										<img :src="item1.filePicture" >
                                        <span class="index_ser4_box1_tips" v-if="item1.fileType<8" :class="item1.fileType==1?'tips1':(item1.fileType==2?'tips2':(item1.fileType==3?'tips1':(item1.fileType==4?'tips3':(item1.fileType==5?'tips4':(item1.fileType==6?'tips5':'tips6')))))">
										{{item1.fileType==1?'word':(item1.fileType==2?'pdf':(item1.fileType==3?'word':(item1.fileType==4?'excel':(item1.fileType==5?'ppt':(item1.fileType==6?'picture':'web')))))}}
									</span>
                                    </div>
                                    <p>{{item1.fileName}}</p>
                                </a>
                            </div>
						</div>
					</div>
				</div>

                <navigation class='page clearfix' :pages="pages" :current.sync="pageNo" @navpage="msgListView" v-if="newPage.pin==1"></navigation>

			</div>
		</div>
	</div>
</div>
<div class="index_Tips wap_tanc">
	<div class="wap_tanc_bg"></div>
	<div class="wap_tanc_con">
		<h5> 本次点击会消耗一次下载机会（每天有2次下载权限）</h5>
		<div class="wap_tanc_btn clearfix">
			<span style="border-right: 1px solid #EBEBEB;" @click="sureDown(alllink)">确认</span><span @click="surennoDown">取消</span>
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
<script src="/deepsearch/js/pagination.js"></script>
<script>
$(document).ready(function() {

    $(function () {

        var app = new Vue({
            el: '#app',
            data: {
                listType: 0,
                listTit: [
                    '数据化运营',
                    // '电商实战宝箱',
                    // '电商头条'
                ],
                datamation: [],
                alllink: '',
                userInfo: '',
                proFilter: {
                    p: 1,
                    num: 12,
                },
                proShow: '',
                pages: '',
                pageNo: 1,
                newPage: ''
            },
            created: function () {
                var _this = this; //将this赋给一个自定义变量，以免在后面用this的时候混淆,专用于指向vue实例
                var index = window.location.href.lastIndexOf("=");
                var listnum = window.location.href.substring(index + 1, window.location.href.length);
                if (listnum > 0) {
                    _this.listType = listnum;
                }

                //分页
                $.ajax({
                    type: 'POST',
                    url: Url + 'File/selectPageForWords',
                    dataType: 'json',
                    data: _this.proFilter,
                    success: function (data) {
                        _this.datamation = data.data.info;
                        _this.newPage = data.data.page;
                        if(data.code=="0"){
                            _this.pages = parseInt(data.data.page.pageCount);
                            _this.$nextTick(function () {

                            })
                        }
						_this.$nextTick(function () {
							for (var i=0;i < _this.datamation.length ;i++) {
								_this.datamation[i].filePicture= _this.datamation[i].filePicture.replace('/home/deep/uploadfile', '/picture');
							}
						})
                    }
                })
                _this.$nextTick(function () {
                    all()
                    info()
                    console.log(_this.listType)
                })

            },
            mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
            },
            methods: { //专用于定义方法
                //分页
                msgListView: function (curPage) {
                    //根据当前页获取数据
                    var _this = this;
                    _this.proFilter.p = curPage;
                    _this.pageNo = _this.proFilter.p;
                    $.ajax({
                        type: 'POST',
                        url: Url + 'File/selectPageForWords',
                        dataType: 'json',
                        data: _this.proFilter,
                        success:function(data){
                            _this.datamation = []; //清空列表
                            _this.datamation = data.data.info;
                            _this.newPage = data.data.page;
                            if(data.code=="0"){
                                _this.pages = parseInt(data.data.page.pageCount);
                                _this.$nextTick(function () {

                                })
                            }
							_this.$nextTick(function () {
								for (var i=0;i < _this.datamation.length ;i++) {
									_this.datamation[i].filePicture= _this.datamation[i].filePicture.replace('/home/deep/uploadfile', '/picture');
								}
							})
                        }
                    });

                },
                //判断是否可以下载
                downTy: function (downlink, fileId) {
                    var _this = this;
                    $.ajax({
                        type: 'POST',
                        url: Url + 'File/getFDNumber',
                        dataType: 'json',
                        success: function (data) {
                            if (_this.userInfo == '') {
                                alert("请登陆之后再下载！")
                                setTimeout(function () {
                                    window.location.href = "sign";
                                }, 1000);
                            } else {
								if (data.code == 0) {
									downshow()
									_this.alllink = fileId;
								} else {
									alert("今日下载次数已用完！")
								}
                            }
                        }
                    })
                },
                //确认下载
                sureDown: function (id) {
                    location.href = '/deepsearch/File/downfile/' + id;
                    downhide()
                },
                //取消下载
                surennoDown: function () {
                    downhide()
                },
                // getList:function(index){
                // 	var _this=this;
                // 	_this.listType=index;
                //     if(index!=0){
                //         //电商实战宝箱
                //         $.ajax({
                //             type: 'POST',
                //             url:Url+ 'File/getAI',
                //             dataType: 'json',
                //             data:{
                //                 title:null,
                //                 typeN:index
                //             },
                //             success: function (data) {
                //                 if(index==1){
                //                     _this.retailers=data.data.list;
                //                 }
                //                 else{
                //                     _this.retailers2=data.data.list;
                //                 }
                //                 console.log(_this.retailers)
                //             }
                //         })
                //     }
                // }
            },

        })

        function downshow() {
            $(".index_Tips").stop(true).fadeIn(300);
        }

        function downhide() {
            $(".index_Tips").stop(true).fadeOut(0);
        }

        function info() {
            if (sessionStorage.getItem("user") == null || sessionStorage.getItem("user") == 'null') {

            } else {
                app.userInfo = sessionStorage.getItem("user");
            }
        }


    })

})
</script>
</html>