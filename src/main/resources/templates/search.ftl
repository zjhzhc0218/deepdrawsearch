<!DOCTYPE>
<html ng-app="search">
<head>
    <title>首页</title>
    <!-- 设置文档编码 -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <!--  -->
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="/deepsearch/css/loading/jquery.mloading.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
    <link rel="stylesheet" href="/deepsearch/css/reset.css" />
    <link rel="stylesheet" href="/deepsearch/css/index.css" />
    <link href="/deepsearch/css/bootstrap/bootstrap-theme.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/deepsearch/css/font/font-awesome.css">


</head>
<style type="text/css">
    a:hover, a:focus {
        text-decoration: none;
    }
    .error{
        color:red;
    }
    .result-context span {
        font-size: 30px;
    }
    .nav>li>a:hover, .nav>li>a:focus {
        background-color: #3277F8;
    }
    .nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
        background-color: #3277F8;
        border-color: #428bca;
    }


</style>
<body ng-controller="searchController" style="">
<header>
    <div class="header-content">
        <div class="header-top">
            <a class="logo" href="javascript:;">
                <img src="img/logo.png"/>
                <p>电商在线查询工具</p>
            </a>

            <ul class="nav pull-right">
                <li id="fat-menu" class="dropdown">
                    <a style="color:white " href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i style="color: white" class="icon-user"></i>
                        <span ng-if="username!=null" ng-bind="username.id"></span>
                        <span  ng-if="username==null" ng-click="signLogin()">登陆/注册</span>
                        <i style="color: white" class="icon-caret-down"></i>
                    </a>

                    <ul  ng-if="username!=null" class="dropdown-menu">
                        <li><a tabindex="-1" href="#" ng-if="username!=null && username.grade==1" ng-click="toAdminPage()">后台管理</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="#" ng-click="signLogin()">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="nav-list">
            <div class="one active">
                <a  class="" role="tab" data-toggle="tab"href="#paimin">淘宝排名</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#reci" ng-click="searchLogin()">热词下载</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#jiangquan">降权查询</a>
            </div>
            <div class="one ">
                <a  role="tab" data-toggle="tab" href="#xinyu">信誉查询</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#weijin">违禁词</a>
            </div>
        </div>
    </div>
</header>

