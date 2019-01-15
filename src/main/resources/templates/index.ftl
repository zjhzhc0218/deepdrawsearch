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

<body >
<div id="app" >
<!--  / header  -->
<div class="header">
	<div  class="header_gary">
		<div class="container" v-if="userInfo==''">
			<span>亲，欢迎进入白马查</span><a href="sign" class="head_portant">登录</a><a href="signup">免费注册</a>
		</div>
        <div class="container" v-if="userInfo!=''">
            <span>亲爱的 <font class="head_portant">{{userInfo.id}}</font>，欢迎进入白马查</span><a href="adminPage" class="head_portant" v-if="userInfo.grade==1">后台管理</a><span class="head_portant heade_cu" @click="outSign">退出登录</span>
        </div>
	</div>
	<div class="header_center">
		<div class="container clearfix">
			<div class="header_center_left">
				<a href="index">
					<div class="header_logo"><img src="/deepsearch/images/logo.jpg"></div>
					<p class="header_center_text">电商在线查询工具</p>
				</a>
			</div>
			<div class="header_center_search clearfix">
				<span class="search_icon"><img src="/deepsearch/images/search.png"></span>
				<input type="text" name="" v-model="inputVal" placeholder="输入宝贝链接或ID，即可查看该宝贝的展现关键词...">
				<span class="header_search_bt" @click="search(inputVal)">展现查询</span>
			</div>
		</div>
	</div>
	<div class="header_bottom">
		<div class="container clearfix">
			<div class="left_menu">
				<h2 class="left_menu_tit">白马查 · 功能导航</h2>
				<div class="left_menu_con">
					<div class="left_menu_box">
						<h5 class="title"><img src="images/menu1.png"><span>查排名工具</span></h5>
						<div class="left_menu_link">
							<a href="ranking">无线排名查询</a><a href="show">关键词展现查询  </a><a href="updown">上下架查询</a><a href="history">历史价格查询 </a>
						</div>
					</div>
					<div class="left_menu_box">
						<h5 class="title"><img src="images/menu2.png"><span>排名优化工具</span></h5>
						<div class="left_menu_link">
							<a href="reputation">买家信誉查询 </a><a href="score">动态评分查询</a><a href="authority">隐形降权查询 </a><a href="drop">下拉框选词查询 </a>
						</div>
					</div>
					<div class="left_menu_box">
						<h5 class="title"><img src="images/menu3.png"><span>流量提升工具</span></h5>
						<div class="left_menu_link">
							<a href="butler">白马单品管家  </a><a href="http://www.daoliuliang365.com" target="_blank">白马流量</a>
						</div>
					</div>
					<div class="left_menu_box">
						<h5 class="title"><img src="images/menu4.png"><span>卖家实用工具</span></h5>
						<div class="left_menu_link">
							<a href="catalog">宝贝类目查询 </a><a href="hotwords">20w热词</a><a href="reduction">淘宝指数还原 </a><a href="prohibited">违禁词查询  </a>
						</div>
					</div>
				</div>
			</div>
			<div class="right_menu">
				<ul class="clearfix">
					<li><a href="index">首页</a></li>
					<li><a href="ranking">查排名</a></li>
					<li><a href="authority">查降权</a></li>
					<li><a href="reputation">查信誉</a></li>
					<li><a href="drop">下拉框选词</a></li>
					<li><a href="butler">单品管家</a></li>
					<li><a href="http://www.daoliuliang365.com" target="_blank">白马流量</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--  / header  -->


