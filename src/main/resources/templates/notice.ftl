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

<!--  / header  -->
    <#include "//header.ftl">
<!--  / header  -->
    <div id="app" v-clock>
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
                            <a :href="'tool_details?='+item.serialNumber">
                                <h5>{{item.title}}</h5>
                                <p>{{item.describeN}}</p>
                                <h6>{{item.creationTime}}</h6>
                            </a>
                        </div>
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

</body>
<script type="text/javascript">
    $(function(){
        var app=new Vue({
            el: '#app',
            data:{
                notice:[]

            },
            created: function (){
                var _this=this;
                _this.$nextTick(function () {
                    all()
                })

                $.ajax({
                    type: 'POST',
                    url: Url + '/File/getAI',
                    dataType: 'json',
                    data:{
                        title:null,
                        typeN:0
                    },
                    success: function (data) {
                        _this.notice=data.data.list;

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