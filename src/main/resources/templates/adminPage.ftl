<!DOCTYPE>
<html ng-app="app">
<head>
    <title>后台管理</title>
    <!-- 设置文档编码 -->
    <link rel="shortcut icon" href="/codeimg/baima.ico" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=width,user-scalable=no">
    <meta name="viewport" content="user-scalable=no">
    <meta name="viewport" content="user-scalable=yes">
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

        a {
            cursor:pointer;
        }
        .modal-backdrop{z-index:0;}
        .panel{width:60%;margin:0 auto;text-align: center;}
        .form-inline{width:40%;margin:0 auto;}

        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #373731;
            /*font-style: italic;*/
            font-weight: bold;
            font-size: 30px;
        }
        .one a {
            font-size: 22px;
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

</head>

<body ng-controller="adminController" style="overflow: hidden">
<!--顶部-开始-->
<header>
    <div class="header-content">
        <div class="header-top">
            <a class="logo"  href="http://www.baimacha.com">
                <img src="img/logo.png"/>
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
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="#" ng-click="signLogin()">退出</a></li>
                    </ul>
                </li>
            </ul>
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
        <div class="nav-list" style="position: relative;text-align: center">

            <div class="one active">
                <a  class="" role="tab" data-toggle="tab" href="#renyuan" style="font-size: 22px">人员详情</a>
            </div>

            <div class="one">
                <a  role="tab" data-toggle="tab" href="#cishu" style="font-size: 22px">功能模块数据</a>
            </div>

         <#--   <div class="one">
                <a  role="tab" data-toggle="tab" href="#zixun" style="font-size: 22px">上传资讯</a>
            </div>-->

            <div class="one">
                <a  role="tab" data-toggle="tab" href="#zxgl" style="font-size: 22px">资讯管理</a>
            </div>

            <div class="one">
                <a  role="tab" data-toggle="tab" href="#wdgl" style="font-size: 22px">数据化运营</a>
            </div>

            <div class="one">
                <a  role="tab" data-toggle="tab" href="#erweima" style="font-size: 22px">二维码更换</a>
            </div>

            <div class="one">
                <a  role="tab" data-toggle="tab" href="#gonggao" style="font-size: 22px">公告管理</a>
            </div>

        </div>
    </div>
</header>
<!--导航-结束-->

<#--测试-->

<!--内容-开始-->
<div style=" overflow-y: auto;width: 100%;height: 75%;padding-top: 22px; " class="container">
    <div class="tab-content" >
        <!--人员详情-->
        <div role="tabpanel" class="tab-pane active" id="renyuan">
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
                    <button  ng-click="select()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 90px;height: 36px;">查询</button>
                    <div ng-show="type==99" class="col-md-12 column form-inline " style="margin-top:20px;font-size: 20px">
                        <label class="font-7">开始时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" "/>
                    </div></br>
                    <div ng-show="type==99" class="col-md-12 column form-inline " style="font-size: 20px">
                        <label class="font-7">结束时间：</label>
                        <input type="text" class="Wdate form-control" style="width: 190px;height: 35px;border-radius:5px ;margin-left: 119px;" ng-model="time.endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  onchange=""  "/>
                    </div>
                    <button  ng-click="export()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 90px;height: 36px;">导出</button>
                    </br>

                    <div class="panel">
                        <div class="row req form-inline">
                            <div class="col-md-8 col-md-offset-4 solid_top form-group">
                                <div class="pull-right">
                                    <label>展示条数:
                                        <select class="form-control" ng-change="change(selectedLimit)" ng-model="selectedLimit" ng-options="value.limit for value in values"></select>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <table class="table">
                            <thead>
                            <tr>
                                <td>用户手机</td>
                                <td>用户归属地</td>
                                <td>注册时间</td>
                                <td>最后登录时间</td>
                                <td>登录次数</td>
                                <td>用户权限</td>
                                <td>是否禁用</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="data in datas">
                                    <td>{{data.id}}</td>
                                    <td>{{data.nickname}}</td>
                                    <td>{{data.registerDate|date:'yyyy-MM-dd HH:mm:ss'}}</td>
                                    <td>{{data.lastLoginDate|date:'yyyy-MM-dd HH:mm:ss'}}</td>
                                    <td>{{data.loginCount}}</td>
                                    <td>{{data.grade}}</td>
                                    <td>{{data.ban}}</td>
                                    <td>
                                        <button  ng-click="banJ(data.id)" class="btn btn-primary btn-blockN btn-large">禁登</button>
                                        <button  ng-click="banH(data.id)" class="btn btn-primary btn-blockN btn-large">复登</button>
                                        <button  ng-click="gradeJ(data.id)" class="btn btn-primary btn-blockN btn-large">降权限</button>
                                        <button  ng-click="gradeH(data.id)" class="btn btn-primary btn-blockN btn-large">升权限</button>
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
        <#--使用次数-->
        <div role="tabpanel" class="tab-pane " id="cishu">
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
                    <button  ng-click="selectFT()" class="btn btn-primary btn-block btn-large" style="font-size: 20px;width: 90px;height: 36px;">查询</button>
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

                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>动态评分</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{dongtaipingfen}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>目录</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{mulu}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>上下架</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{shangxiajia}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>指数</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{zhishu}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>展现</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{zhanxian}}</td>
                        </tr>
                        <tr>
                            <td>{{id}}</td>
                            <td>{{qixian}}</td>
                            <td>下拉框</td>
                            <td>{{time.startTime}}</td>
                            <td>{{time.endTime}}</td>
                            <td>{{xialakuang}}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <#--资讯内容-->
        <div  role="tabpanel" class="tab-pane " id="zxgl" style="position: relative;margin-left: 13%">
            <#--第一行-->
            <#--<b style="font-size: 26px">资讯管理</b>-->
            <#--第二行-->
            <div style="margin-top: 35px;font-size: 20px"></div>
            <#--第三行-->
            <div style="margin-top: 15px;">
                <button class="btn btn-primary" style="display: inline;" ng-click="deleteAll();">批量删除</button>
                <button class="btn btn-primary" style="display: inline;margin-left: 2%;" ng-click="showZxModal('zixun')">新增资讯</button>

                <div style="display: inline;margin-left: 15%">
                    <span>标题：</span>
                    <input style="width: 12%" ng-model="queryparam.title">
                </div>

                <div style="display: inline;margin-left: 2%">
                    <span>资讯类型：</span>
                    <select style="" ng-model="queryparam.type">
                        <option value ="0">全部</option>
                        <option value ="1">电商实战宝箱</option>
                        <option value ="2">电商头条</option>
                    </select>
                </div>

                <div style="display: inline;margin-left: 2%"><button class="btn btn-primary" style="display: inline;" ng-click="queryinfo();">查<span>&nbsp;&nbsp;&nbsp;</span>询</button></div>

            </div>
            <#--表格-->
            <table style="margin-top: 25px;width: 86%;text-align: center" class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th style="text-align: center;width: 50px"></th>
                        <th style="text-align: center;width: 50px">序号</th>
                        <th style="text-align: center">标题</th>
                        <th style="text-align: center">作者</th>
                        <th style="text-align: center">类型</th>
                        <th style="text-align: center">封面</th>
                        <th style="text-align: center">描述</th>
                        <th style="text-align: center">创建时间</th>
                        <th style="text-align: center;width: 50px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="data in zixunrecord">
                        <td><input type="checkbox" ng-model="data.checked"></td>
                        <td ng-bind="data.serialNumber"></td>
                        <td ng-bind="data.title"></td>
                        <td ng-bind="data.author"></td>
                        <td ng-bind="data.typeN"></td>
                        <td ng-bind="data.cover"></td>
                        <td ng-bind="data.describeN"></td>
                        <td ng-bind="data._creationTime"></td>
                        <td><a ng-click="edit(data)">编辑</a>&nbsp;&nbsp;<a ng-click="deleteOne(data.serialNumber)">删除</a></td>
                    </tr>
                </tbody>
            </table>

        </div>
        <!--  文档内容 开始-->
        <#--文档内容-->
        <div  role="tabpanel" class="tab-pane " id="wdgl" style="position: relative;margin-left: 13%">
            <#--<div style="margin-top: 35px;font-size: 20px">-->
                <#--</div>-->
            <div style="margin-top: 15px;">
                <button class="btn btn-primary" style="display: inline;" ng-click="deleteAllWJ()">批量删除</button>
                <button class="btn btn-primary" style="display: inline;margin-left: 5%;" ng-click="showZxModal('wendang')">新增文件</button>

                <div style="display: inline;margin-left: 22%">
                    <span style="">标题：</span>
                    <input style="width: 15%" >
                </div>

                <div style="display: inline;margin-left: 4%"><button class="btn btn-primary" style="display: inline;width: 90px" ng-click="queryinfoWJ()">查<span>&nbsp;&nbsp;&nbsp;</span>询</button></div>

            </div>
        <#--表格-->
            <table style="margin-top: 25px;width: 86%;text-align: center" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th style="text-align: center"></th>
                    <th style="text-align: center">序号</th>
                    <th style="text-align: center">标题</th>
                    <th style="text-align: center">封面</th>
                    <th style="text-align: center">文件</th>
                    <th style="text-align: center">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="data in wenjianrecord">
                    <td><input type="checkbox" ng-model="data.checked"></td>
                    <td ng-bind="data.fileId"></td>
                    <td ng-bind="data.fileName"></td>
                    <td ng-bind="data.filePicture"></td>
                    <td ng-bind="data.fileDownloadpath"></td>
                    <td><a ng-click="deleteOneWJ(data.fileId)">删除</a></td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  文档内容 结束-->
        <#--二维码更换-->
        <div  role="tabpanel" class="tab-pane " id="erweima" style="margin-left: 45%;margin-top: 5%">
            <div  class="upload-button" type="file" capture="camera" ngf-select="shopParams.uploadFiles($file,$errorfile)" ng-model="shopParams.file" accept="image/jpg,image/JPG,image/jpeg,image/gif,image/png" ngf-max-height="2000" ngf-max-size="5MB" >
                <img style="height: 30px;width: 30px;display: inline" class="uploadpic img-rounded" ng-src="{{shopParams.imgSrc}}" ng-model="shopParams.img"/>
                <div style="" class="glyphicon glyphicon-camera uploadpic-label">点击上传</div>
            </div>
            <button  ng-click="shopParams.editShop()" class="btn btn-primary btn-block btn-large" style="display: inline;width: 90px">确认上传</button>
        </div>
        <#--公告管理-->
        <div  role="tabpanel" class="tab-pane " id="gonggao" style="position: relative;margin-left: 13%">
            <div style="margin-top: 35px;font-size: 20px"></div>

            <div style="margin-top: 15px;">
                <button class="btn btn-primary" style="display: inline;" ng-click="deleteAllGG()" >批量删除</button>
                <button class="btn btn-primary" style="display: inline;margin-left: 5%;" ng-click="showZxModal('gonggao1')">新增公告</button>
                <div style="display: inline;margin-left: 20%">
                    <span style="">标题：</span>
                    <input style="width: 15%" ng-model="queryparam.title">
                </div>
                <div style="display: inline;margin-left: 4%"><button class="btn btn-primary" style="display: inline;"  ng-click="queryinfoGG();">查<span>&nbsp;&nbsp;&nbsp;</span>询</button></div>
            </div>

            <table style="margin-top: 25px;width: 86%;text-align: center" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th style="text-align: center;width: 50px"></th>
                    <th style="text-align: center;width: 50px">序号</th>
                    <th style="text-align: center">标题</th>
                    <th style="text-align: center">作者</th>
                    <th style="text-align: center">简介</th>
                    <th style="text-align: center;">内容</th>
                    <th style="text-align: center;width: 50px">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="data in gonggaorecord">
                    <td><input type="checkbox" ng-model="data.checked"></td>
                    <td ng-bind="data.id"></td>
                    <td ng-bind="data.title"></td>
                    <td ng-bind="data.author"></td>
                    <td ng-bind="data.synopsis"></td>
                    <td ng-bind="data.specificContent"></td>
                    <td><a ng-click="deleteOneGG(data.id)">删除</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>




