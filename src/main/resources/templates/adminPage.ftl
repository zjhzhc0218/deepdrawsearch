<!DOCTYPE>
<html ng-app="app">
<head>
    <title>首页</title>
    <!-- 设置文档编码 -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <!--  -->
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
    <script  type="text/javascript" src="/deepsearch/js/My97DatePicker/WdatePicker.js"></script>

    <!-- CSS样式 -->
    <style type="text/css">
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #373731;
            /*font-style: italic;*/
            font-weight: bold;
            font-size: 30px;
        }
        .error{
            color:red;
        }
        .result-context span {
            font-size: 30px;
        }

    </style>

</head>

<body ng-controller="adminController" style="overflow: hidden">
<!--顶部-开始-->
<div style=" background:#EBEBEB; width:100%; height:80px; line-height:80px;">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav pull-right">
                </ul>
                <a style="text-decoration:none" class="brand" href="index.ftl"><span class="first">后台页面</span></a>
            </div>
        </div>
    </div>
</div>
<!--顶部-结束-->

<!--导航-开始-->
<nav style="" class="navbar navbar-default">
    <div class="container">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li style="width: 150px;" class="active" ><a style="text-align:center;font-size: 10px" href="#renyuan"  role="tab" data-toggle="tab"><strong>人员</strong></a></li>
                <li style="width: 150px;"><a style="text-align:center;font-size: 10px" href="#cishu"  role="tab" data-toggle="tab" ng-click="searchLogin()"><strong>使用次数</strong></a></li>
            </ul>
        </div>
    </div>
</nav>
<!--导航-结束-->

<!--内容-开始-->
<div style="width: 90%;height: 75%" class="container">
    <div class="tab-content">
        <!--排名-->
        <div role="tabpanel" class="tab-pane active" id="renyuan">
            <div style="width: 100%;height: 100%" class="Container">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <dl>
                            <dt style="font-size: 20px">
                                人员
                            </dt>
                            <dd style="font-size: 15px">

                            </dd>
                            <dd style="font-size: 15px">
                                <span style="color: red">注意：</span>
                            </dd>
                        </dl>
                    </div>
                    <div class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">开始时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" "/>
                    </div></br>
                    <div class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">结束时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  onchange=""  "/>
                    </div></br>

                    <button class="btn" ng-click="check()">确定 </button>
                </div>

                <!--结果-->
                <div class="result " id="" style="width:85%;height:350px;">

                </div>
            </div>

        </div>
        <div ng-if="" role="tabpanel" class="tab-pane " id="cishu" >

        </div>




    </div>
</div>
<!--内容-结束-->

<!--尾部-开始-->
<div class="footer" style="background:#777777; width:100%; padding-bottom:20px; margin-top: 23px;">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">

            </div>
            <div class="col-sm-4">

            </div>
            <div class="col-sm-4">

            </div>
            <div class="col-sm-12 text-center" style="margin-top:20px;">
                版权所有 Power by DeepDraw
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 25px ;color: red;text-align: center">请登陆后进行查询！</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" ng-click="signLogin()">注册/登陆</button>
                </div>
            </div>
        </div>
    </div>

</div>
<!--尾部-结束-->


</body>

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/adminController.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</html>