<!--  / warpper  -->
<div class="warpper">
	<div class="container">
		<div class="index_ser1 all_mar clearfix">
			<div class="index_banner">
				<div class="swiper-container swiper_banner swiper-no-swiping">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a target="_blank"  href="sign" ><div class="index_bannerBox" style="background-image: url(/deepsearch/images/banner1.jpg);"></div></a>
						</div>
						<div class="swiper-slide">
							<a target="_blank" href="seven"><div class="index_bannerBox" style="background-image: url(/deepsearch/images/banner2.jpg);"></div></a>
						</div>
						<div class="swiper-slide">
							<a target="_blank" href="twentyone"><div class="index_bannerBox" style="background-image: url(/deepsearch/images/banner3.jpg);"></div></a>
						</div>
					</div>
				</div>
				<div class="pagination pagination_banner"></div>
				<div class="index_banner_bt left index_banner_bt_one"><i class="fa fa-angle-left"></i></div>
				<div class="index_banner_bt right index_banner_bt_one"><i class="fa fa-angle-right"></i></div>
			</div>
			<div class="index_ser1_right">
				<div class="index_login">
					<div class="img"><img src="/deepsearch/images/login_hearder.jpg" width="100%"></div>
					<h5 class="index_login_ttis" >HI, {{userInfo==""?"你还没有登录哦?":userInfo.id}}</h5>
					<a href="signup" class="index_login_ttis2" v-if="userInfo==''">没有账号？免费注册</a>
                    <p class="index_login_ttis2" v-if="userInfo!=''">会员等级：{{userInfo.grade==2?'普通会员':'VIP会员'}}</p>
					<div class="index_login_box">
						<a href="signup" v-if="userInfo==''">免费注册</a><a href="sign" v-if="userInfo==''">会员登录</a>
                        <a v-if="userInfo!=''" @click="outSign">退出登录</a>
					</div>
				</div>
				<div class="index_notice">
					<div class="index_notice_tit clearfix">
						<h5>最新公告</h5>
						<a href="notice">更多>></a>
					</div>
					<div class="index_notice_list">
						<ul>
							<li v-for="(item,index) in retailers" v-if="index<4"><a :href="'tool_details?='+item.serialNumber">{{item.title}}</a></li>
							<#--<li><a href="##">匹配人群标签，提升宝贝转化</a></li>-->
							<#--<li><a href="##">流量捕手、白拿拿得到省商务厅厅长点赞</a></li>-->
							<#--<li><a href="##">查排名使用教程</a></li>-->
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="index_ser2 all_mar">
			<div class="swiper-container swiper_list swiper-no-swiping">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a target="_blank" href="reputation"><div class="index_ser2_box"><img src="/deepsearch/images/index2_1.jpg" width="100%"></div></a>
					</div>
					<div class="swiper-slide">
						<a href="http://www.daoliuliang365.com" target="_blank"><div class="index_ser2_box"><img src="/deepsearch/images/index2_2.jpg" width="100%"></div></a>
					</div>
					<div class="swiper-slide">
						<a href="train" target="_blank"><div class="index_ser2_box"><img src="/deepsearch/images/index2_3.jpg" width="100%"></div></a>
					</div>
					<div class="swiper-slide">
						<a href="seven" target="_blank"><div class="index_ser2_box"><img src="/deepsearch/images/index2_4.jpg" width="100%"></div></a>
					</div>
				</div>
			</div>
			<div class="index_banner_bt left index_banner_bt_two"><i class="fa fa-angle-left"></i></div>
			<div class="index_banner_bt right index_banner_bt_two"><i class="fa fa-angle-right"></i></div>
		</div>
		<div class="index_ser3 all_mar">
			<div class="index_ser3_son clearfix">
				<div class="index_ser3_box" v-for="(item,index) in tool">
					<a :href="item.link" target="_blank">
						<div class="img">
							<img :src="item.image">
						</div>
						<h2 class="tit">{{item.title}}</h2>
						<p class="index_ser3_more">点击使用</p>
					</a>
				</div>
			</div>
		</div>
		<div class="index_ser4 all_mar">
			<div class="index_ser4_tit clearfix">
				<span :class="index==listType?'active':''" v-for='(items,index) in listTit' @click="getList(index)">{{items}}</span>
			</div>
			<div class="index_ser4_more clearfix">	
				<div class="index_ser4_left"><img src="/deepsearch/images/new.png"><span>最新上传资源</span></div>
				<div class="index_ser4_right"><a :href="'tool?id='+listType" target="_blank">更多>></a></div>
			</div>	
			<div class="index_ser4_con1" v-show="listType==0?true:false">
				<div class="row">
					<div class="col-sm-3" v-for="(item1,index) in datamation" v-if="index<12">
						<div class="index_ser4_box1" @click="downTy(item1.fileDownloadpath,item1.fileId)">
							<#--<a :href="item1.fileDownloadpath" :download="item1.fileDownloadpath">-->
							<a>
								<div class="img" style="'background-image: url('+item1.filePicture+')'"><span class="index_ser4_box1_tips">{{item1.fileType==1?'txt':(item1.fileTyp==2?'word':(item1.fileTyp==3?'pdf':'excel'))}}</span></div>
								<p>{{item1.fileName}}</p>
							</a>
						</div>
					</div>
				</div>
			</div>
			<#--<div class="index_ser4_con2" v-show="listType==1?true:false">-->
				<#--<div class="row">-->
					<#--<div class="col-sm-6" v-for="item2 in retailers">-->
						<#--<div class="index_ser4_box2 clearfix">-->
							<#--<a :href="'tool_details?id='+item2.serialNumber" target="_blank">-->
								<#--<div class="img" :style="'background-image:url('+item2.image+');'"></div>-->
								<#--<div class="text">-->
									<#--<h5>{{item2.title}}</h5>-->
									<#--<p>{{item2.describeN}}</p>-->
                                    <#--<h6>-->
                                        <#--<i class="fa fa-clock-o"></i>{{item2.creationTime}}-->
                                        <#--&lt;#&ndash;<span>浏览（{{item2.browse}}）</span>&ndash;&gt;-->
                                    <#--</h6>-->

								<#--</div>-->
							<#--</a>-->
						<#--</div>-->
					<#--</div>-->
				<#--</div>-->
			<#--</div>-->
			<#--<div class="index_ser4_con2" v-show="listType==2?true:false">-->
				<#--<div class="row">-->
					<#--<div class="col-sm-6" v-for="item2 in retailers2">-->
						<#--<div class="index_ser4_box2 clearfix">-->
							<#--<a :href="'tool_details?id='+item2.serialNumber" target="_blank">-->
								<#--<div class="img" :style="'background-image:url('+item2.cover+');'"></div>-->
								<#--<div class="text">-->
									<#--<h5>{{item2.title}}</h5>-->
									<#--<p>{{item2.text}}</p>-->
                                    <#--<h6>-->
                                        <#--<i class="fa fa-clock-o"></i>{{item2.creationTime}}-->
                                        <#--&lt;#&ndash;<span>浏览（{{item2.browse}}）</span>&ndash;&gt;-->
                                    <#--</h6>-->
								<#--</div>-->
							<#--</a>-->
						<#--</div>-->
					<#--</div>-->
				<#--</div>-->
			<#--</div>-->
		</div>
		<div class="index_ser5">
			<div class="index_ser5_title">
				<span>白马查运营战略合作品牌</span>
			</div>
			<div class="index_ser5_con clearfix">
				<p class="index_ser5_box" v-for="item4 in brand"><img :src="item4"></p>
			</div>
		</div>
	</div>
