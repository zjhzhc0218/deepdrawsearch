<!DOCTYPE>
<html ng-app="app">
<head>
    <title>首页</title>
    <!-- 设置文档编码 -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <#--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  -->
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
    <script  type="text/javascript" src="/deepsearch/js/My97DatePicker/WdatePicker.js"></script>

    <!-- 下面是表单的格式 -->
    <link rel="stylesheet" href="/deepsearch/css/normalize.css">
    <#--<link rel="stylesheet" href="http://www.jq22.com/demo/angular201707111100/css/bootstrap.min.css">-->


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
                <li style="width: 150px;"><a style="text-align:center;font-size: 10px" href="#cishu"  role="tab" data-toggle="tab" ><strong>使用次数</strong></a></li>
            </ul>
        </div>
    </div>
</nav>
<!--导航-结束-->

<!--内容-开始-->
<div style=" overflow-y: auto;width: 90%;height: 75%" class="container">
    <div class="tab-content">
        <!--用户信息-->
        <div role="tabpanel" class="tab-pane active" id="renyuan" >
            <div style="width: 100%;height: 100%" class="Container">
                <div class="row clearfix">
                    <div class="col-md-12 column form-inline" style="font-size: 20px">
                            <label class="font-7">用户手机：</label>
                            <input type="number" class="" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="id" name="id" placeholder="查询用户的手机号" required="required"/>
                    </div>
                    <div class="col-md-12 column form-inline" style="font-size: 20px">
                        <label class="font-7">查询期限：</label>
                        <select ng-model="type"  style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" >
                            <option value="99">时间不限制</option>
                            <option value="2">当天</option>
                            <option value="3">当周</option>
                            <option value="4">当月</option>
                            <option value="5">当年</option>
                        </select>
                    </div>
                    <div class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">开始时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" "/>
                    </div></br>
                    <div class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">结束时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  onchange=""  "/>
                    </div></br>
                    <button  ng-click="select()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;">查询</button>

                    <div class="panel">
                        <div class="row req form-inline">
                            <div class="col-md-8 col-md-offset-4 solid_top form-group">
                                <div class="pull-right">
                                    <label>展示条数:
                                        <select  class="form-control" ng-change="change(selectedLimit)" ng-model="selectedLimit" ng-options="value.limit for value in values"></select>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <table class="table">
                            <thead>
                            <tr>
                                <td>用户手机</td>
                                <td>注册时间</td>
                                <td>最后登录时间</td>
                                <td>登录次数</td>
                                <td>用户权限</td>
                                <td>是否禁用</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr  ng-repeat="data in datas">
                                <td>{{data.id}}</td>
                                <td>{{data.registerDate|date:'yyyy-MM-dd hh:mm:ss'}}</td>
                                <td>{{data.lastLoginDate|date:'yyyy-MM-dd hh:mm:ss'}}</td>
                                <td>{{data.loginCount}}</td>
                                <td>{{data.grade}}</td>
                                <td>{{data.ban}}</td>
                                <td>
                                    <button  ng-click="banJ(data.id)" class="btn btn-primary btn-block btn-large">禁止登录</button>
                                    <button  ng-click="banH(data.id)" class="btn btn-primary btn-block btn-large">恢复登录</button>
                                    <button  ng-click="resetpassword(data.id)" class="btn btn-primary btn-block btn-large">一键还原初始密码</button>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row form-inline">
                        <div class="col-md-8">
                            <uib-pagination
                                    total-items="page.totalCount"
                                    ng-model="page.pageNo"
                                    max-size="5"
                                    class="samplePage pagination"
                                    boundary-links="true"
                                    force-ellipses="false"
                                    first-text="首页"
                                    last-text="末页"
                                    previous-text="上一页"
                                    next-text="下一页"
                                    items-per-page="page.limit"
                                    ng-change="pageChanged()"
                                    boundary-link-numbers="true"
                            >
                            </uib-pagination>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" style="width:100px;margin:25px 0" name="" ng-model="go" />
                            <a class="btn btn-primary btn-sm" ng-click="setPage(go)">跳转</a>
                        </div>
                    </div>


                </div>

                <!--结果-->
                <div class="result " id="" style="width:85%;height:350px;">

                </div>
            </div>
        </div>

        <div  role="tabpanel" class="tab-pane " id="cishu"  >
            <div style="width: 100%;height: 100%" class="Container">
                <div class="row clearfix">
                    <div class="col-md-12 column form-inline" style="font-size: 20px">
                        <label class="font-7">用户手机：</label>
                        <input type="number" class="" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="id" name="id" placeholder="查询用户的手机号" required="required"/>
                    </div>
                    <div class="col-md-12 column form-inline" style="font-size: 20px">
                        <label class="font-7">查询模块：</label>
                        <select ng-model="module"  style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" >
                            <option value="">模块不限制</option>
                            <option value="1">排名</option>
                            <option value="2">违禁词</option>
                            <option value="3">信誉</option>
                            <option value="4">热词</option>
                            <option value="5">降权</option>
                        </select>
                    </div>
                    <div class="col-md-12 column form-inline" style="font-size: 20px">
                        <label class="font-7">查询期限：</label>
                        <select ng-model="type"  style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" >
                            <option value="99">时间不限制</option>
                            <option value="2">当天</option>
                            <option value="3">当周</option>
                            <option value="4">当月</option>
                            <option value="5">当年</option>
                        </select>
                    </div>
                    <div class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">开始时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" "/>
                    </div></br>
                    <div class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">结束时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  onchange=""  "/>
                    </div></br>
                    <button  ng-click="selectFT()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;">查询</button>


                </div>

                <!--结果-->
                <div class="result " id="" style="width:85%;height:350px;">

                </div>
            </div>
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
<!-- 表单引入的 -->
<#--<script src="http://www.jq22.com/jquery/angular-1.4.6.js"></script>-->
<#--<script type="text/javascript" src="http://www.jq22.com/demo/angular201707111100/js/ui-bootstrap-tpls.min.js"></script>-->
<script src="https://cdn.bootcss.com/angular-ui-bootstrap/2.5.0/ui-bootstrap-tpls.min.js"></script>

<script type="text/javascript">



</html>
</html>