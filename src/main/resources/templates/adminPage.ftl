<!DOCTYPE>
<html ng-app="app">
<head>
    <title>首页</title>
    <!-- 设置文档编码 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=width,user-scalable=no">
    <meta name="viewport" content="user-scalable=no">
    <meta name="viewport" content="user-scalable=yes">
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <#--分页样式-->

    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link rel="stylesheet" href="/deepsearch/css/reset.css" />
    <link rel="stylesheet" href="/deepsearch/css/index.css" />
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">
    <script  type="text/javascript" src="/deepsearch/js/My97DatePicker/WdatePicker.js"></script>

    <!-- 下面是表单的格式 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <#--  <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">-->
    <!-- CSS样式 -->
    <style type="text/css">
        .panel{width:60%;margin:0 auto;text-align: center;}
        .form-inline{width:40%;margin:0 auto;}

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
<header>
    <div class="header-content">
        <div class="header-top">
            <a class="logo" href="javascript:;">
                <img src="img/logo.png"/>
                <p>电商在线查询工具</p>
            </a>

            <#--<ul class="nav pull-right">-->
                <#--<li id="fat-menu" class="dropdown">-->
                    <#--<a style="color:white " href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">-->
                        <#--<i style="color: white" class="icon-user"></i>-->
                        <#--<span ng-if="username!=null" ng-bind="username.id"></span>-->
                        <#--<span  ng-if="username==null" ng-click="signLogin()">登陆/注册</span>-->
                        <#--<i style="color: white" class="icon-caret-down"></i>-->
                    <#--</a>-->

                    <#--<ul  ng-if="username!=null" class="dropdown-menu">-->
                        <#--<li><a tabindex="-1" href="#" ng-if="username!=null && username.grade==1" ng-click="toAdminPage()">这里可以弄个返回前台</a></li>-->
                        <#--<li class="divider"></li>-->
                        <#--<li><a tabindex="-1" href="#" ng-click="signLogin()">注销</a></li>-->
                    <#--</ul>-->
                <#--</li>-->
            <#--</ul>-->
        </div>
        <div class="nav-list">
            <div class="one active">
                <a  class="" role="tab" data-toggle="tab"href="#renyuan">人员详情</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#cishu">使用次数</a>
            </div>

        </div>
    </div>
</header>
<!--导航-结束-->