<!-- Modal -->
<div class="modal fade" id="zixun" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
    <div class="modal-dialog" role="document" style="width: 60%">
            <div class="modal-content" style="">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size: 32px">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel" style="color: #337ab7">资&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;讯</h3>
                </div>

                <div class="modal-body" style="">
                    <div  role="tabpanel" class="tab-pane " id="zixun" style="margin-left: 10%">
                        <div style="margin-bottom: 24px;font-size: 19px;margin-top: 24px">标<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>题：<input placeholder="请输入资讯标题" type="text" style="display: inline;width: 77%" ng-model="page.title" ></div>
                        <div style="margin-bottom: 24px;font-size: 19px">作<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>者：<input placeholder="请输入作者" type="text" style="display: inline;width: 77%" ng-model="page.author"></div>
                        <div style="margin-bottom: 24px;font-size: 19px">
                            <span>资讯类型：</span>
                            <select ng-model="page.select" style="">
                                <option value ="1">电商实战宝箱</option>
                                <option value ="2">电商头条</option>
                            </select>
                        </div>
                        <div style="margin-bottom: 24px;font-size: 19px">
                            <span>上传封面：</span>
                            <div  class="upload-button" type="file" capture="camera" ngf-select="page.uploadFiles($file,$errorfile)" ng-model="page.file" accept="image/jpg,image/JPG,image/jpeg,image/gif,image/png" ngf-max-height="2000" ngf-max-size="5MB" style="display: inline">
                                <img  style="height: 30px;width: 30px;display: inline;" class="uploadpic img-rounded" ng-src="{{page.imgSrc}}" ng-model="page.img"/>
                                <div style="" class="glyphicon glyphicon-camera uploadpic-label">点击上传</div>
                            </div>
                        </div>
                        <div style="margin-bottom: 24px;font-size: 19px">描<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>述：<input placeholder="请输入描述内容" type="text" style="width: 77%" ng-model="page.words"></div>
                        <p style="font-size: 19px">内<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>容：</p><div id="editor" style="margin-bottom: 24px;font-size: 15px;width: 700px;"></div>
                        <div style="margin-left: 20%">
                            <button class="btn btn-primary" style="display: inline;width: 150px" ng-click="infosum();">提交</button>
                            <button class="btn btn-primary" style="display: inline;width: 150px;margin-left: 5%">重置</button>
                        </div>
                </div>
                <#--<div class="modal-footer">-->
                    <#--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>-->
                    <#--<button type="button" class="btn btn-primary" ng-click="signLogin()">注册/登陆</button>-->
                <#--</div>-->
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="wendang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
    <div class="modal-dialog" role="document" style="width: 60%">
        <div class="modal-content" style="">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size: 32px">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel" style="color: #337ab7">文&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;档</h3>
            </div>

            <div class="modal-body" style="">
                <div  role="tabpanel" class="tab-pane " id="wenzhang" style="margin-left: 10%">
                    <form action="/deepsearch/File/uploadNew" method="POST" enctype="multipart/form-data" style="font-size: 19px">
                        <div style="margin-top: 20px;margin-bottom: 20px">图片：<input type="file" name="testTu" style="display: inline"/></div>
                        <div style="margin-bottom: 20px">文件：<input type="file" name="test" style="display: inline"/></div>
                        <div style="margin-bottom: 20px"><button class="btn btn-primary" style="display: inline;width: 90px" type="submit">提交</button></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="gonggao1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
    <div class="modal-dialog" role="document" style="width: 60%">
        <div class="modal-content" style="">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="font-size: 32px">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel" style="color: #337ab7">新 增 公 告</h3>
            </div>

            <div class="modal-body" style="">
                <div role="tabpanel" class="tab-pane " style="margin-left: 10%">
                        <div style="margin-top: 20px;margin-bottom: 20px">标题：<input placeholder="请输入公告标题" type="text" style="display: inline;width: 77%" ng-model="gonggao.title" ></div>
                        <div style="margin-bottom: 20px">作者：<input placeholder="请输入作者" type="text" style="display: inline;width: 77%" ng-model="gonggao.author" ></div>
                        <div style="margin-bottom: 20px">简介：<input placeholder="请输入简介" type="text" style="display: inline;width: 77%" ng-model="gonggao.synopsis" ></div>
                        <div style="margin-bottom: 20px">内容：<textarea placeholder="请输入内容" type="text" style="width: 80%;height: 30%" ng-model="gonggao.specificContent"></textarea></div>
                        <div style="margin-top: 50px;margin-left: 20%">
                            <button class="btn btn-primary" style="display: inline;width: 150px" ng-click="infosumGG();" >提交</button>
                            <button class="btn btn-primary" style="display: inline;width: 150px;margin-left: 5%">取消</button>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!--尾部-结束-->

