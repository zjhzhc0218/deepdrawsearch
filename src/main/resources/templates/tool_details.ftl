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
	<script src="/deepsearch/js/index.js"></script>

	<link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/common.css">
	<link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/swiper-3.4.1.min.css">
	<script src="/deepsearch/js/swiper-3.4.1.min.js"></script>
	<script src="/deepsearch/js/vue.min.js"></script>
	<!--[if lte IE 9]>
	<script src="/deepsearch/js/respond.min.js"></script>
	<script src="/deepsearch/js/html5shiv.js"></script>
	<![endif]-->

</head>
<body>

<!--  / header  -->
<#include "//header.ftl">
<!--  / header  -->
<div id="app" v-clock>
<!--  / warpper  -->
<div class="warpper">
	<div class="container">
		<div class="all_nav">
			您当前的位置：<a href="index">白马查</a>><a href="tool">电商资讯</a>><a>{{toolDeatails.title}}</a>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="toolDetails_con">
					<div class="toolDetails_tit">
						<h2>{{toolDeatails.title}}</h2>
						<p>
							<#--<span>2230人浏览</span>-->
							<span>白马查</span><span>{{toolDeatails.creationTime}}</span></p>
					</div>
					<div class="toolDetails_box" v-html="toolDeatails.specificContent">

					</div>
					<div class="toolDetails_bt">
						<a href="javascript:history.back(-1)">返回列表</a>
					</div>
					<div class="toolDetails_go">
						<p v-if="toolUp!='null'">上一条：<a :href="'tool_details?id='+toolUp.serialNumber">{{toolUp.title}}</a></p>
						<p v-if="toolDown!='null'">下一条：<a :href="'tool_details?id='+toolDown.serialNumber">{{toolDown.title}}</a></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<#--<div class="hot_news">-->
					<#--<h2 class="tit">热门公告</h2>-->
					<#--<ul>-->
						<#--<li v-for="(item,index) in notice"><a :href="item.link"><b class="num" :class="index<3?'numFir':''">{{index+1}}</b><span class="text">{{item.title}}</span><span class="date">{{item.creationTime}}</span></a></li>-->
					<#--</ul>-->
				<#--</div>-->
				<div class="hot_tool hot_news">
					<h2 class="tit">热门工具</h2>
					<div class="hot_tool_con">
						<div class="row">
							<div class="col-md-4" v-for="item2 in tool">
								<div class="hot_tool_box">
									<a :href="item2.link" target="_blank">
										<h5><img :src="item2.image"></h5>
										<p>{{item2.title}}</p>
									</a>
								</div>
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
<script type="text/javascript">
	$(function(){
		var app=new Vue({
			el: '#app',
			data:{
                toolid:0,
				toolDeatails:[],
                notice:[],
                tool:[
                    {
                        link:'code',
                        title:'二维码卡首屏',
                        image:'/deepsearch/images/index3_1.jpg'
                    },
                    {
                        link:'code',
                        title:'淘口令卡首屏',
                        image:'/deepsearch/images/index3_2.jpg'
                    },
                    {
                        link:'http://www.daoliuliang365.com/douyin',
                        title:'抖音流量',
                        image:'/deepsearch/images/index3_3.jpg'
                    },
                    {
                        link:'spell',
                        title:'拼多多流量',
                        image:'/deepsearch/images/index3_4.jpg'
                    },
                    {
                        link:'http://www.daoliuliang365.com/',
                        title:'白马流量',
                        image:'/deepsearch/images/index3_5.jpg'
                    },
                    {
                        link:'reduction',
                        title:'淘宝指数还原',
                        image:'/deepsearch/images/index3_6.jpg'
                    },
                    {
                        link:'prohibited',
                        title:'违禁词查询',
                        image:'/deepsearch/images/index3_7.jpg'
                    },
                    {
                        link:'catalog',
                        title:'宝贝类目查询',
                        image:'/deepsearch/images/index3_8.jpg'
                    }

                ],
				toolUp:[],
                toolDown:[],
			},
			created: function (){
                var _this = this; //将this赋给一个自定义变量，以免在后面用this的时候混淆,专用于指向vue实例
                var index = window.location.href.lastIndexOf("=");
                var listnum= window.location.href.substring(index + 1, window.location.href.length);
                if(listnum>0){
                    _this.toolid=listnum;
                }
				var _this=this;
				_this.$nextTick(function () {
                	all()
                })

				//调用详情接口
                $.ajax({
                    type: 'POST',
                    url:Url+ 'File/getAIByIdContinuous ',
                    dataType: 'json',
                    data:{
                        id:_this.toolid,
                    },
                    success: function (data) {
                        _this.toolDeatails=data.data.now;
                            // alert(2)
						var date=new Date(_this.toolDeatails.creationTime);
						var Y = date.getFullYear() + '-';
						var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
						var D = date.getDate() + ' ';
						var h = date.getHours() + ':';
						var m = date.getMinutes() + ':';
						var s = date.getSeconds();
						_this.toolDeatails.creationTime =Y+M+D+h+m+s;
						console.log(_this.notice[i].creationTime);
                        _this.toolUp=data.data.shang;
                        _this.toolDown=data.data.xia;
                    }
                })


			},
			mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
	        },
	        methods: { //专用于定义方法
	        }
		})
	})
</script>
</html>