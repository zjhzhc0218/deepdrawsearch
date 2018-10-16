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
                <a  class="" role="tab" data-toggle="tab"href="#paimin">宝贝排名查询</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#jiangquan">隐形降权查询</a>
            </div>
            <div class="one ">
                <a  role="tab" data-toggle="tab" href="#xinyu">买家信誉查询</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#weijin">违禁词查询</a>
            </div>
            <div class="one">
                <a  role="tab" data-toggle="tab" href="#reci" >20W热词下载</a>
            </div>
        </div>
    </div>
</header>

<div class="tab-content container">
    <div role="tabpanel" class="tab-pane active"class="content" id="paimin" >
        <div class="search-view" style="margin-top: 30px;margin-right: 264px;">
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
                        <button style="margin-top: -41px;margin-left: 441px;position: absolute; line-height: 41px;" class="btn  search-btn" href="javascript:;" ng-click="searchPaiming()" ng-disabled="bbPaiMing.working">查询</button>
                    </td>
                </tr>
            </table>

        </div>

        <div class="search-desc" style="margin-top: -28px;">
           <p class="title" style=""> 宝贝排名查询</p>
            <#--<p class="txt" style="color: red">注意：宝贝排名只提供参考，非淘宝官方数据</p>-->
            <p>   &nbsp;</p>
           <div >
               <h4>为什么要用宝贝排名查询功能？</h4>
               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #FE8034">宝贝的排名</span>决定了宝贝的展现量，也就影响了宝贝的流量及成交量，所以运营在做推广的时候非常关注 宝贝的排名变化。但是由于淘宝的千人千面导致我们在本地电脑上看不到宝贝的<span style="color: #FE8034">客观排名</span>，其次本地查 询需要手工去一页一页查询，非常耗时。</p>
           </div>
            <p>   &nbsp;</p>
           <div>
               <h4>为什么要用白马查的宝贝排名查询？</h4>
               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;白马查采用目前最先进的<span style="color: #FE8034">分布式云服务器查询模式</span>，模拟了无痕用户的搜索结果，采用<span style="color: #FE8034">大数据技术</span>客观展现宝贝在全网的排名情况，让您更了解自己宝贝的<span style="color: #FE8034">真实排名</span>。</p>
           </div>

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

    <div role="tabpanel" class="tab-pane" class="content" id="reci">
        <#include "//reci.ftl">
    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="jiangquan">
        <div class="search-view" style="margin-top: 30px;margin-right: 311px;">
            <table>
                <tr>
                    <td><label>店铺旺旺ID：</label></td>
                    <td>
                        <input type="text"  class="form-control" style="width: 263px;border-radius:5px;height: 40px;"ng-model="jiangquan.searchWordsJq"  />
                    </td>
                </tr>
                <tr style="">
                    <td ><label style="margin-top: 14px;">选择类型：</label></td>
                    <td>
                            <label style="margin-top: 10px;" >异常<input type="radio"  style="width: 25px; height: 16px;" ng-value=0 ng-model="jiangquan.isNormal" name="normal"></label>
                            <label >正常<input type="radio"  style="width: 25px; height: 16px;" ng-value=1 ng-model="jiangquan.isNormal" name="normal"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button style="margin-top: -41px;margin-left: 358px;position: absolute; line-height: 41px;" class="btn  search-btn" href="javascript:;" ng-click="searchJiangQuan()" ng-disabled="jiangquan.working">查询</button>
                    </td>
                </tr>
            </table>
        </div>

        <div class="search-desc" style="margin-top: -28px;">
            <p class="title"> 店铺宝贝隐形降权查询</p>
            <#--<p> 1.隐形降权是淘宝作弊检测体系自动检测发现宝贝有问题，但是没有明确的证据或者还不是很严重的情况，就是犯罪嫌疑人，对这些宝贝商至店铺采取降权处理。</p>
            <p> 2.隐形降权一般和以下因素有关：刷销量：有黑号参与、转化率低、支付宝使用率低。</p>
            <p><font>注意：宝贝隐形降权只提供参考，非淘宝官方数据</font></p>-->
            <div style="line-height: 1.6rem">
                <h4>什么是隐形降权？<a href="#" ng-click="jqWords('div_p1')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_p1" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #FE8034">隐形降权</span>是淘宝作弊检测体系自动检测发现宝贝有问题，但是没有明确的证据或者还不是很严重的情况 下，对这些宝贝或者店铺采取<span style="color: #FE8034">降权处理</span>。</p>
            </div>

            <div style="line-height: 1.6rem">
                <h4>隐形降权跟哪些因素有关？<a href="#" ng-click="jqWords('div_p2')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. <span style="color: #FE8034">频繁修改</span>宝贝的标题、描述、属性；滥用、堆砌关键词，频繁的修改宝贝价格。</p>
                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. <span style="color: #FE8034">虚假交易，炒作信用</span>，有淘宝监控的账号(黑号)购买了这个宝贝，被淘宝判断有刷销量嫌疑。</p>
                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. <span style="color: #FE8034">宝贝转化率，支付宝使用率</span>出现异常。</p>
                <p class="div_p2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. <span style="color: #FE8034">类目错放，标题、图片、描述</span>等不一致。</p>
            </div>

            <div style="line-height: 1.6rem">
                <h4>如何看懂权重差值？<a href="#" ng-click="jqWords('div_p3')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.淘宝权重差值是根据一个宝贝的<span style="color: #FE8034">销量权重</span>和<span style="color: #FE8034">人气权重</span>比较得出来的一个数值(非淘宝官方数据，不需要处理）。</p>
                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.<span style="color: #FE8034">淘宝权重差值是0的时候</span>，说明此商品权重正常，排名正常，是一个很正常的商品。</p>
                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.<span style="color: #FE8034">淘宝权重差值是正数（>0)的时候</span>，说明此商品根据淘宝搜索排名比较前，比正常搜索排名要靠前。</p>
                <p class="div_p3" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.<span style="color: #FE8034">淘宝权重差值是负数（<0）的时候</span>，说明此商品可能已经被查降权了，权重差值负数越大，排名就越 靠后。</p>
            </div>

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
                <table class="table table-hover" style="  display: block;width:100%;height: 95%;">
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
                    <tr ng-repeat="data in jiangquan.examedContext" >
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
        <div class="search-view" style="margin-top: 30px" style="margin-top: 30px" style="margin-top: 30px">
            <input type="text"   ng-model="xinYu.searchWordsXy"  placeholder="请输入买家淘宝账号，然后点击 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchXinyu()" ng-disabled="xinYu.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -28px;">
            <p class="title">买家信用查询</p>
            <p>1、<font>注册时间小于30天的</font>，被认定为小号/新号，有可能是骗子，应当谨慎交易。</p>
            <p>2、<font>买家中差评数量以及中差评信息超过一定的比例</font>，则有可能是职业中差评师。</p>
            <p>3、经常刷的小号，<font>当周购物单量超过一定量（6-10单）</font>，则有可能是黑号。</p>
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
        <div class="search-view" style="margin-top: 30px">
            <#--<input type="text"  ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 查询"/>-->
                <textarea  ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 &quot;查询&quot; 按钮"></textarea>

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