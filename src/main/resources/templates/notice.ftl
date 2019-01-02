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
    <!--[if lte IE 9]>
    <script src="/deepsearch/js/respond.min.js"></script>
    <script src="/deepsearch/js/html5shiv.js"></script>
    <![endif]-->

</head>

<body >
<div id="app" v-clock>
<!--  / header  -->
    <#include "//header.ftl">
<!--  / header  -->
<!--  / warpper  -->
<div class="warpper allhear_mar">
    <div class="container">
        <div class="notice_con">
            <div class="row">
                <div class="col-md-2">
                    <div class="notice_menu">
                        <h4 class="notice_menu_tit"><img src="/deepsearch/images/notice.png" ><span>消息中心</span></h4>
                        <ul class="notice_menu_list">
                            <li class="active"><a href="##">公告中心</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="notice_ccontent">
                        <div class="notice_ccontent_box" v-for="item in notice">
                            <a :href="item.link">
                                <h5>{{item.title}}</h5>
                                <p>{{item.content}}</p>
                                <h6>{{item.time}}</h6>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  / footer  -->
    <#include "//footer.ftl">
<!--  / footer  -->
</div>
</body>
<script type="text/javascript">
    $(function(){
        var app=new Vue({
            el: '#app',
            data:{
                notice:[
                    {
                        link:'tool_details',
                        title:'人民的宝贝，双12投票功能已就位！',
                        content:'距离双12倒计时还剩下100个小时不到啦，抓紧上车吧~~服务详询客服哦',
                        time:'2018-12-23 10:34'
                    },
                    {
                        link:'tool_details',
                        title:'人民的宝贝，双12投票功能已就位！',
                        content:'距离双12倒计时还剩下100个小时不到啦，抓紧上车吧~~服务详询客服哦',
                        time:'2018-12-23 10:34'
                    },
                    {
                        link:'tool_details',
                        title:'人民的宝贝，双12投票功能已就位！',
                        content:'距离双12倒计时还剩下100个小时不到啦，抓紧上车吧~~服务详询客服哦',
                        time:'2018-12-23 10:34'
                    },
                    {
                        link:'tool_details',
                        title:'人民的宝贝，双12投票功能已就位！',
                        content:'距离双12倒计时还剩下100个小时不到啦，抓紧上车吧~~服务详询客服哦',
                        time:'2018-12-23 10:34'
                    },
                ],
            },
            created: function (){
                var _this=this;
                _this.$nextTick(function () {
                    all()
                })

                $.ajax({
                    type: 'POST',
                    url: Url + '/Indexs/banner',
                    dataType: 'json',
                    success: function (data) {
                        $_this.$nextTick(function () {

                        })
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