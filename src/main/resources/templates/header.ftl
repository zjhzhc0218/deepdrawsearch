<div class="header header_all">
	<div  class="header_gary">
		<div class="container header_before">
			<span>亲，欢迎进入白马查</span><a href="sign" class="head_portant">登录</a><a class="signup">免费注册</a>
		</div>
		<div class="container header_on">
			<span>亲爱的<font class="head_portant"></font>，欢迎进入白马查
		</div>
	</div>
	<div class="header_center">
		<div class="container clearfix">
			<div class="header_center_left">
				<a href="index">
					<div class="header_logo"><img src="images/logo.jpg"></div>
					<p class="header_center_text">电商在线查询工具</p>
				</a>
			</div>
			<div class="header_center_search clearfix">
				<span class="search_icon"><img src="images/search.png"></span>
				<input type="text" name="" placeholder="输入宝贝链接或ID，即可查看该宝贝的展现关键词/上下架/类目/历史价格等...">
				<span class="header_search_bt">查排名</span>
			</div>
		</div>
	</div>
	<div class="header_bottom">
		<div class="container clearfix">
			<div class="left_menu">
				<h2 class="left_menu_tit">白马查 · 功能导航 <i class="fa fa-angle-down"></i></h2>
				<div class="left_menu_con">
					<div class="left_menu_box">
						<h5 class="title"><img src="images/menu1.png"><span>查排名工具</span></h5>
						<div class="left_menu_link">
							<a href="ranking">无线排名查询</a><a href="show">关键词展现查询  </a><a href="updown">上下架查询</a><a href="##">历史价格查询 </a>
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
							<a href="##">白马单品管家  </a><a href="http://www.daoliuliang365.com" target="_blank">白马流量</a>
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
                    <li><a href="##">单品管家</a></li>
                    <li><a href="http://www.daoliuliang365.com" target="_blank">白马流量</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>

    if (sessionStorage.getItem("user") !=null){
        var user=JSON.parse(sessionStorage.getItem("user"));
        $(".header_before").stop(true).fadeOut(0);
        $(".header_on").stop(true).fadeIn(0);
        // console.log(user["id"])
        $(".header_on .head_portant").text(user["id"]);
    }
</script>