</div>
<!--  / warpper  -->

<div class="index_frame" v-show="codeType==1?false:true">
	<div class="index_frame_box">
		<div class="index_frame_close" @click="codeHide"><img src="/deepsearch/images/close.png"> </div>
		<img src="/deepsearch/images/frame.png" width="100%">
		<div class="index_frame_code"><img src="/deepsearch/images/codeImg.jpg"></div>
		<div class="index_frame_input">
			<input type="text" v-model="form.inviteCode">
			<span @click="codeCheck"></span>
		</div>
	</div>
</div>
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
			    inputVal:'',
			    form:{
			        id:'',
            		inviteCode:''
				},
			    codeType:1,
			    userInfo:[],
				listType:0,
				listTit:[
					'数据化运营',
					// '电商实战宝箱',
					// '电商头条'
				],
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
				// datamation:[
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index_4_1.jpg',
				// 		text:'谁说菜鸟不会数据分析(入门篇）谁说菜鸟不会数据分析(入门篇)'
				// 	},
				// ],
				// retailers1:[
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index5_1.jpg',
				// 		title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
				// 		text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
				// 		date:'2018-12-23',
				// 		browse:'1322'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index5_1.jpg',
				// 		title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
				// 		text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
				// 		date:'2018-12-23',
				// 		browse:'1322'
				// 	},
				// 	{
				// 		link:'',
				// 		image:'/deepsearch/images/index5_1.jpg',
				// 		title:'七天无理由退换货，但是包装贬损，消费者该赔吗？',
				// 		text:'就此现象，业内专家们展开了诸多探讨，并表示，即使由于退换货引发的包装贬损理应由消费者买单，商家也应尽到提前告知义务。',
				// 		date:'2018-12-23',
				// 		browse:'1322'
				// 	}
				// ],
				brand:[
					'/deepsearch/images/index6_1.png',
					'/deepsearch/images/index6_2.png',
					'/deepsearch/images/index6_3.png',
					'/deepsearch/images/index6_4.png',
					'/deepsearch/images/index6_5.png',
					'/deepsearch/images/index6_6.png',
					'/deepsearch/images/index6_7.png',
					'/deepsearch/images/index6_8.png',
					'/deepsearch/images/index6_9.png',
					'/deepsearch/images/index6_10.png',
					'/deepsearch/images/index6_11.png',
					'/deepsearch/images/index6_12.png',
					'/deepsearch/images/index6_13.png',
					'/deepsearch/images/index6_14.png',
				],
                retailers:[],
                retailers2:[],
                datamation:[]

			},
			created: function (){
				var _this=this;
				
				_this.$nextTick(function () {
                	index();
                	all();
                    // console.log(_this.userInfo);
                    if(this.userInfo==''){
                        _this.codeType=0;
                    }
                    else{
                        if(this.userInfo.grade==2){
                            _this.codeType=0;
                        }
                    }
                })
                //数据化运营
                $.ajax({
                    type: 'POST',
                    url:Url+ 'File/getFD',
                    dataType: 'json',
                    success: function (data) {
                        _this.datamation=data.data.list;
                    }
                })
                //头条
                $.ajax({
                    type: 'POST',
                    url:Url+ 'File/getAI',
                    dataType: 'json',
                    data:{
                        title:null,
                        typeN:0
                    },
                    success: function (data) {
                        _this.retailers=data.data.list;
                    }
                })
            },
			mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
	        },
	        methods: { //专用于定义方法
			    //判断是否可以下载
                downTy:function(downlink,fileId){
                    var _this=this;
                    $.ajax({
                        type: 'POST',
                        url:Url+ 'File/getFDNumber',
                        dataType: 'json',
                        success: function (data) {

                            if(_this.userInfo==''){
								alert("请登陆之后再下载！")
							}else{
                                if(data.code==0){
                                    $.ajax({
                                        type: 'POST',
                                        url:Url+ 'File/downfile',
                                        dataType: 'json',
                                        data:{
                                            id:fileId
                                        },
                                        success: function (data) {
                                            _this.$nextTick(function (){

                                                var form=$("<form>");//定义form表单,通过表单发送请求
                                                form.attr("style","display:none");//设置为不显示
                                                form.attr("target","");
                                                form.attr("method",downlink);//设置请求类型
                                                form.attr("action",url);//设置请求路径
                                                $("body").append(form);//添加表单到页面(body)中
                                                form.submit();//表单提交
                                            })
                                        }
                                    })

                                }else{
                                    alert("今日下载次数已用完！")
                                }
							}
                        }
                    })
				},
			    //头部跳转
                search:function(headerval){
                    if(headerval==''){
                        alert("请输入宝贝链接或者id");
                        //location.reload();
                    }else{
                        window.location.href="show?name="+headerval;
                    }
                },
			    //tab切换点击事件
	        	getList:function(index){
	        		var _this=this;
	        		_this.listType=index;
	        		if(index!=0){
                        //电商实战宝箱
                        $.ajax({
                            type: 'POST',
                            url:Url+ 'File/getAI',
                            dataType: 'json',
                            data:{
                                title:null,
                                typeN:index
                            },
                            success: function (data) {
                                if(index==1){
                                    _this.retailers=data.data.list;
                                }
                                else{
                                    _this.retailers2=data.data.list;
                                }
                                console.log(_this.retailers)
                            }
                        })
                    }
	        	},
                codeHide:function () {
                    var _this=this;
                    _this.codeType=1;
                },
				//验证邀请码
                codeCheck:function () {
                    var _this=this;
                    if(_this.userInfo==''){
                        alert("请登陆后再来输入！")
                        setTimeout(function(){ window.location.href="sign"; },1000);

					}else{
                        _this.form.id=_this.userInfo.id;
                        console.log(_this.userInfo)
                        $.ajax({
                            type: 'POST',
                            url:Url+ 'User/updateGradeNow',
                            dataType: 'json',
                            data:_this.form,
                            success: function (data) {
                                alert(data.msg)
                                if(data.code==0){
                                    _this.codeType=1;
                                }
                            }
                        })
					}
                },
				//退出登录
                outSign:function () {
                    var _this=this;
                    $.ajax({
                        type: 'POST',
                        url:Url+ 'removeSession',
                        dataType: 'json',
                        success: function (data) {
                        }
                    })
                    _this.$nextTick(function () {
                        sessionStorage.setItem("user",null);
                        alert("退出成功")
                        setTimeout(function(){ window.location.href="sign"; },1000);

                    })

                }
	        },

		})

		function index(){
            user = '${user!}';
            if(user!=''){
                app.userInfo=JSON.parse(user);
                sessionStorage.setItem("user",user);
            }else{
                sessionStorage.setItem("user",null);
            }
			var swiper = new Swiper('.swiper_banner', {
                pagination: '.pagination_banner',
                paginationClickable: true,
                nextButton: '.index_banner_bt_one.right',
                prevButton: '.index_banner_bt_one.left',
                autoplay:3000,
                speed: 1000,
                loop: true,
            });
		    var swiper2 = new Swiper('.swiper_list', {
		        paginationClickable: true,
		        spaceBetween: 20,
		        slidesPerView: 4,
		        nextButton: '.index_banner_bt_two.right',
		        prevButton: '.index_banner_bt_two.left',
		        autoplay:1500,
		        speed: 1000,
		        loop: true,
		    });
		    var leftWdith=($(window).width()-1200)/2+1200;
		    $(".index_core").css("left",leftWdith)
		    $(window).resize(function(){
		    	var leftWdith=($(window).width()-1200)/2+1200;
		    	$(".index_core").css("left",leftWdith)
		    })
            //判断用户是否存在
        }
	})

	
</script>
</html>
