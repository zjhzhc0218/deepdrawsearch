<!DOCTYPE>
<html ng-app="search">
<head>
    <title>首页</title>
    <!-- 设置文档编码 -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <!--  -->
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">

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

<body ng-controller="searchController" style="overflow: hidden">
<!--顶部-开始-->
<div style=" background:#EBEBEB; width:100%; height:80px; line-height:80px;">
    <!--<div class="container">
        <div class="row">
            <span class="col-sm-7 col-sm-offset-1 col-xs-6 col-xs-offset-1">
                <h3 style="text-align: center"><strong>卖家在线查询</strong></h3>
            </span>

            <ul class="nav pull-right">

                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user"></i> Jack Smith
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="#">Settings</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="sign-in.html">Logout</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>-->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav pull-right">
                    <li id="fat-menu" class="dropdown">
                        <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>
                            <span ng-if="username!=null" ng-bind="username.id"></span>
                            <span ng-if="username==null" ng-click="signLogin()">登陆/注册</span>
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul  ng-if="username!=null" class="dropdown-menu">
                            <li><a tabindex="-1" href="#" ng-if="username!=null && username.grade==1" ng-click="toAdminPage()">后台管理</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="#" ng-click="signLogin()">注销</a></li>
                        </ul>
                    </li>
                </ul>
                <a style="text-decoration:none" class="brand" href="sign.ftl"><span class="first">卖家在线查询</span></a>
                <!--<a class="brand" href="#"> <h3 style="text-align: center"><strong>卖家在线查询</strong></h3></a>-->
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
                <li style="width: 150px;" class="active" ><a style="text-align:center;font-size: 10px" href="#paimin"  role="tab" data-toggle="tab"><strong>淘宝排名</strong></a></li>
                <li style="width: 150px;"><a style="text-align:center;font-size: 10px" href="#reci"  role="tab" data-toggle="tab" ng-click="searchLogin()"><strong>热词下载</strong></a></li>
                <li style="width: 150px;"><a style="text-align:center;font-size: 10px" href="#jiangquan"  role="tab" data-toggle="tab"><strong>降权查询</strong></a></li>
                <li style="width: 150px;"><a style="text-align:center;font-size: 10px" href="#xinyu"  role="tab" data-toggle="tab"><strong>信誉查询</strong></a></li>
                <li style="width: 150px;"><a style="text-align:center;font-size: 10px" href="#weijin"  role="tab" data-toggle="tab"><strong>违禁词</strong></a></li>
            </ul>
        </div>
    </div>
</nav>
<!--导航-结束-->

