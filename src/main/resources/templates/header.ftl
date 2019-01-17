<script src="/deepsearch/js/vue.min.js"></script>
<div id="app1" v-clock>
    <div class="header header_all">

        <div  class="header_gary">
            <div class="container header_before">
                <span>亲，欢迎进入白马查</span><a href="sign" class="head_portant">登录</a><a href="signup">免费注册</a>
            </div>
            <div class="container header_on">
                <span>亲爱的 <font class="head_portant head_name"></font>，欢迎进入白马查</span><a href="adminPage" class="head_portant head_ht" style="display:none">后台管理</a><span class="head_portant heade_cu " @click="outSign">退出登录</span>
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
                    <input type="text" name="" v-model="inputVal" placeholder="输入宝贝链接或ID，即可查看该宝贝的展现关键词...">
                    <span class="header_search_bt" @click="search(inputVal)">展现查询</span>
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
    <#--邀请码弹框-->
    <div class="index_frame" v-show="codeType==1?false:true">
        <div class="index_frame_box">
            <div class="index_frame_close" @click="codeHide"><img src="/deepsearch/images/close.png"> </div>
            <img src="/deepsearch/images/frame.png" width="100%">
            <div class="index_frame_code"><img src="/codeimg/codeImg.jpg"></div>
            <div class="index_frame_input">
                <input type="text" v-model="form.inviteCode">
                <span @click="codeCheck"></span>
            </div>
        </div>
    </div>
</div>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?a4870b68e468490bb90d07cd4e8cdc03";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script>
	$(function(){
        var app1=new Vue({

            el: '#app1',
			data:{
                inputVal:'',
                codeType:1,
                form:{
                    id:'',
                    inviteCode:''
                },
                userInfo:'',

            },
            created:function () {
                var _this=this;

            },
            methods:{
                //头部跳转
                search:function(headerval){
                    var _this=this;
                    if(headerval==''){
                        alert("请输入宝贝链接或者id");
                        //location.reload();

                    }else{
                        window.location.href="show?name="+headerval;
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

                },
                //验证邀请码
                codeCheck:function () {
                    var _this=this;
                    if(_this.userInfo==''){
                        alert("请登陆后再来输入！")
                        setTimeout(function(){ window.location.href="sign"; },1000);

                    }else{
                        _this.form.id=_this.userInfo.id;

                        $.ajax({
                            type: 'POST',
                            url:Url+ 'User/updateGradeNow',
                            dataType: 'json',
                            data:_this.form,
                            success: function (data) {
                                alert(data.msg)
                                if(data.code==0){
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
                                        },1000)
                                    })
                                }
                            }
                        })
                    }
                },
                codeHide:function () {
                    corehi();
                }
			}

        })

        if (sessionStorage.getItem("user") ==null || sessionStorage.getItem("user")=='null'){
            coresh();
        }
        else{
            if(user["grade"]==2){
                coresh();
            }
            app1.userInfo=JSON.parse(sessionStorage.getItem("user"));
            // console.log(app1.userInfo)
        }
        function coresh() {
            setTimeout(function () {
                $(".index_frame").stop(true).fadeIn(300);
            },1000)
        }
        function corehi() {
            $(".index_frame").stop(true).fadeOut(0);
        }
	})
    if (sessionStorage.getItem("user") ==null || sessionStorage.getItem("user")=='null'){
        $(".header_on").stop(true).fadeOut(0);
        $(".header_before").stop(true).fadeIn(0);

    }
    else{
        var user=JSON.parse(sessionStorage.getItem("user"));
        $(".header_before").stop(true).fadeOut(0);
        $(".header_on").stop(true).fadeIn(0);
        // console.log(user["id"])
        $(".header_on .head_name").text(user["id"]);
        if(user["grade"]==0){
            $(".head_ht").stop(true).fadeIn(0);
        }

    }


</script>