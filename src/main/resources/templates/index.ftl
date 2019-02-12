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
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/style.css">
	<script src="/deepsearch/js/extension.js"></script>
	<link rel="stylesheet" type="text/css" href="/deepsearch/css/common.css">
	<link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
	<link rel="stylesheet" href="https://3.swiper.com.cn/dist/css/swiper.min.css">
	<script src="https://3.swiper.com.cn/dist/js/swiper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<!--[if lte IE 9]>
	<script src="/deepsearch/js/respond.min.js"></script>
	<script src="/deepsearch/js/html5shiv.js"></script>
	<![endif]-->
</head>

<body >
<div id="app" v-clock="">
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
					<div class="header_logo"><img src="http://images-1257652487.file.myqcloud.com/images/logo.jpg"></div>
					<p class="header_center_text">电商在线查询工具</p>
				</a>
			</div>
			<div class="header_center_search clearfix">
				<span class="search_icon"><img src="http://images-1257652487.file.myqcloud.com/images/search.png"></span>
				<input type="text" name="" v-model="inputVal" placeholder="输入产品核心词，查看搜索高转化率优质相关关键词...">
				<span class="header_search_bt" @click="search(inputVal)">下拉框选词</span>
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
							<a href="butler">白马单品管家 </a><a href="http://www.daoliuliang365.com" target="_blank">白马流量</a>
							<a href="diction">直播车选词 </a><a href="title">标题诊断 </a>
						</div>
					</div>
					<div class="left_menu_box">
						<h5 class="title"><img src="images/menu4.png"><span>卖家实用工具</span></h5>
						<div class="left_menu_link">
							<a href="catalog">宝贝类目查询 </a><a href="hotwords">20w热词</a><a href="reduction">生意参谋指数还原 </a><a href="prohibited">违禁词查询  </a>
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
					<li><a href="diction">直通车选词<img class="header_hotIcon" src="/codeimg/hot.gif"></a></li>
					<li><a href="butler">单品管家</a></li>
					<li><a href="title">标题诊断<img class="header_hotIcon" src="/codeimg/hot.gif"></a></li>
					<#--<li><a v-if="userInfo!=''" href="http://www.daoliuliang365.com" target="_blank">白马流量</a></li>-->
                    <li><a href="reduction">生意参谋指数还原</a><img class="header_hotIcon" src="/codeimg/hot.gif"></li>
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
			<#--开工大吉-->
			<div class="nyear_box">
				<img src="http://images-1257652487.file.myqcloud.com/images/NY2.jpg" class="nyear_img2">
				<img src="http://images-1257652487.file.myqcloud.com/images/NY1.png" class="nyear_img1">
			</div>
			<img src="http://images-1257652487.file.myqcloud.com/images/NY3.png" class="nyear_img3">
			<div class="index_banner">
				<div class="swiper-container swiper_banner swiper-no-swiping">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a target="_blank"  href="sign" ><div class="index_bannerBox" style="background-image: url(http://images-1257652487.file.myqcloud.com/images/banner1.jpg);"></div></a>
						</div>
						<div class="swiper-slide">
							<a target="_blank" href="seven"><div class="index_bannerBox" style="background-image: url(http://images-1257652487.file.myqcloud.com/images/banner2.jpg);"></div></a>
						</div>
						<div class="swiper-slide">
							<a target="_blank" href="twentyone"><div class="index_bannerBox" style="background-image: url(http://images-1257652487.file.myqcloud.com/images/banner3.jpg);"></div></a>
						</div>
					</div>
				</div>
				<div class="pagination pagination_banner"></div>
				<div class="index_banner_bt left index_banner_bt_one"><i class="fa fa-angle-left"></i></div>
				<div class="index_banner_bt right index_banner_bt_one"><i class="fa fa-angle-right"></i></div>
			</div>
			<div class="index_ser1_right">
				<div class="index_login">
					<div class="img"><img src="http://images-1257652487.file.myqcloud.com/images/login_hearder.jpg" width="100%"></div>
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
							<li v-for="(item,index) in retailers" v-if="index<4"><a :href="'tool_details?='+item.id">{{item.title}}</a></li>
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
						<a target="_blank" href="reputation"><div class="index_ser2_box"><img src="http://images-1257652487.file.myqcloud.com/images/index2_1.jpg" width="100%"></div></a>
					</div>
					<div class="swiper-slide">
						<a href="http://www.daoliuliang365.com" target="_blank"><div class="index_ser2_box"><img src="http://images-1257652487.file.myqcloud.com/images/index2_2.jpg" width="100%"></div></a>
					</div>
					<div class="swiper-slide">
						<a href="train" target="_blank"><div class="index_ser2_box"><img src="http://images-1257652487.file.myqcloud.com/images/index2_3.jpg" width="100%"></div></a>
					</div>
					<div class="swiper-slide">
						<a href="seven" target="_blank"><div class="index_ser2_box"><img src="http://images-1257652487.file.myqcloud.com/images/index2_4.jpg" width="100%"></div></a>
					</div>
				</div>
			</div>
			<div class="index_banner_bt left index_banner_bt_two"><i class="fa fa-angle-left"></i></div>
			<div class="index_banner_bt right index_banner_bt_two"><i class="fa fa-angle-right"></i></div>
		</div>
		<div class="index_ser3 all_mar">
			<div class="index_ser3_son clearfix">
				<div class="index_ser3_box" v-for="(item,index) in tool">
					<a  @click="toolin(item.link,index)">
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
				<div class="index_ser4_left"><img src="http://images-1257652487.file.myqcloud.com/images/new.png"><span>最新上传资源</span></div>
				<div class="index_ser4_right"><a :href="'tool?id='+listType" target="_blank">更多>></a></div>
			</div>	
			<div class="index_ser4_con1" v-show="listType==0?true:false">
				<div class="row">
					<div class="col-sm-3" v-for="(item1,index) in datamation" v-if="index<12">
						<div class="index_ser4_box1" @click="downTy(item1.fileDownloadpath,item1.fileId)">
							<#--<a :href="item1.fileDownloadpath" :download="item1.fileDownloadpath">-->
							<#--<a>-->
								<div class="img" >
									<img :src="item1.filePicture" >
									<span class="index_ser4_box1_tips" v-if="item1.fileType<8" :class="item1.fileType==1?'tips1':(item1.fileType==2?'tips2':(item1.fileType==3?'tips1':(item1.fileType==4?'tips3':(item1.fileType==5?'tips4':(item1.fileType==6?'tips5':'tips6')))))">
										{{item1.fileType==1?'word':(item1.fileType==2?'pdf':(item1.fileType==3?'word':(item1.fileType==4?'excel':(item1.fileType==5?'ppt':(item1.fileType==6?'picture':'web')))))}}
									</span>
								</div>
								<p>{{item1.fileName}}</p>
							<#--</a>-->
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