<div class="footer" style="position:fixed;bottom:0;width:100%;background-color:#e5e5e5;height: 40px;line-height: 40px;text-align: center">
    <p>杭州兴淘网络科技有限公司  浙ICP备18047066号</p>
</div>



</body>

<#--<script src="/deepsearch/js/jquery-2.1.4.min.js"></script>-->
<script type="text/javascript" src="/deepsearch/js/verdor/jquery/jquery-2.1.4.min.js"></script>

<#--<script src="/deepsearch/js/angular/angular.js/angular.min.js"></script>-->
<script src="/deepsearch/js/angular/angular.min.js"></script>
<script src="/deepsearch/js/jquery-2.1.4.min.js"></script>
<script src="/deepsearch/js/adminController.js"></script>
<script src="/deepsearch/js/spop/spop.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<#--主页面判断-->
<!-- 表单引入的 -->
<#--<script src="/deepsearch/js/angular-ui-bootstrap.js"></script>-->
<script type="text/javascript" src="/deepsearch/js/angular/ng-file-upload.js"></script>
<script src="https://cdn.bootcss.com/angular-ui-bootstrap/2.5.0/ui-bootstrap-tpls.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>



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
    var E = window.wangEditor;
    var editor = new E('#editor')
    editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()
</script>

</html>