<!--内容-开始-->
<div style="width: 90%;height: 75%" class="container">
    <div class="tab-content">
    <!--排名-->
    <div role="tabpanel" class="tab-pane active" id="paimin">
        <div style="width: 100%;height: 100%" class="Container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <dl>
                        <dt style="font-size: 20px">
                            宝贝排名查询
                        </dt>
                        <dd style="font-size: 15px">

                        </dd>
                        <dd style="font-size: 15px">
                            <span style="color: red">注意：宝贝排名只提供参考，非淘宝官方数据</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="row clearfix" >
                <div class="col-md-12 column form-inline " style="font-size: 20px">
                    <label class="font-14">关键字：</label>
                    <input type="text" class="form-control" style="width: 263px;border-radius:5px ;margin-left: 119px;" ng-model="bbPaiMing.keyWords"/>
                </div></br>
                <div class="col-md-12 column form-inline " style="font-size: 20px;top:10px">
                    <label class="font-14">宝贝ID或者宝贝链接：</label>
                    <input type="text" class="form-control" style="width: 263px;border-radius:5px " ng-model="bbPaiMing.tbaoId"/>
                </div>
            </div>
            <div style="margin-top: 30px" class="button-container text-left">
                <button class="btn btn-success" ng-click="searchPaiming()" ng-disabled="bbPaiMing.working">检测一下</button>
            </div></br>
            <!--结果-->
            <div class="result " id="pmrs" style="width:85%;height:350px;">
                <div style="width: 100%" ng-if="bbPaiMing.msg == null " ng-show="bbPaiMing.vm.value!=0&&bbPaiMing.vm.value!=100">
                    <div ng-class="{progress: true, 'progress-striped': bbPaiMing.vm.striped}">
                        <div ng-class="['progress-bar', bbPaiMing.vm.style]" ng-style="{width: bbPaiMing.vm.value + '%'}">
                            <div ng-if="bbPaiMing.vm.showLabel">{{bbPaiMing.vm.value}}%</div>
                        </div>
                    </div>
                </div>
                <div class="noViolation " ng-show="bbPaiMing.msg != null" style="color: red;font-size: 30px" ng-bind="bbPaiMing.msg">
                </div>
                <div class="result-context" ng-show="bbPaiMing.examedContext != null" >
                    <table class="table table-hover" style="  display: block;width:100%;height: 95%;overflow-y: hidden;">
                        <thead>
                        <tr>
                            <td style="width: 60px;text-align: center"><label>图片链接</label></td>
                            <td style="width: 80px;text-align: center"><label>标题</label></td>
                            <td style="width: 228px;text-align: center"><label>宝贝坐标</label></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="data in bbPaiMing.examedContext " >
                            <td ng-repeat="(x,y) in data ">
                                <img ng-if="x == 'pic'" ng-src="{{y}}">
                                <span style="font-size: 22px" ng-if="x == 'title'">{{y}}</span>
                                <span style="font-size: 22px;color: green" ng-if="x == 'zoom'">{{y}}</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>



    </div>
    <!--20万热词-->
    <div ng-if="username!=null" role="tabpanel" class="tab-pane " id="reci" >
        <#include "//reci.ftl">
    </div>
    <!--降权-->
    <div role="tabpanel" class="tab-pane" id="jiangquan">
        <div style="width: 100%;height: 100%" class="Container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <dl>
                        <dt style="font-size: 20px">
                            店铺宝贝隐形降权查询
                        </dt>
                        <dd style="font-size: 15px">
                            1.隐形降权是淘宝作弊检测体系自动检测发现宝贝有问题，但是没有明确的证据或者还不是很严重的情况，就是犯罪嫌疑人，对这些宝贝商至店铺采取降权处理。
                        </dd>
                        <dd style="font-size: 15px">
                            2.隐形降权一般和以下因素有关：刷销量：有黑号参与、转化率低、支付宝使用率低。
                        </dd>
                        <dd style="font-size: 15px">
                            <span style="color: red">注意：宝贝隐形降权只提供参考，非淘宝官方数据</span>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="row clearfix" >
                <div class="col-md-12 column form-inline " style="font-size: 20px">
                    <label class="font-14">旺旺ID：</label>
                    <input type="text" class="form-control" style="width: 263px;border-radius:5px " ng-model="jiangquan.searchWordsJq"/>
                </div></br>
                <div class="col-md-12 column form-inline " style="font-size: 20px;top:10px">
                    <label class="font-14">选择类型：</label>
                    <label>
                        <input type="radio" ng-value=0 ng-model="jiangquan.isNormal" name="normal">异常
                    </label>
                    <label>
                        <input type="radio" ng-value=1 ng-model="jiangquan.isNormal" name="normal" >正常
                    </label>
                </div>
            </div>
            <div style="margin-top: 30px" class="button-container text-left">
                <button class="btn btn-success" ng-click="searchJiangQuan()" ng-disabled="jiangquan.working">检测一下</button>
            </div></br>
            <!--结果-->
            <div class="result " id="jqrs" style="width:85%;height:350px;">
                <div style="width: 37%" ng-if="jiangquan.msg == null " ng-show="jiangquan.vm.value!=0&&jiangquan.vm.value!=100">
                    <div ng-class="{progress: true, 'progress-striped': jiangquan.vm.striped}">
                        <div ng-class="['progress-bar', jiangquan.vm.style]" ng-style="{width: jiangquan.vm.value + '%'}">
                            <div ng-if="jiangquan.vm.showLabel">{{jiangquan.vm.value}}%</div>
                        </div>
                    </div>
                </div>
                <div class="noViolation " ng-show="jiangquan.msg != null" style="color: red;font-size: 30px">
                    {{jiangquan.msg}}
                </div>
                <div class="result-context" ng-show="jiangquan.examedContext != null" >
                    <table class="table table-hover" style="  display: block;width:100%;height: 95%;overflow-y: scroll;">
                        <thead>
                            <tr style="width:100%">
                                <td style="width: 30px;text-align: center"><label>评价数量</label></td>
                                <td style="width: 40px;text-align: center"><label>内容</label></td>
                                <td style="width: 80px;text-align: center"><label>权重差值</label></td>
                                <td style="width: 50px;text-align: center"><label>图片</label></td>
                                <#--<td style="width: 50px;text-align: center"><label>价格</label></td>-->
                                <td style="width: 200px;text-align: center"><label>评估结果</label></td>
                                <td style="width: 60px;text-align: center"><label>淘宝链接</label></td>
                            </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="data in jiangquan.examedContext " >
                            <td ng-repeat="(x,y) in data ">
                                <img ng-if="x == 'pic'" ng-src="{{y}}">
                                <span style="font-size: 22px" ng-if="x != 'pic'&& x != 'tbao'">{{y}}</span>
                                <a ng-if="x == 'tbao'"  href="{{y}}"  target="_blank" style="text-decoration:none">{{y}}</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!--信誉-->
    <div role="tabpanel" class="tab-pane" id="xinyu">
        <div style="width: 100%;height: 100%" class="Container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <dl>
                        <dt style="font-size: 20px">
                            淘宝信用查询
                        </dt>
                        <dd style="font-size: 15px">
                            请在输入框内输入淘宝帐号，并点击查询
                        </dd>
                        <dd style="font-size: 15px">
                            1、注册时间小于30天的，被认定为小号/新号，有可能是骗子，应当谨慎交易，免得赚几块钱换来一个中差评。
                        </dd>
                        <dd style="font-size: 15px">
                            2、可以查询买家中差评数量以及中差评信息，如果该用户的比例超过一定的比例，则有可能是中差评师，要十分注意了。
                        </dd>
                        <dd style="font-size: 15px">
                            3、经常刷的小号，当信用点数超过20点(常购物的买家大号除外)，有可能这个号被淘宝列入黑名单，他再拍的东西有可能会被认为虚假交易，再刷会有降权风险。
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="context" >
                <textarea style="width: 467px;height: 71px;border-radius:5px " ng-model="xinYu.searchWordsXy"  placeholder="请输入淘宝账号，然后点击 &quot;检测一下&quot; 按钮" class="ng-pristine ng-valid ng-empty ng-touched"></textarea>
            </div>
            <div style="margin-top: 30px" class="button-container text-left">
                <button class="btn btn-success" ng-click="searchXinyu()" ng-disabled="xinYu.working">检测一下</button>
            </div></br>
            <!--结果-->
            <div class="result " id="xyrs"  style="width:85%;height:270px;">
                <div style="width: 37%" ng-if="xinYu.msg == null " ng-show="xinYu.vm.value!=0&&xinYu.vm.value!=100">
                    <div ng-class="{progress: true, 'progress-striped': xinYu.vm.striped}">
                        <div ng-class="['progress-bar', xinYu.vm.style]" ng-style="{width: xinYu.vm.value + '%'}">
                            <div ng-if="xinYu.vm.showLabel">{{xinYu.vm.value}}%</div>
                        </div>
                    </div>
                </div>
                <div class="noViolation " ng-show="xinYu.hasNoViolation == true" style="color: red;font-size: 30px">
                    该号不存在，请检测是否输入有误!
                </div>
                <div class="result-context" ng-show="xinYu.examedContext != null" >
                    <table class="table table-hover" style="  display: block;width:100%;height: 100%;overflow: hidden;">
                        <tbody>
                        <tr >
                            <td  ng-repeat="d in xinYu.examedContext " ng-bind="d.name">
                            </td>
                        </tr>
                        <tr class="success">
                            <td ng-repeat="d in xinYu.examedContext "  >
                                <label ng-bind="d.value" ></label>
                                <img  ng-if="d.id!=null&&d.id==10" ng-src="{{d.img}}">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--违禁-->
    <div role="tabpanel" class="tab-pane" id="weijin">

        <div style="width: 100%;height: 100%" class="Container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <dl>
                        <dt style="font-size: 20px">
                            淘宝禁用词／广告、文案敏感词／检测查询工具
                        </dt>
                        <dd style="font-size: 15px">
                            已收录约3300个敏感词、禁用词，违禁词的命中率高，词库具有主动学习、动态更新的能力，我们为做最全面的违规词检查工具而努力，以便更好的服务各位卖家！
                        </dd>

                    </dl>
                </div>
            </div>
            <div class="context" >
                <textarea style="width: 763px;height: 149px;border-radius:5px " ng-model="searchWordsWjc"  placeholder="粘贴你的广告、文案到此处，然后点击 &quot;检测一下&quot; 按钮" class="ng-pristine ng-valid ng-empty ng-touched"></textarea>
            </div>
            <div style="margin-top: 30px" class="button-container text-left">
                <button class="btn btn-success" ng-click="searchWjc()" ng-disabled="app.working">检测一下</button>
            </div></br>
            <!--结果-->
            <div class="result "  id="wjcrs" style="width:85%;height:310px;">
                <div style="width: 37%" ng-if="app.msg == null " ng-show="app.vm.value!=0&&app.vm.value!=100">
                    <div ng-class="{progress: true, 'progress-striped': app.vm.striped}">
                        <div ng-class="['progress-bar', app.vm.style]" ng-style="{width: app.vm.value + '%'}">
                            <div ng-if="app.vm.showLabel">{{app.vm.value}}%</div>
                        </div>
                    </div>
                </div>
                <div class="noViolation " ng-show="app.hasNoViolation == true" style="color: green;font-size: 30px">
                    恭喜你，没有发现任何禁用词／敏感词！
                </div>
                <div class="result-context" ng-show="app.hasNoViolation == false" style="width:80%;height:300px;" ng-bind-html="app.examedContext | to_trusted"></div>
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
                <div class="modal-body" style="text-align: center">
                    <label style="font-size: 25px ;color: red;text-align: center">请登陆后进行查询！</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" ng-click="signLogin()">注册/登陆</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="freeSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" style="color: red;font-size: 25px">提醒</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <label style="font-size: 20px ;text-align: center">因服务器处理能力有限，无线端临时限制查询10页</label>
                    <label style="font-size: 20px ;text-align: center">登陆后才可查询100页</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" ng-click="signLogin()">注册/登陆</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="freeSearchPaim()">查询10页</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--尾部-结束-->


</body>

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/searchController.js"></script>
<script type="text/javascript">
    user = '${user!}';

</script>
</html>