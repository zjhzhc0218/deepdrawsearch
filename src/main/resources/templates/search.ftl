<!DOCTYPE>
<html ng-app="search" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <title>白马查--电商在线查询工具</title>
    <link rel="shortcut icon" href="/codeimg/baima.ico" type="image/x-icon"/>
    <!-- 设置文档编码 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <#--<meta name="viewport" content="width=width,user-scalable=no">-->
    <meta name="viewport" content="user-scalable=no">
    <meta name="viewport" content="user-scalable=yes">
    <!--  -->
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
        font-size: 22px;
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
    .search-info p {
        margin-top: 10px;
    }

    body {
        padding-bottom: 54px;
    }

</style>
<body ng-controller="searchController" style="">
<header>
    <div class="header-content">
        <div class="header-top">
            <a class="logo" href="http://www.baimacha.com" >
                <img style="margin-left: 100px" src="/codeimg/logo.png"/>
                <p>电商在线查询工具</p>
            </a>

            <ul class="nav pull-right" style="margin-right: 20px">
                <li id="fat-menu" class="dropdown">
                    <a style="color:white;margin-right: 100px " href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i style="color: white" class="icon-user"></i>
                        <span ng-if="username!=null" ng-bind="username.id"></span>
                        <span  ng-if="username==null" ng-click="signLogin()">登陆/注册</span>
                        <i style="color: white" class="icon-caret-down"></i>
                    </a>

                    <ul  ng-if="username!=null" class="dropdown-menu">
                        <li><a tabindex="-1" href="#" ng-if="username!=null && username.grade==1" ng-click="toAdminPage()">后台管理</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="#" ng-click="signLogin()">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="nav-list container">
            <div class="row" style="text-align: center">
                <#--<div class="col-md-12">-->
                    <div class="one active">
                        <a  class="" role="tab" data-toggle="tab" href="#guanjia" style="font-size: 14px;">白马单品管家</a>
                    </div>

                    <div class="one">
                        <a  class="" role="tab" data-toggle="tab" href="#paimin" style="font-size: 14px;">宝贝无线排名</a>
                    </div>
                    <div class="one">
                        <a  role="tab" data-toggle="tab" href="#jiangquan">隐形降权查询</a>
                    </div>
                    <div class="one">
                        <a  role="tab" data-toggle="tab" href="#xialakuang">下拉框选词</a>
                    </div>
                    <div class="one">
                        <a  role="tab" data-toggle="tab" href="#zhishu">指数还原</a>
                    </div>
                    <div class="one">
                        <a  role="tab" data-toggle="tab" href="#zhanxian">展现查询</a>
                    </div>
                    <div class="one ">
                        <a  role="tab" data-toggle="tab" href="#xinyu">买家信誉查询</a>
                    </div>

                    <div class="one ">
                        <img class="header_hotIcon" src="/deepsearch/img/hot.gif">
                        <a href="http://www.daoliuliang365.com" target="_blank" style="color: #fff;font-size: 14px">导    流    量</a>
                    </div>
                <#--<div class="one">-->
                <#--<a  role="tab" data-toggle="tab" href="#weijin">违禁词查询</a>-->
                <#--</div>-->
                <#--<div class="one">-->
                <#--<a  role="tab" data-toggle="tab" href="#mulu">目录查询</a>-->
                <#--</div>-->
                <#--<div class="one">-->
                <#--<a  role="tab" data-toggle="tab" href="#dongtaipingfeng">动态评分查询</a>-->
                <#--</div>-->
                <#--<div class="one">-->
                <#--<a  role="tab" data-toggle="tab" href="#reci" >20W热词下载</a>-->
                <#--</div>-->
                <div class="one header_more">
                    <a  role="tab" data-toggle="tab" href="#">更多功能</a>
                    <ul>
                        <li><a role="tab" data-toggle="tab" href="#dongtaipingfeng">动态评分查询</a></li>
                        <li><a role="tab" data-toggle="tab" href="#shangxiajia">上下架查询</a></li>
                        <li><a role="tab" data-toggle="tab" href="#mulu">目录查询</a></li>
                        <li><a role="tab" data-toggle="tab" href="#weijin">违禁词查询</a></li>
                        <li><a role="tab" data-toggle="tab" href="#reci">20W热词下载</a></li>
                        <#--<li><a role="tab" data-toggle="tab" href="#">历史价格查询</a></li>-->
                    </ul>
                </div>
            </div>
        </div>
        <#--  <div class="one">
              <a  role="tab" data-toggle="tab" href="#目录">上下架查询</a>
          </div>-->


        </div>
    </div>
</header>

<div class="float_weixin" style="position: fixed;z-index:9999999;width: 200px;height: 200px;top: 23%;right: -1%;">
    <h4 style="margin-top: 0">客服微信号：</h4>
    <img src="/codeimg/codeImg.jpg" style="width: 120px">
</div>