<div class="tab-content container">
    <div role="tabpanel" class="tab-pane active"class="content" id="paimin" >
        <div class="search-view">
            <table>
                <tr>
                    <td><label>关键字：</label></td>
                    <td>
                       <input type="text"  class="form-control" style="width: 263px;border-radius:5px;height: 40px;" ng-model="bbPaiMing.keyWords"  />
                    </td>
                </tr>
                <tr style="">
                    <td><label style="margin-top: 12px">宝贝ID或者宝贝链接：</label></td>
                    <td>
                        <input type="text"   class="form-control" style="width: 263px;border-radius:5px;height: 40px;margin-top: 12px "ng-model="bbPaiMing.tbaoId"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="btn  search-btn" href="javascript:;" ng-click="searchPaiming()" ng-disabled="bbPaiMing.working">查询</button>
                    </td>
                </tr>
            </table>

        </div>

        <div class="search-desc" style="margin-top: -28px;">
            <p class="title"> 宝贝排名查询</p>
            <p class="txt" style="color: red">注意：宝贝排名只提供参考，非淘宝官方数据</p>
        </div>

        <div class="search-info" id="pmrs" >
            <div style="width: 100%" ng-if="bbPaiMing.msg == null " ng-show="bbPaiMing.vm.value!=0&&bbPaiMing.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': bbPaiMing.vm.striped}">
                    <div ng-class="['progress-bar', bbPaiMing.vm.style]" ng-style="{width: bbPaiMing.vm.value + '%'}">
                        <div ng-if="bbPaiMing.vm.showLabel">{{bbPaiMing.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-if="bbPaiMing.msg != null" style="color: red;font-size: 30px" ng-bind="bbPaiMing.msg">
            </div>
            <div class="result-context" ng-if="bbPaiMing.examedContext != null" >
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

    <div ng-if="username!=null"role="tabpanel" class="tab-pane" class="content" id="reci">
        <#include "//reci.ftl">
    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="jiangquan">
        <div class="search-view">
            <table>
                <tr>
                    <td><label>旺旺ID：</label></td>
                    <td>
                        <input type="text"  class="form-control" style="width: 263px;border-radius:5px;height: 40px;"ng-model="jiangquan.searchWordsJq"  />
                    </td>
                </tr>
                <tr style="">
                    <td ><label style="margin-top: 14px;">选择类型：</label></td>
                    <td>
                            <label >异常<input type="radio"  style="width: 25px; height: 16px;" ng-value=0 ng-model="jiangquan.isNormal" name="normal"></label>
                            <label >正常<input type="radio"  style="width: 25px; height: 16px;" ng-value=1 ng-model="jiangquan.isNormal" name="normal"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="btn  search-btn" href="javascript:;" ng-click="searchJiangQuan()" ng-disabled="jiangquan.working">查询</button>
                    </td>
                </tr>
            </table>
        </div>

        <div class="search-desc" style="margin-top: -28px;">
            <p class="title"> 店铺宝贝隐形降权查询</p>
            <p> 1.隐形降权是淘宝作弊检测体系自动检测发现宝贝有问题，但是没有明确的证据或者还不是很严重的情况，就是犯罪嫌疑人，对这些宝贝商至店铺采取降权处理。</p>
            <p> 2.隐形降权一般和以下因素有关：刷销量：有黑号参与、转化率低、支付宝使用率低。</p>
            <p><font>注意：宝贝隐形降权只提供参考，非淘宝官方数据</font></p>
        </div>

        <div class="search-info" id="jqrs" >
            <div style="width: 100%" ng-if="jiangquan.msg == null " ng-show="jiangquan.vm.value!=0&&jiangquan.vm.value!=100">
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



    <div role="tabpanel" class="tab-pane"  class="content" id="xinyu">
        <div class="search-view">
            <input type="text"   ng-model="xinYu.searchWordsXy"  placeholder="请输入淘宝账号，然后点击 &quot;检测一下&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchXinyu()" ng-disabled="xinYu.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -28px;">
            <p class="title">淘宝信用查询</p>
            <p class="txt">请在输入框内输入淘宝账号，并点击查询</p>
            <p>1、<font>注册时间小于30天的</font>，被认定为小号/新号，有可能是骗子，应当谨慎交易，免得赚几块钱换来一个中差评。</p>
            <p>2、可以查询买家中差评数量以及中差评信息，<font>如果该用户的比例超过一定的比例</font>，则有可能是中差评师，要十分注意了。</p>
            <p>3、经常刷的小号，<font>当信用点数超过20点</font>（常购物的买家大号除外），有可能这个号被淘宝列入黑名单，他在拍的东西有可能会被认为是虚假交易，在刷会有降权风险。</p>
        </div>

        <div class="search-info" id="xyrs" >
            <div style="width: 90%" ng-if="xinYu.msg == null " ng-show="xinYu.vm.value!=0&&xinYu.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': xinYu.vm.striped}">
                    <div ng-class="['progress-bar', xinYu.vm.style]" ng-style="{width: xinYu.vm.value + '%'}">
                        <div ng-if="xinYu.vm.showLabel">{{xinYu.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="xinYu.hasNoViolation == true" style="color: red;font-size: 30px">
                该号不存在，请检测是否输入有误!
            </div>
            <a href="javascript:;"  ng-show="xinYu.examedContext != null"  class="info-item"  ng-repeat="d in xinYu.examedContext " >
                <div class="item-left">
                    <span>{{d.name}}</span>
                    <p> <label ng-bind="d.value" ></label>
                        <img  ng-if="d.id!=null&&d.id==10" ng-src="{{d.img}}"></p>
                </div>
               <#-- <div class="item-right">
                    <span>中评个数 ：</span>
                    <p>0</p>
                </div>-->
            </a>
        </div>
    </div>

    <div role="tabpanel" class="tab-pane"class="content" id="weijin" style="">
        <div class="search-view">
            <#--<input type="text"  ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 查询"/>-->
                <textarea  ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 查询"></textarea>

            <button class="btn  search-btnN"  href="javascript:;" ng-click="searchWjc()" ng-disabled="app.working" >查询</button>
        </div>

        <div class="search-desc" style="margin-top: -28px;">
            <p class="title"> 淘宝禁用词／广告、文案敏感词／检测查询工具</p>
            <p> 已收录约3300个敏感词、禁用词，违禁词的命中率高，词库具有主动学习、动态更新的能力，我们为做最全面的违规词检查工具而努力，以便更好的服务各位卖家！</p>
        </div>

        <div class="search-info" id="wjcrs" >
            <div style="width: 100%" ng-if="app.msg == null " ng-show="app.vm.value!=0&&app.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': app.vm.striped}">
                    <div ng-class="['progress-bar', app.vm.style]" ng-style="{width: app.vm.value + '%'}">
                        <div ng-if="app.vm.showLabel">{{app.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="app.hasNoViolation == true" style="color: green;font-size: 30px">
                恭喜你，没有发现任何禁用词／敏感词！
            </div>
            <div class="result-context" ng-show="app.hasNoViolation == false" style="width:80%;" ng-bind-html="app.examedContext | to_trusted"></div>
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

<footer style="">
    <p>版权所有power by DeepDraw</p>
</footer>


</body>

<script src="/deepsearch/js/jquery-2.1.4.min.js"></script>
<script src="/deepsearch/js/angular/angular.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/searchController.js"></script>

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