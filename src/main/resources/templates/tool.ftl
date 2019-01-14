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

	<link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/common.css">
	<link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/swiper-3.4.1.min.css">
	<script src="/deepsearch/js/swiper-3.4.1.min.js"></script>
	<script src="/deepsearch/js/vue.min.js"></script>
	<script src="/deepsearch/js/pagination.js"></script>s
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
			您当前的位置：<a href="index">白马查</a>><a>电商资讯</a>
		</div>
		<div class="tool_con ">
			<div class="index_ser4 all_mar">
				<div class="index_ser4_tit clearfix">
					<span :class="index==listType?'active':''" v-for='(items,index) in listTit' @click="getList(index)">{{items}}</span>
				</div>
				<div class="index_ser4_con1">
					<div class="row">
						<div class="col-sm-3" v-for="item1 in datamation">
                            <div class="index_ser4_box1">
                                <a :href="item1.fileDownloadpath" :download="item1.fileDownloadpath">
                                    <div class="img" style="'background-image: url('+item1.filePicture+')'"><span class="index_ser4_box1_tips">{{item1.fileType==1?'txt':(item1.fileTyp==2?'word':(item1.fileTyp==3?'pdf':'excel'))}}</span></div>
                                    <p>{{item1.fileName}}</p>
                                </a>
                            </div>
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
<script>

	$(function(){
		var app=new Vue({
			el: '#app',
			data: { 
				listType:0,
				listTit:[
					'数据化运营',
					// '电商实战宝箱',
					// '电商头条'
				],
                datamation:[],
				// datamation:[
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// ],

			},
			created: function (){
                var _this = this; //将this赋给一个自定义变量，以免在后面用this的时候混淆,专用于指向vue实例
                var index = window.location.href.lastIndexOf("=");
                var listnum= window.location.href.substring(index + 1, window.location.href.length);
				if(listnum>0){
                    _this.listType=listnum;
				}

                //数据化运营
                $.ajax({
                    type: 'POST',
                    url:Url+ 'File/getFD',
                    dataType: 'json',
                    success: function (data) {
                        _this.datamation=data.data.list;
                    }
                })
                _this.$nextTick(function () {
                	all()
					console.log(_this.listType)
                })

			},
			mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
	        },
	        methods: { //专用于定义方法
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
		
	})

	
</script>
</html>