<div class="index_frame" v-show="codeType==1?false:true">
	<div class="index_frame_box">
		<div class="index_frame_close" @click="codeHide"><img src="http://images-1257652487.file.myqcloud.com/images/close.png"> </div>
		<img src="http://images-1257652487.file.myqcloud.com/images/frame.png" width="100%">
		<div class="index_frame_code"><img src="/codeimg/codeImg.jpg"></div>
		<div class="index_frame_input">
			<input type="text" v-model="form.inviteCode">
			<span @click="codeCheck"></span>
		</div>
	</div>
</div>
</div>
<#--<div class="holidayBox">-->
	<#--<img src="http://images-1257652487.file.myqcloud.com/images/holiday_bg.jpg" width="100%">-->
	<#--<div class="holidayBox_text">-->
		<#--放假通知：本公司于2019年1月25号开始放春节假-->
		<#--期，2019年2月11号（初七）正常上班，期间如有-->
		<#--问题请联系下面客服：<span>微信号：dzspzxt，电话：18069407730，</span>-->
		<#--最后白马查祝大家新春快乐，2019大卖特卖！！-->
	<#--</div>-->
<#--</div>-->

<!--  / footer  -->
	<#include "//footer.ftl">
<!--  / footer  -->

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/index.js"></script>
<#--<script src="/deepsearch/js/move_port.js"></script>-->
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
                alllink:'',
				tool:[
					{
						link:'show',
						title:'关键词展现查询',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_2.jpg'
					},
					{
						link:'updown',
						title:'上下架查询',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_5.jpg'
					},
					{
						link:'reduction',
						title:'生意参谋指数还原',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_6.jpg'
					},
					{
						link:'prohibited',
						title:'违禁词查询',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_7.jpg'
					},
					{
						link:'catalog',
						title:'宝贝类目查询',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_8.jpg'
					},
					{
						link:'code',
						title:'二维码卡首屏',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_1.jpg'
					},
					{
						link:'http://www.daoliuliang365.com/douyin',
						title:'抖音流量',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_3.jpg'
					},
					{
						link:'spell',
						title:'拼多多流量',
						image:'http://images-1257652487.file.myqcloud.com/images/index3_4.jpg'
					}

				],
				brand:[
					'http://images-1257652487.file.myqcloud.com/images/index6_1.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_2.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_3.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_4.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_5.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_6.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_7.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_8.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_9.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_10.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_11.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_12.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_13.png',
					'http://images-1257652487.file.myqcloud.com/images/index6_14.png',
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
                        // coresh()
                    }
                    else{
                        if(this.userInfo.grade==2){
                            coresh()
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
                        _this.$nextTick(function () {
                            for (var i=0;i < _this.datamation.length ;i++) {
                                _this.datamation[i].filePicture= _this.datamation[i].filePicture.replace('/home/deep/uploadfile', '/picture');
                            }
                        })

                    }
                })
                //头条
                $.ajax({
                    type: 'POST',
                    url:Url+ 'Announcement/selectAnnouncement',
                    dataType: 'json',
                    data:{
                        title:null,
                    },
                    success: function (data) {
                        _this.retailers=data.data.list;
                    }
                })
            },
			mounted: function () { //页面渲染完成后执行，不包括需要请求的数据
	        },
	        methods: { //专用于定义方法

				//未登录点白马流量显示弹框
				toolin:function(link,key){
					var _this=this;
					if(key<5){
						window.open(link);
					}
					else{
						if(_this.userInfo==""){
							_this.$nextTick(function () {
								alert("登陆之后即可访问~")
								setTimeout(function(){ window.location.href="sign"; },1000);
							})
						}
						else{
							window.open(link);
						}
					}

				},
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
                                setTimeout(function(){ window.location.href="sign"; },1000);
							}else{
                                if(data.code==0){
                                    downshow()
									_this.alllink=fileId;

                                }else{
                                    alert("今日下载次数已用完！")
                                }
							}
                        }
                    })
				},
				//确认下载
                sureDown:function(id){
                    location.href = '/deepsearch/File/downfile/'+id;
                    downhide()
				},
				//取消下载
                surennoDown:function(){
                    downhide()
				},
			    //头部跳转
                search:function(headerval){
                    var _this=this;
                    // var reg =  /^[0-9]+.?[0-9]*$/;
                    if(headerval==''){
                        alert("请输入产品核心词");

                    }else{
                        // var copy = headerval;
                        // var _headtext = copy.match(/id=(\d*)/);
                        // if (_headtext) {
                        //     headerval = _headtext[1];
                        //     console.log(headerval)
                        // }
                        // if (!reg.test(headerval)) {
                        //     alert("宝贝ID或者宝贝链接输入不符合规则!")
                        // }
                        // else{
                            window.location.href="drop?name="+headerval;
                        // }

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
                    corehi();
                },
				//验证邀请码
                codeCheck:function () {
                    var _this=this;
                    if(_this.userInfo==''){
                        alert("请登陆后再来输入！")
                        setTimeout(function(){ window.location.href="sign"; },1000);

					}else{
                        _this.form.id=_this.userInfo.id;
                        // console.log(_this.userInfo)
                        $.ajax({
                            type: 'POST',
                            url:Url+ 'User/updateGradeNow',
                            dataType: 'json',
                            data:_this.form,
                            success: function (data) {

								if(data.code!=0){
                                    alert(data.msg)
								}
                                else{
                                    corehi();
                                    $.ajax({
                                        type: 'POST',
                                        url:Url+ 'User/selectGrade',
                                        dataType: 'json',
                                        data:{
                                            id:_this.userInfo.id
										},
                                        success: function (data) {

                                        }
                                    })
                                    _this.$nextTick(function () {
                                        var user2=JSON.parse(sessionStorage.getItem("user"));
                                        user2["grade"]=3;
                                        user2=JSON.stringify(user2)
                                        sessionStorage.setItem("user",user2)
                                        console.log(sessionStorage.getItem("user"))
                                        setTimeout(function () {
                                            location.reload()
                                            // $(".index_frame").stop(true).fadeIn(300);
                                        },500)
                                    })
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
                        alert("退出成功");

                        setTimeout(function(){window.location.reload()},1500);

                    })

                }
	        },

		})
		function downshow(){
			$(".index_Tips").stop(true).fadeIn(300);
		}
        function downhide(){
            $(".index_Tips").stop(true).fadeOut(0);
        }
        function coresh() {
            setTimeout(function () {
                $(".index_frame").stop(true).fadeIn(300);
            },2000)
        }
        function corehi() {
            $(".index_frame").stop(true).fadeOut(0);
        }
		function index(){

			// move_obj(".holidayBox");
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

            //判断用户是否存在
        }
	})

	
</script>
</html>