<!--内容-开始-->
<div style=" overflow-y: auto;width: 100%;height: 75%;padding-top: 22px; " class="container">
    <div class="tab-content" >
        <!--用户信息-->
        <div role="tabpanel" class="tab-pane active" id="renyuan" >
            <div style="width: 100%;height: 100%" class="Container">
                <div class="row clearfix" style="text-align: center;min-width:1100px">
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
                    <button  ng-click="select()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;height: 36px;">查询</button>
                    <div ng-show="type==99" class="col-md-12 column form-inline " style="margin-top:20px;font-size: 20px">
                    <label class="font-7">开始时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" "/>
                    </div></br>
                    <div ng-show="type==99" class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">结束时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  onchange=""  "/>
                    </div>
                    <button  ng-click="export()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;height: 36px;">导出</button>
                    </br>
                    <#--<button  ng-click="select()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;">查询</button>-->

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
                                <td>{{data.registerDate|date:'yyyy-MM-dd HH:mm:ss'}}</td>
                                <td>{{data.lastLoginDate|date:'yyyy-MM-dd HH:mm:ss'}}</td>
                                <td>{{data.loginCount}}</td>
                                <td>{{data.grade}}</td>
                                <td>{{data.ban}}</td>
                                <td>
                                    <button  ng-click="banJ(data.id)" class="btn btn-primary btn-blockN btn-large">禁登</button>
                                    <button  ng-click="banH(data.id)" class="btn btn-primary btn-blockN btn-large">复登</button>
                                    <button  ng-click="resetpassword(data.id)" class="btn btn-primary btn-blockN btn-large">重置密码</button>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row form-inline">
                        <div class="col-md-8">



                            <ul uib-pagination
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
                            ></ul>


                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" style="width:100px;margin:25px 0" name="" ng-model="go" />
                            <a class="btn btn-primary btn-sm" ng-click="setPage(go)">跳转</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div  role="tabpanel" class="tab-pane " id="cishu"  >
            <div style="width: 100%;height: 100%" class="Container">
                <div class="row clearfix" style="text-align: center;min-width:1100px">
                    <div class="col-md-12 column form-inline" style="font-size: 20px">
                        <label class="font-7">用户手机：</label>
                        <input type="number" class="" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="id" name="id" placeholder="查询用户的手机号" required="required"/>
                    </div>
                    <#--<div class="col-md-12 column form-inline" style="font-size: 20px">-->
                        <#--<label class="font-7">查询模块：</label>-->
                        <#--<select ng-model="module"  style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" >-->
                            <#--<option value="">模块不限制</option>-->
                            <#--<option value="1">排名</option>-->
                            <#--<option value="2">违禁词</option>-->
                            <#--<option value="3">信誉</option>-->
                            <#--<option value="4">热词</option>-->
                            <#--<option value="5">降权</option>-->
                        <#--</select>-->
                    <#--</div>-->
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
                    <button  ng-click="selectFT()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;height: 36px;">查询</button>
                    <div ng-show="type==99" class="col-md-12 column form-inline " style="margin-top:20px;font-size: 20px">
                        <label class="font-7">开始时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" "/>
                    </div></br>
                    <div ng-show="type==99" class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">结束时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  onchange=""  "/>
                    </div></br>
                    <#--<button  ng-click="selectFT()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 190px;">查询</button>-->


    </div>
                <!--结果-->
                <div ng-show="djl"  style="text-align: center;min-width:1100px；width:85%;height:350px;">
                    <h2>{{dianjiliang}}</h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <td>用户手机</td>
                            <td>查询期限</td>
                            <td>模块种类</td>
                            <td>起始时间</td>
                            <td>截止时间</td>
                            <td>点击次数</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>排名</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{paiming}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>违禁词</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{weijinci}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>信誉</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{xinyu}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>热词</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{reci}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>降权</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{jiangquan}}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

    </div>
</div>
<!--内容-结束-->

<!--尾部-开始-->
<#--<div class="footer" style="background:#777777; width:100%; padding-bottom:20px; margin-top: 23px;">-->
    <#--<div class="container">-->
        <#--<div class="row">-->
            <#--&lt;#&ndash;<div class="col-sm-4">&ndash;&gt;-->

            <#--&lt;#&ndash;</div>&ndash;&gt;-->
            <#--&lt;#&ndash;<div class="col-sm-4">&ndash;&gt;-->

            <#--&lt;#&ndash;</div>&ndash;&gt;-->
            <#--&lt;#&ndash;<div class="col-sm-4">&ndash;&gt;-->

            <#--&lt;#&ndash;</div>&ndash;&gt;-->
            <#--<div class="col-sm-12 text-center" style="margin-top:20px;">-->
                <#--版权所有 Power by DeepDraw-->
            <#--</div>-->
        <#--</div>-->
    <#--</div>-->

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

    <div class="footer" style="position:fixed;bottom:0;width:100%;background-color:#e5e5e5;height: 40px;line-height: 40px;">
        <p>杭州兴淘网络科技有限公司  浙ICP备18047066号</p>
    </div>

</body>

<script src="/deepsearch/js/jquery-2.1.4.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/adminController.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
<#--主页面判断-->
<!-- 表单引入的 -->
<script src="/deepsearch/js/angular-ui-bootstrap.js"></script>
<script src="/deepsearch/js/index.js"></script>
<script src="https://cdn.bootcss.com/angular-ui-bootstrap/2.5.0/ui-bootstrap-tpls.min.js"></script>





<script type="text/javascript">
    user = '${user!}';
    $('.info-item').click(function(){
        $(this).addClass('active').siblings().removeClass('active');
    })
    var activeIndex = location.search.slice(1).split('=')[1]
    $('.one').eq(activeIndex).addClass('active')
    $('.one').on('click', function () {
        $(this).siblings().removeClass('active')
        $(this).addClass('active')
    })
    $('.one a').on('click', function () {
        $('.content').hide();
        $($(this).attr('data-id')).show()
    })
</script>

</html>
</html>