<div class="tab-content container">
    <div role="tabpanel" class="tab-pane active" class="content" id="guanjia">
        <#include "//guanjia.ftl">
    </div>

    <div role="tabpanel" class="tab-pane "class="content" id="paimin" >
        <div class="search-view" style="margin-top: 30px;margin-right: 264px;">
            <table>
                <tr>
                    <td><label>关&nbsp;&nbsp;&nbsp;&nbsp;键&nbsp;&nbsp;&nbsp;&nbsp;词：</label></td>
                    <td>
                       <input type="text"  class="form-control" style="width: 263px;border-radius:5px;height: 40px;" ng-model="bbPaiMing.keyWords"  />
                    </td>
                </tr>
                <tr style="">
                    <td><label style="margin-top: 12px">宝贝ID(链接)：</label></td>
                    <td>
                        <input type="text"   class="form-control" style="width: 263px;border-radius:5px;height: 40px;margin-top: 12px " ng-model="bbPaiMing.tbaoId"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <button style="margin-top: -41px;margin-left: 441px;position: absolute; line-height: 41px;" class="btn  search-btn" href="javascript:;" ng-click="searchPaiming()" ng-disabled="bbPaiMing.working">查询</button>
                    </td>
                </tr>
            </table>

        </div>

        <div class="search-desc" style="margin-top: -38px;margin-left: 249px">
            <p class="title" style=""> 宝贝排名查询</p>
            <div>
                <h4>为什么要用宝贝排名查询功能？<a href="#" style="color: #30F" ng-click="jqWords('div_pp1')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_pp1" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #FE8034">宝贝的排名</span>决定了宝贝的展现量，也就影响了宝贝的流量及成交量，所以运营在做推广的时候非常关注 宝贝的排名变化。但是由于淘宝的千人千面导致我们在本地电脑上看不到宝贝的<span style="color: #FE8034">客观排名</span>，其次本地查 询需要手工去一页一页查询，非常耗时。</p>
            </div>
            <div>
                <h4>为什么要用白马查的宝贝排名查询？<a href="#" style="color: #30F" ng-click="jqWords('div_pp2')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_pp2" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;白马查采用目前最先进的<span style="color: #FE8034">分布式云服务器查询模式</span>，模拟了无痕用户的搜索结果，采用<span style="color: #FE8034">大数据技术</span>客观展现宝贝在全网的排名情况，让您更了解自己宝贝的<span style="color: #FE8034">真实排名</span>。</p>
            </div>
        </div>

        <div class="search-info" id="pmrs" >
            <div style="width: 100%" ng-if="bbPaiMing.msg == null " ng-show="bbPaiMing.vm.value!=0&&bbPaiMing.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': bbPaiMing.vm.striped}">
                    <div ng-class="['progress-bar', bbPaiMing.vm.style]" ng-style="{width: bbPaiMing.vm.value + '%'}">
                        <div ng-if="bbPaiMing.vm.showLabel" ng-bind="bbPaiMing.vm.value+'%'"></div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-if="bbPaiMing.msg != null" style="color: red;font-size: 30px" ng-bind="bbPaiMing.msg">
            </div>
            <div class="result-context" ng-if="bbPaiMing.examedContext != null" >
                <table class="table table-hover" ng-show="bbPaiMing.examedContext != null" style="  display: block;width:100%;height: 95%;overflow-y: hidden;">
                    <thead>
                    <tr ng-cloak>
                        <td style="width: 60px;text-align: center"><label ng-bind="'图片链接'"></label></td>
                        <td style="width: 80px;text-align: center"><label ng-bind="'标题'"></label></td>
                        <td style="width: 228px;text-align: center"><label ng-bind="'宝贝坐标'"></label></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="data in bbPaiMing.examedContext " >
                        <td ng-repeat="(x,y) in data ">
                            <img ng-if="x == 'pic'" ng-src="{{y}}">
                            <span style="font-size: 22px" ng-if="x == 'title'" ng-bind="y"></span>
                            <span style="font-size: 22px;color: green" ng-if="x == 'zoom'"  ng-bind="y"></span>
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
        <div class="search-view" style="margin-top: 30px">
            <input type="text"   ng-model="jiangquan.searchWordsJq"  placeholder="请输入店铺旺旺ID，然后点击 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchJiangQuan()" ng-disabled="jiangquan.working">查询</button>
        </div>
        <div class="search-desc" style="margin-left: 249px;margin-top: -38;">
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
            <div class="result-context" ng-show="jiangquan.examedContext != null&&jiangquan.examedContext.length>0" >
                <table class="table table-hover" style="  display: block;width:100%;margin-bottom: 0;">
                    <thead>
                    <tr style="width:100%">
                        <td style="width: 30px;text-align: center"><label>图片</label></td>
                        <td style="width: 120px;text-align: center"><label>标题</label></td>
                        <td style="width: 90px;text-align: center"><label>销量</label></td>
                        <td style="width: 90px;text-align: center"><label>价格</label></td>
                    <#--<td style="width: 50px;text-align: center"><label>价格</label></td>-->
                        <td style="width: 90px;text-align: center"><label>库存</label></td>
                        <td style="width: 90px;text-align: center"><label>权重值</label></td>
                        <td style="width: 120px;text-align: center"><label>说明</label></td>

                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="data in jiangquan.examedContext " >
                        <td ng-repeat="node in data | orderBy:'id'"  style="text-align: center">
                            <a href="{{node.href}}" target="_blank" style="text-decoration:none" ><img style="width: 100px;height: 100px;margin-top: 10px" ng-if="node.name=='img'" ng-src="{{node.value}}"></a>
                            <span style="font-size: 18px;line-height: 120px" ng-if="node.name!='img'&&node.name!='title'">{{node.value}}</span>
                            <a ng-if="node.name ==  'title'"  href="{{node.href}}"  target="_blank" style="text-decoration:none;line-height: 120px">{{node.value}}</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="xinyu">
        <div class="search-view" style="margin-top: 30px">
            <input type="text"   ng-model="xinYu.searchWordsXy"  placeholder="请输入买家淘宝账号，然后点击 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchXinyu()" ng-disabled="xinYu.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -38;margin-left: 249px;">
            <p class="title">买家信用查询</p>
            <p>1、<font>注册时间小于30天的</font>，被认定为小号/新号，有可能是骗子，应当谨慎交易。</p>
            <p>2、<font>买家中差评数量以及中差评信息超过一定的比例</font>，则有可能是职业中差评师。</p>
            <p>3、经常刷的小号，<font>当周购物单量超过一定量（6-10单）</font>，则有可能是黑号。</p>
        </div>

        <div class="search-info" id="xyrs" style="width: 75%;margin-left: 200px">
                <div style="width: 90%" ng-if="xinYu.msg == null " ng-show="xinYu.vm.value!=0&&xinYu.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': xinYu.vm.striped}">
                    <div ng-class="['progress-bar', xinYu.vm.style]" ng-style="{width: xinYu.vm.value + '%'}">
                        <div ng-if="xinYu.vm.showLabel">{{xinYu.vm.value}}%</div>
                    </div>
                </div>
            </div>
        <#--    <div class="noViolation " ng-show="xinYu.hasNoViolation == true" style="color: red;font-size: 30px">
                该号不存在，请检测是否输入有误!
            </div>-->
            <div class="noViolation " ng-show="xinYu.msg != null" style="color: red;font-size: 30px">
                {{xinYu.msg}}
            </div>
        <#-- <a href="javascript:;"  ng-show="xinYu.examedContext != null"  class="info-item"  ng-repeat="d in xinYu.examedContext" >
             <div class="item-left" ng-if="d.id!=2&&d.id!=3">
                 <span>{{d.name}}</span>
                 <p> <label ng-if="d.id!=null&&d.id!=15" ng-bind="d.value" style="margin-bottom: -4px;" >
                 </label>
                     <img ng-if="d.id!=null&&d.id==1" href="{{d.addr}}" ng-data-original="{{d.pic}}" />
                     <img  ng-if="d.id!=null&&d.id==15" ng-data-original="{{d.value}}"/>
                 </p>
             </div>
            </a>-->
           <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item active">

               <div class="item-left" style="background-color: #f4f7e4;top: 7px;">
                   淘宝买家：
                   <div  style="width:auto;color: #FE7738;position: relative">
                       <a ng-href="{{xinYu.examedContext[0].addr}}" target="_blank" style="font-size: 16px;color: red;float: left">
                           {{xinYu.examedContext[0].value}}&nbsp;&nbsp;
                       </a>
                       <a ng-href="{{xinYu.examedContext[0].addr}}" target="_blank" style="font-size: 16px;color: red;float: left">
                           <img ng-src="{{xinYu.examedContext[0].pic}}" >
                       </a>
                       <b style="float: left;margin-top: 3px">&nbsp;&nbsp;{{xinYu.examedContext[1].value}}</b>
                   </div>
               </div>

               <div class="item-right" style="background-color: #f4f7e4">
                   实名认证：
                   <p style="color: red">{{xinYu.examedContext[2].value}}</p>
               </div>
           </div>

            <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                <div class="item-left">
                    注册时间：
                    <p style="color: green">{{xinYu.examedContext[3].value}}</p>
                </div>
                <div class="item-right">
                    最后登录：
                    <p style="color: green">{{xinYu.examedContext[4].value}}</p>
                </div>
            </div>

            <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                <div class="item-left">
                    店铺信息：
                    <p>{{xinYu.examedContext[5].value}}</p>
                </div>
                <div class="item-right">
                    所在地区：
                    <p style="color: green">{{xinYu.examedContext[6].value}}</p>
                </div>
            </div>

            <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                <div class="item-left">
                    买家信用：<b style="color: green">{{xinYu.examedContext[7].value}}</b>&nbsp;
                    每周平均：<b style="color: green">&nbsp;{{xinYu.examedContext[8].value}}</b>&nbsp;
                    <img id="dd" ng-src="{{xinYu.examedContext[9].value}}">
                    &nbsp;<b style="color: red">{{xinYu.examedContext[10].value}}</b>
                </div>
                <div class="item-right">
                    卖家信用：<b style="color: green">{{xinYu.examedContext[11].value}}</b>
                    &nbsp;<img ng-src="{{xinYu.examedContext[12].value}}">
                    <b style="color: red">&nbsp;{{xinYu.examedContext[13].value}}</b>
                </div>
            </div>

            <div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                <div class="item-left">
                    男号女号：<b style="color: green">{{xinYu.examedContext[14].value}}</b>
                    &nbsp;&nbsp;账号热度：<b style="color: #FE7738">{{xinYu.examedContext[15].value}}</b>
                </div>
                <div class="item-right">
                    活  跃  度：<p style="color: green">{{xinYu.examedContext[16].value}}</p>
                </div>
            </div>

            <#--<div href="javascript:;" ng-show="xinYu.examedContext != null" class="info-item">
                <div class="item-left">
                    &nbsp;查询  ip:
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;{{xinYu.examedContext[17].value}}</p>
                </div>
                <div class="item-right">
                    查询时间：
                    <p>&nbsp;&nbsp;{{xinYu.examedContext[18].value}}</p>
                </div>
            </div>-->

        </div>
    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="weijin" style="">
        <div class="search-view" style="margin-top: 30px">
            <#--<input type="text"  ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 查询"/>-->
                <textarea  ng-show="app.hideDetail == false" ng-model="searchWordsWjc" placeholder="粘贴你的广告、文案到此处，然后点击 &quot;查询&quot; 按钮">
                </textarea>

               <#-- <div class="noViolation " ng-show="app.hasNoViolation == true&&app.hideDetail == true" style="width:45%;color: green;font-size: 30px;position: absolute">
                    恭喜你，没有发现任何禁用词／敏感词！
                </div>-->
                <#--<div class="result-context" ng-show="app.hasNoViolation == false&&app.hideDetail == true" style="width:45%;position: absolute" ng-bind-html="app.examedContext | to_trusted"></div>-->
                <div class="wordShowC"  ng-show="app.hideDetail == true" ng-bind-html="app.examedContext | to_trusted">
                </div>
            <button class="btn search-btnN" ng-show="app.hideDetail == false" href="javascript:;" ng-click="searchWjc()" ng-disabled="app.working" >查询</button>
            <button class="btn search-btnB" ng-show="app.hideDetail == true"  href="javascript:;" ng-click="hideDetail()"  >继续检测</button>
        </div>

        <div class="search-desc" style="margin-left: 200px;padding-top: 0;margin-top: -38px">
            <p class="title"> 淘宝违禁词/敏感词/新广告法违禁词检测工具</p>
            <p> 已收录各类违禁词、敏感词超过20000个，且词库还在不断更新中。</p>
        </div>

        <div class="search-info" id="wjcrs" >
            <div style="width: 100%" ng-if="app.msg == null " ng-show="app.vm.value!=0&&app.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': app.vm.striped}">
                    <div ng-class="['progress-bar', app.vm.style]" ng-style="{width: app.vm.value + '%'}">
                        <div ng-if="app.vm.showLabel">{{app.vm.value}}%</div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="dongtaipingfeng">
        <div class="search-view" style="margin-top: 30px">
            <input type="text"   ng-model="dtPingFeng.searchWordsXy"  placeholder="请输入旺旺账号，然后点击 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchPingfeng()" ng-disabled="dtPingFeng.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -38;margin-left: 249px;">
        <p class="title">如何提高店铺动态评分(DSR)？</p>
        <p>1、提高对顾客的服务态度，发货速度，完善商品的描叙。让顾客舒心购物!</p>
        <p>2、<font>顾客收到宝贝后，主动联系顾客是否满意</font>。从而提醒顾客好评并打5分!</p>
        <p>3、邀请你的朋友关照下你，从而获得5分好评!</p>
        <p>4、<font>加入一些互刷平台，或是互刷团队来提高动态评分!</font>安全，方便，快捷。</p>
    </div>

        <div class="search-info" id="dtPingFengRs" style="width: 75%;margin-left: 200px">
            <div style="width: 90%" ng-if="dtPingFeng.msg == null " ng-show="dtPingFeng.vm.value!=0&&dtPingFeng.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': dtPingFeng.vm.striped}">
                    <div ng-class="['progress-bar', dtPingFeng.vm.style]" ng-style="{width: dtPingFeng.vm.value + '%'}">
                        <div ng-if="dtPingFeng.vm.showLabel">{{dtPingFeng.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="dtPingFeng.msg != null" style="color: red;font-size: 30px">
                {{dtPingFeng.msg}}
            </div>
            <div href="javascript:;" ng-show="dtPingFeng.examedContext != null" class="info-item">
                <ul class="dsr-info" id="dsr" style="">
                    <li class="J_RateInfoTrigger dsr-item selected">
                        <div class="item-scrib">
                            <span class="title" style="">宝贝与描述相符：</span>
                            <em class="count" id="item_score" ng-bind="dtPingFeng.examedContext[0].value"></em>分
                            <em title="计算规则:(店铺得分-同行业平均分)/(同行业店铺最高得分-同行业平均分)"><strong class="percent over" id="">比同行业平均水平高 <b style="color:#f60" ng-bind="dtPingFeng.examedContext[1].value"></b></strong></em>
                        </div>
                        <div style="position:relative;left:100px;" class="avg" ng-show="dtPingFeng.examedContext[2].value!= ''"> 行业平均得分约：<b style="color:#f60" ng-bind="dtPingFeng.examedContext[2].value"></b>，抵挡<b style="color:#f60" ng-bind="dtPingFeng.examedContext[3].value"></b>单<b style="color:#f60" ng-bind="dtPingFeng.examedContext[4].value"></b>分后飘绿</div>

                    </li>
                    <li class="J_RateInfoTrigger dsr-item selected">
                        <div class="item-scrib">
                            <span class="title">卖家的服务态度：</span>
                            <em class="count" id="service_score"  ng-bind="dtPingFeng.examedContext[5].value"></em>分
                            <em title="计算规则:(店铺得分-同行业平均分)/(同行业店铺最高得分-同行业平均分)"><strong class="percent over" id="">比同行业平均水平高 <b style="color:#f60"  ng-bind="dtPingFeng.examedContext[6].value"></b></strong></em>
                        </div>
                        <div style="position:relative;left:100px;" class="avg" ng-show="dtPingFeng.examedContext[7].value!= ''"> 行业平均得分约：<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[7].value"></b>，抵挡<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[8].value"></b>单<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[9].value"></b>分后飘绿</div>
                    </li>
                    <li class="J_RateInfoTrigger dsr-item selected">
                        <div class="item-scrib">
                            <span class="title">卖家发货的速度：</span>
                            <em class="count" id="delivery_score"  ng-bind="dtPingFeng.examedContext[10].value"></em>分
                            <em title="计算规则:(店铺得分-同行业平均分)/(同行业店铺最高得分-同行业平均分)"><strong class="percent over" id="">比同行业平均水平高 <b style="color:#f60"  ng-bind="dtPingFeng.examedContext[11].value"></b></strong></em>
                        </div>
                        <div style="position:relative;left:100px;" class="avg" ng-show="dtPingFeng.examedContext[12].value!=''"> 行业平均得分约：<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[12].value"></b>，抵挡<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[13].value"></b>单<b style="color:#f60"  ng-bind="dtPingFeng.examedContext[14].value"></b>分后飘绿</div>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="mulu">
        <div class="search-view" style="margin-top: 30px">
            <input type="text"   ng-model="searchWordsMulu"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchMulu()" ng-disabled="mulu.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -38;margin-left: 249px;">
            <p class="title">目录查询</p>
            <p>本工具可以在线查询天猫、淘宝商品宝贝类目属性。再也不用去问别人怎么查看淘宝产品类目了。</p>
        </div>

        <div class="search-info" id="dtPingFengRs" style="width: 75%;margin-left: 200px">
            <div style="width: 90%" ng-if="mulu.msg == null " ng-show="mulu.vm.value!=0&&mulu.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': mulu.vm.striped}">
                    <div ng-class="['progress-bar', mulu.vm.style]" ng-style="{width: mulu.vm.value + '%'}">
                        <div ng-if="mulu.vm.showLabel">{{mulu.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="mulu.msg != null" style="color: red;font-size: 30px">
                {{mulu.msg}}
            </div>

            <div href="javascript:;" ng-show="mulu.examedContext != null" class="info-item" style="display: block;text-align:center; color; black;font-size: 24px;margin-left: -200px">
                {{mulu.examedContext}}
            </div>

        </div>



    </div>

    <div role="tabpanel" class="tab-pane" class="content" id="zhishu">
        <#--<div class="search-view" style="margin-top: 30px">-->
            <#--<input type="text"   ng-model="zhishu.searchWordsXy"  placeholder="请输入淘宝或天猫交易指数(大于2100)，然后点击 &quot;查询&quot; 按钮"/>-->
            <#--<button class="btn  search-btnN" href="javascript:;" ng-click="searchZhishu()" ng-disabled="zhishu.working">查询</button>-->
        <#--</div>-->

        <div class="reduction_con">
            <div class="reduction_list">
                <span class="active" ng-click="checkZhiShu('jyzs')">交易指数</span><span ng-click="checkZhiShu('llzs')">流量指数</span><span ng-click="checkZhiShu('zfzhlzs')">支付转化率指数</span><span ng-click="checkZhiShu('kqzs')">客群指数</span><span ng-click="checkZhiShu('ssrq')">搜索人气</span><span ng-click="checkZhiShu('jgrq')">加购人气</span><span ng-click="checkZhiShu('scrq')">收藏人气</span>
            </div>
            <div class="reduction_explain">
                <div class="search-desc active">
                    <p class="title">淘宝天猫交易指数查询转换销售额工具</p>
                    <#--<p></p>-->
                </div>
                <div class="search-desc">
                    <p class="title">流量指数说明文字</p>
                    <#--<p></p>-->
                </div>
                <div class="search-desc">
                    <p class="title">支付转化率指数说明文字</p>
                    <#--<p></p>-->
                </div>
                <div class="search-desc">
                    <p class="title">客群指数说明文字</p>
                    <#--<p></p>-->
                </div>
                <div class="search-desc">
                    <p class="title">搜索人气说明文字</p>
                    <#--<p></p>-->
                </div>
                <div class="search-desc">
                    <p class="title">加购人气说明文字</p>
                    <#--<p></p>-->
                </div>
                <div class="search-desc">
                    <p class="title">收藏人气说明文字</p>
                    <#--<p></p>-->
                </div>
            </div>
            <div class="reduction_box_fa  clearfix">
                <div class="reduction_box one">
                    <div class="tit clearfix">
                        <h2><img src="/deepsearch/img/pollsmall.gif" /><font>交易指数</font></h2>
                        <span></span>
                    </div>
                    <div class="reduction_box_text">
                        <p>请输入要计算的<font>交易指数</font>，一行一个（支持从excel复制粘贴），单次最大支持10000个指数同时批量计算！</p>
                    </div>
                    <div class="reduction_box_input">
                        <textarea placeholder="请输入您提供的数据" ng-model="zhishu.searchWordsXy"></textarea>
                    </div>
                </div>
                <div class="reduction_bt" >
                    <span ng-click="searchZhishu()" ng-disabled="zhishus.working" >转化成<font>交易金额</font></span>
                </div>
                <div class="reduction_box two">
                    <div class="tit clearfix">
                        <h2><img src="/deepsearch/img/viewpay.gif" class="active" /><img src="/deepsearch/img/activitysmall.gif" /><img src="/deepsearch/img/viewpay.gif" /><img src="/deepsearch/img/activitysmall.gif" />
                            <img src="/deepsearch/img/activitysmall.gif" /><img src="/deepsearch/img/tradesmall.gif" /><img src="/deepsearch/img/oshr.png" />
                            <font class="active">交易金额</font><font>访客人数</font><font>支付转化率</font><font>支付人数</font><font>搜索人数</font><font>加购人数</font><font>收藏人数</font></h2>
                        <span></span>
                    </div>
                    <div class="reduction_box_text">
                        <p>可以直接复制粘贴到excel使用，误差0.01%左右，如果需使用指导或验证帮助可联系微信！</p>
                    </div>
                    <div class="reduction_box_input">
                        <textarea disabled>{{zhishu.examedContext}}
                        </textarea>
                    </div>
                </div>
            </div>
        </div>
       <#-- <div class="search-info" id="zhishuRs" style="width: 75%;margin-left: 200px">
            <div style="width: 90%" ng-if="zhishu.msg == null " ng-show="zhishu.vm.value!=0&&zhishu.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': zhishu.vm.striped}">
                    <div ng-class="['progress-bar', zhishu.vm.style]" ng-style="{width: zhishu.vm.value + '%'}">
                        <div ng-if="zhishu.vm.showLabel">{{zhishu.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="zhishu.msg != null" style="color: red;font-size: 30px">
                {{zhishu.msg}}
            </div>
            <div href="javascript:;" ng-show="zhishu.examedContext != null" class="info-item">
                <div class="reductionIndex" id="dsr">
                    <div>
                        <h5 style="display: inline">销售金额：</h5>
                        <h1 ng-if="zhishu.searchWordsXy<=2100">交易指数过小</h1>
                        <h1 ng-if="zhishu.searchWordsXy>2100" id="item_score" ng-bind="zhishu.examedContext"></h1>
                    </div>

                    <h5>交易指数： <span class="count" id="item_score" ng-bind="zhishu.searchWordsXy"></span></h5>
                </div>

                &lt;#&ndash;<ul class="dsr-info" id="dsr" style="">&ndash;&gt;
                &lt;#&ndash;<li class="J_RateInfoTrigger dsr-item selected">&ndash;&gt;
                &lt;#&ndash;<div class="item-scrib">&ndash;&gt;
                &lt;#&ndash;<span class="title" style="">销售金额：</span>&ndash;&gt;
                &lt;#&ndash;<em style="color:#f60" class="count" id="item_score" ng-bind="zhishu.examedContext"></em>&ndash;&gt;
                &lt;#&ndash;</div>&ndash;&gt;
                &lt;#&ndash;<div class="item-scrib">&ndash;&gt;
                &lt;#&ndash;<span class="title" style="">交易指数：</span>&ndash;&gt;
                &lt;#&ndash;<em style="color:#f60" class="count" id="item_score" ng-bind="zhishu.searchWordsXy"></em>&ndash;&gt;
                &lt;#&ndash;</div>&ndash;&gt;
                &lt;#&ndash;</li>&ndash;&gt;
                &lt;#&ndash;</ul>&ndash;&gt;
            </div>
        </div>-->
    </div>

    <div role="tabpanel" class="tab-pane"  class="content" id="shangxiajia">
        <div class="search-view" style="margin-top: 30px" style="margin-top: 30px" style="margin-top: 30px">
            <input type="text"   ng-model="shangxiajia.searchWordsShangxiajia"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchShangxiajia()" ng-disabled="shangxiajia.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -38;margin-left: 249px;">
            <p class="title">淘宝上下架查询</p>
            <div>
                <h4>淘宝上下架时间应该如何合理安排？
                    <a href="#" style="color: #30F" ng-click="jqWords('div_pp12')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_pp12" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    1、淘宝上下架尽量安排在流量高峰期。据统计，一般在<span style="color: #FE8034">早上9：00-11：00，下午14：00-17：00，晚上19：00-22：00</span>的网上人流量最多。
                    因而，在宝贝上架时，在这些时间段，分别上些宝贝，或者用工具软件定时上架，<span style="color: #FE8034">在这个时间段每隔几分钟上一个宝贝。</span>
                </p>
                <p class="div_pp12" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    2、不要将宝贝设置在一天全部上架。如果将宝贝设置在一天内全部上架，那一周之内，店铺只会有一天是排名靠前的。而其他的六天时间，由于店铺没有快下架的宝贝，
                    无法排序到前几页，掌柜们很可能就会门庭冷落了。<span style="color: #FE8034">所以，建议掌柜们把宝贝门分成7天，在7天的不同时间段内，分批上架。</span>
                </p>
            </div>
        </div>

        <div class="search-info" id="shangxiajiaRs" style="width: 75%;margin:0 auto;">
            <div style="width: 90%" ng-if="shangxiajia.msg == null " ng-show="shangxiajia.vm.value!=0&&shangxiajia.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': mulu.vm.striped}">
                    <div ng-class="['progress-bar', shangxiajia.vm.style]" ng-style="{width: shangxiajia.vm.value + '%'}">
                        <div ng-if="shangxiajia.vm.showLabel">{{shangxiajia.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="shangxiajia.msg != null" style="color: red;font-size: 30px">
                {{shangxiajia.msg}}
            </div>

        <!-- 查询记录开始 -->
        <div class="result-context" ng-show="shangxiajia.examedContext != null&&shangxiajia.examedContext.length>0" >
            <table class="table table-hover up_table " style="  display: block;width:100%;margin-bottom: 0px;">
                <thead>
                <tr style="width:100%">
                    <td style="width: 30px;text-align: center"><label>商品图片</label></td>
                    <td style="width: 120px;text-align: center"><label>宝贝名称</label></td>
                    <td style="width: 90px;text-align: center"><label>上架时间</label></td>
                    <td style="width: 90px;text-align: center"><label>下架时间</label></td>
                    <td style="width: 90px;text-align: center"><label>剩余时间</label></td>
                </tr>
                </thead>
                <tbody>
                <tr style="width:100%" >
                    <td style="width: 30px;text-align: center">
                        <img class="up_img" ng-src="{{shangxiajia.examedContext[0].value}}">
                    <#--<b style="color:#f60"  ng-bind="shangxiajia.examedContext[0].value"></b>-->
                    </td>
                    <td style="width: 120px;text-align: center"><b   ng-bind="shangxiajia.examedContext[1].value"></b></td>
                    <td style="width: 90px;text-align: center"><b   ng-bind="shangxiajia.examedContext[2].value"></b></td>
                    <td style="width: 90px;text-align: center"><b  ng-bind="shangxiajia.examedContext[3].value"></b></td>
                    <td style="width: 90px;text-align: center"><b  ng-bind="shangxiajia.examedContext[4].value"></b>天<b ng-bind="shangxiajia.examedContext[5].value"></b>小时</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 查询记录结束 -->
            <div href="javascript:;" ng-show="shangxiajia.examedContext != null" class="info-item" style="display: block;text-align:center; color; black;font-size: 24px;margin-left: -200px">
                <!-- 查询记录开始 -->
                <div class="result-context" ng-show="shangxiajia.examedContext != null&&shangxiajia.examedContext.length>0" >
                    <table class="table table-hover up_table " style="  display: block;width:100%;margin-bottom: 0px;">
                        <thead>
                        <tr style="width:100%">
                            <td style="width: 30px;text-align: center"><label>商品图片</label></td>
                            <td style="width: 120px;text-align: center"><label>宝贝名称</label></td>
                            <td style="width: 90px;text-align: center"><label>上架时间</label></td>
                            <td style="width: 90px;text-align: center"><label>下架时间</label></td>
                            <td style="width: 90px;text-align: center"><label>剩余时间</label></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="width:100%" >
                            <td style="width: 30px;text-align: center">
                                <img class="up_img" ng-src="{{shangxiajia.examedContext[0].value}}">
                            <#--<b style="color:#f60"  ng-bind="shangxiajia.examedContext[0].value"></b>-->
                            </td>
                            <td style="width: 120px;text-align: center"><b   ng-bind="shangxiajia.examedContext[1].value"></b></td>
                            <td style="width: 90px;text-align: center"><b   ng-bind="shangxiajia.examedContext[2].value"></b></td>
                            <td style="width: 90px;text-align: center"><b  ng-bind="shangxiajia.examedContext[3].value"></b></td>
                            <td style="width: 90px;text-align: center"><b  ng-bind="shangxiajia.examedContext[4].value"></b>天<b ng-bind="shangxiajia.examedContext[5].value"></b>小时</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 查询记录结束 -->


        </div>
    <!-- 上下架查询结束 -->

    <!-- 下拉框选词开始 -->
    <div role="tabpanel" class="tab-pane"  class="content" id="xialakuang">
        <div class="search-view" style="margin-top: 30px" style="margin-top: 30px" style="margin-top: 30px">
            <input type="text"   ng-model="xialakuang.searchWordsXialakuang"  placeholder="输入您感兴趣的产品核心词，即可查看对应的下拉框推荐词，相关宝贝数和推荐属性词： &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchXialakuang()" ng-disabled="xialakuang.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -38;margin-left: 249px;">
            <p class="title">淘宝搜索下拉框选词</p>
            <div>
                <h4>为什么要用下拉框选词功能？<a href="#" style="color: #30F" ng-click="jqWords('div_pp11')" id="button1" class="glyphicon glyphicon-plus">点击查看</a></h4>
                <p class="div_pp11" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #FE8034">淘宝搜索下拉框选词</span>
                    是通过淘宝、天猫、手机淘宝搜索下拉框查询淘宝搜索指数高、流量高、转化率高的关键词，并获取各关键词对应的在线相关宝贝数量及其推荐属性词。
                    <span style="color: #FE8034">对于查询到的这些关键词</span>建议亲们使用生意参谋对其成交指数进行数据分析来选取真正适合自己宝贝的关键词，是
                    <span style="color: #FE8034">淘宝商家标题优化和直通车选词的好助手。</span></p>
            </div>
        </div>

        <!-- 下拉框选词内容展现 -->
        <div class="search-info" id="xialakuangrs" >
            <div style="width: 100%" ng-if="xialakuang.msg == null " ng-show="xialakuang.vm.value!=0&&xialakuang.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': jiangquan.vm.striped}">
                    <div ng-class="['progress-bar', xialakuang.vm.style]" ng-style="{width: xialakuang.vm.value + '%'}">
                        <div ng-if="xialakuang.vm.showLabel">{{xialakuang.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="xialakuang.msg != null" style="color: red;font-size: 30px">
                {{xialakuang.msg}}
            </div>
            <div class="result-context" ng-show="xialakuang.examedContext != null&&xialakuang.examedContext.length>0" >
                <table class="table table-striped table-bordered table-hover table-condensed" style="  width:100%;margin-bottom: 0;">
                    <thead>
                    <tr style="width:100%">
                        <td style="text-align: center"><label>对应关键词</label></td>
                        <td style="text-align: center"><label>对应数量</label></td>
                        <#--<td style="width: 90px;text-align: center"><label>销量</label></td>-->
                        <#--<td style="width: 90px;text-align: center"><label>价格</label></td>-->
                    <#--&lt;#&ndash;<td style="width: 50px;text-align: center"><label>价格</label></td>&ndash;&gt;-->
                        <#--<td style="width: 90px;text-align: center"><label>库存</label></td>-->
                        <#--<td style="width: 90px;text-align: center"><label>权重值</label></td>-->
                        <#--<td style="width: 120px;text-align: center"><label>说明</label></td>-->

                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="data in xialakuang.examedContext " >
                        <td >
                            <b   ng-bind="data.name"></b>
                        </td>
                        <td >
                            <b   ng-bind="data.num"></b>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 下拉框选词内容展现结束 -->

    </div>
    <!-- 下拉框选词结束 -->

    <!-- 淘宝展现结束 -->
    <div role="tabpanel" class="tab-pane" class="content" id="zhanxian">
        <div class="search-view" style="margin-top: 30px">
            <input type="text"   ng-model="zhanxian.searchWordsXy"  placeholder="请输入需要查询的商品ID或是商品链接 &quot;查询&quot; 按钮"/>
            <button class="btn  search-btnN" href="javascript:;" ng-click="searchZhanxian()" ng-disabled="zhanxian.working">查询</button>
        </div>

        <div class="search-desc" style="margin-top: -38;margin-left: 249px;">
            <p class="title">根据旺旺或者宝贝ID查询电脑端或者无线端的展现词,分析同行或者自己的流量入口！</p>
        <#-- <p>1、提高对顾客的服务态度，发货速度，完善商品的描叙。让顾客舒心购物!</p>
         <p>2、<font>顾客收到宝贝后，主动联系顾客是否满意</font>。从而提醒顾客好评并打5分!</p>
         <p>3、邀请你的朋友关照下你，从而获得5分好评!</p>
         <p>4、<font>加入一些互刷平台，或是互刷团队来提高动态评分!</font>安全，方便，快捷。</p>-->
        </div>

        <div class="search-info" id="zhanxianRs" style="width: 75%;margin:0 auto">
            <div style="width: 90%" ng-if="zhanxian.msg == null " ng-show="zhanxian.vm.value!=0&&zhanxian.vm.value!=100">
                <div ng-class="{progress: true, 'progress-striped': zhanxian.vm.striped}">
                    <div ng-class="['progress-bar', zhanxian.vm.style]" ng-style="{width: zhanxian.vm.value + '%'}">
                        <div ng-if="zhanxian.vm.showLabel">{{zhanxian.vm.value}}%</div>
                    </div>
                </div>
            </div>
            <div class="noViolation " ng-show="zhanxian.msg != null" style="color: red;font-size: 30px">
                {{zhanxian.msg}}
            </div>
            <div href="javascript:;" ng-show="zhanxian.examedContext != null" class="info-item">
                <div class="zhanxian_con">
                    <div class="zhanxian_box clearfix">
                        <a href="{{zhanxian.examedContext.a_href}}" target="_blank" ><img ng-src="{{zhanxian.examedContext.img}}"></a>
                        <div class="zhanxian_box_text"><p  ng-bind="zhanxian.examedContext.text"></p></div>
                    </div>
                    <div class="zhanxian_list"><span ng-repeat="item in zhanxian.examedContext.content" ng-bind="item"></span></div>
                </div>
                <#--<div class="reductionIndex" id="dsr">-->

                <#-- <div>
                        <h5 style="display: inline">销售金额：</h5>
                        <h1 ng-if="zhishu.searchWordsXy<=2100">交易指数过小</h1>
                        <h1 ng-if="zhishu.searchWordsXy>2100" id="item_score" ng-bind="zhishu.examedContext"></h1>
                    </div>
                    <h5>交易指数： <span class="count" id="item_score" ng-bind="zhishu.searchWordsXy"></span></h5>-->
                <#--</div>-->

            </div>
        </div>
    </div>
    <!-- 淘宝展现结束 -->
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



<!--关于我们 Modal -->
<div class="modal fade" id="weModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">关于我们</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <#--<label style="font-size: 25px ;color: red;text-align: center">请登陆后进行查询！</label>-->
                <p style="word-break:break-all;text-align:left;text-indent:2em"> 杭州兴淘网络科技有限公司是一家以技术为驱动、以社群为闭环的电商服务公司。其旗下的白马查产品为广大电商用户提供了精准的在线数据查询功能。 同时公司旗下的白马会为电商社群，为广大电商提供交流互助、资源共享的平台。</p>
                <p>公司自成立以来一直以服务广大电商卖家为己任。未来兴淘网络还会继续推出更多的服务，敬请期待。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<!--联系我们 Modal -->
<div class="modal fade" id="tellweModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">联系我们</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <p>联系方式：杭州市江干区艮山支三路5号4幢104室</p>
                <p>联系电话：13858154498（电话/微信）</p>
                <p>联系时间：工作日9:00—18:00</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="tixing" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
    <div class="modal-dialog" role="document" style="width: 400px;height: 400px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size: 45px">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" style="color: #008fff;font-size: 25px">温馨提醒：</h4>
            </div>
            <div class="modal-body" style="text-align: center;">
                <span style="font-size: 18px;text-align: center;color: #008fff;">注册完只提供&nbsp;<span style="color: red">20w热词</span>&nbsp;下载功能</span></br>
                <span style="font-size: 18px;text-align: center;color: #008fff;">数据查询功能请添加客服微信免费开通</span>
                <img src="/codeimg/codeImg.jpg" style="width: 200px;margin-left: 80px">
            </div>
            <div class="modal-footer">
            <#--<button type="button" class="btn btn-primary" ng-click="signLogin()">确认</button>-->
                <input id="btn-login"  class="btn-submit"  type="button"  style="
                height: 36px;
                width: 85px;
                border: none;
                background-color: #008fff;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                "  value="我知道了"  data-dismiss="modal" >&nbsp;&nbsp;&nbsp;
                <#--<input id="btn-login"  class="btn-submit"  type="button"  style="height: 36px;width: 71px"  value="" ng-click="registered()" >-->
            </div>
        </div>
    </div>
</div>

<div  class="footer" style="position: fixed;bottom: 0;width: 100%">
    <p>杭州兴淘网络科技有限公司  浙ICP备18047066号 &nbsp; <a style="text-decoration:none;color: gray;cursor:pointer;font-size: 13px;" ng-click="showWeModal('weModal')">关于我们</a>&nbsp; <a style="text-decoration:none;color: gray;cursor:pointer;font-size: 13px;" ng-click="showWeModal('tellweModal')">联系我们</a></p>
</div>


</body>

<script src="/deepsearch/js/jquery-2.1.4.min.js"></script>
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="/deepsearch/js/spop/spop.min.js"></script>
<script src="/deepsearch/js/loading/jquery.mloading.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="/deepsearch/js/searchController.js"></script>
<script src="/deepsearch/js/jquery.lazyload.min.js"></script>
<script src="/deepsearch/js/jquery.scrollstop.min.js"></script>


<script type="text/javascript">
    //指数还原点击事件
    $(".reduction_list span").click(function(){
        var index=$(this).index();
        // alert(index);
        $(this).addClass("active").siblings().removeClass("active");
        $(".reduction_box.two .tit h2 font").removeClass("active");
        $(".reduction_box.two .tit h2 font").eq(index).addClass("active");
        $(".reduction_box.two .tit h2 img").removeClass("active");
        $(".reduction_box.two .tit h2 img").eq(index).addClass("active");
        $(".reduction_explain .search-desc").eq(index).addClass("active").siblings().removeClass("active");
        var name=$(this).text();
        var name2=$(".reduction_box.two .tit h2 font").eq(index).text();
        $(".reduction_box.one .tit h2 font,.reduction_box_text p font").text(name)
        $(".reduction_bt span font").text(name2);
    })


    user = '${user!}';
    var activeIndex = location.search.slice(1).split('=')[1]
    $('.one').eq(activeIndex).addClass('active')
    $('.one').on('click', function () {
        if($(this).hasClass("header_more")){
            // alert(1)

        }else if($(this).find("a").attr('href')=="#")
        {
            alert("此功能暂未开发")
        }
        else{
            $(this).siblings().removeClass('active')
            $(this).addClass('active')
        }


    })
    $(".header_more li a").click(function(){

        if($(this).attr('href')=="#")
        {
            alert("此功能暂未开发")
        }
        else{
            $(this).parents(".one").siblings().removeClass('active')
            $(this).parents(".one").addClass('active')
        }

    })
    $("img").lazyload({
        effect: "fadeIn"

    });
    $(".header_more ul a").on('click', function (){
        if($(this).attr('href')=="#"){
            alert("此功能暂未开发")
        }
    })
    $('.one a').on('click', function () {
        $('.content').hide();
        $($(this).attr('data-id')).show()
    })

    //默认弹框样式
    window.alert = function (msg){
        dialog.showTips(msg, "warn");
    }
    var dialog = {
        /*
         type为firm时，url传回调参数
         */
        showTips : function (msg,type,url){

            var htmlCon="";


            htmlCon='<div class="wap_tanc" style="display: block;">'+
                '<div class="wap_tanc_bg"></div>'+
                '<div class="wap_tanc_con" style="display: block;">'+
                '<h5>'+msg+'</h5>'+
                '<div class="wap_tanc_btn clearfix">'+
                '<a href="javascript:void(0)" style="width:100%;" class="close1">确定</a>'+
                '</div>'+
                '</div>'+
                '</div>';

            $('.wap_tanc').remove();
            $('body').append(htmlCon);
            var url_function = url;
            //$('body').prepend("pllp");

            $('.close1').click(function(){
                $('.wap_tanc').stop(true).fadeOut(300);
                $('.wap_tanc_con').stop(true).fadeOut(300);
                if(typeof url == "function" && type=='warn'){url_function();}
                return false;
            });

            $(".reload").click(function(){
                location.reload();
            });
            $(".continue").click(function (){
                // url();
                $('.close1').trigger("click");
            })
        }
    }

</script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?60c29ab7479bfdc45d717f03b3cce9b5";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();

    function changeURLArg(url,arg,arg_val){
        var pattern=arg+'=([^&]*)';
        var replaceText=arg+'='+arg_val;
        if(url.match(pattern)){
            var tmp='/('+ arg+'=)([^&]*)/gi';
            tmp=url.replace(eval(tmp),replaceText);
            return tmp;
        }else{
            if(url.match('[\?]')){
                return url+'&'+replaceText;
            }else{
                return url+'?'+replaceText;
            }
        }
    }
</script>

</html>