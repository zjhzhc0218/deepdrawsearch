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
<div id="app" v-clock >
<!--  / header  -->
	<#include "//header.ftl">
<!--  / header  -->
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
				<div class="index_ser4_con1" v-show="listType==0?true:false">
					<div class="row">
						<div class="col-sm-3" v-for="item1 in datamation">
							<div class="index_ser4_box1">
								<a :href="item1.link">
									<div class="img"><img :src="item1.image" width="100%"></div>
									<p>{{item1.text}}</p>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="index_ser4_con2" v-show="listType==1?true:false">
					<div class="row">
						<div class="col-sm-6" v-for="item2 in retailers">
							<div class="index_ser4_box2 clearfix">
								<a :href="item2.link">
									<div class="img" :style="'background-image:url('+item2.image+');'"></div>
									<div class="text">
										<h5>{{item2.title}}</h5>
										<p>{{item2.text}}</p>
										<h6><i class="fa fa-clock-o"></i>{{item2.date}}<span>浏览（{{item2.browse}}）</span></h6>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="index_ser4_con2" v-show="listType==2?true:false">
					<div class="row">
						<div class="col-sm-6" v-for="item2 in retailers">
							<div class="index_ser4_box2 clearfix">
								<a :href="item2.link">
									<div class="img" :style="'background-image:url('+item2.image+');'"></div>
									<div class="text">
										<h5>{{item2.title}}</h5>
										<p>{{item2.text}}</p>
										<h6><i class="fa fa-clock-o"></i>{{item2.date}}<span>浏览（{{item2.browse}}）</span></h6>
									</div>
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
<!--  / footer  -->
	<#include "//footer.ftl">
<!--  / footer  -->
</div>
</body>
<script>

	$(function(){
		var app=new Vue({
			el: '#app',
			data: { 
				listType:0,
				listTit:[
					'数据化运营',
					'电商实战宝箱',
					'电商头条'
				],
				datamation:[
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
					{
						link:'',
						image:'images/index_4_1.jpg',
						text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
					},
				],
				retailers:[
					{
						link:'tool_details',
						image:'images/index5_1.jpg',
						title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
						text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
						date:'2018-12-23',
						browse:'1322'
					},
					{
						link:'tool_details',
						image:'images/index5_1.jpg',
						title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
						text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
						date:'2018-12-23',
						browse:'1322'
					},
					{
						link:'tool_details',
						image:'images/index5_1.jpg',
						title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
						text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
						date:'2018-12-23',
						browse:'1322'
					},
					{
						link:'tool_details',
						image:'images/index5_1.jpg',
						title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
						text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
						date:'2018-12-23',
						browse:'1322'
					},
					{
						link:'tool_details',
						image:'images/index5_1.jpg',
						title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
						text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
						date:'2018-12-23',
						browse:'1322'
					},
					{
						link:'tool_details',
						image:'images/index5_1.jpg',
						title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
						text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
						date:'2018-12-23',
						browse:'1322'
					}
				]

			},
			created: function (){
                var _this = this; //将this赋给一个自定义变量，以免在后面用this的时候混淆,专用于指向vue实例
                var index = window.location.href.lastIndexOf("=");
                var listnum= window.location.href.substring(index + 1, window.location.href.length);
				if(listnum>0){
                    _this.listType=listnum;
				}
                _this.$nextTick(function () {
                	all()
					console.log(_this.listType)
                })

			},
			mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
	        },
	        methods: { //专用于定义方法
	        	getList:function(index){
	        		var _this=this;
	        		_this.listType=index;
	        	}
	        },

		})
		
	})

	
</script>
</html>