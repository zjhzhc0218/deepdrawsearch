<code class="language-html"><!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>sign</title>
        <link rel="stylesheet" href="/deepsearch/css/normalize.css">
        <link rel="stylesheet" href="/deepsearch/css/login.css">
        <link rel="stylesheet" href="/deepsearch/css/spop/spop.css">
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://www.jq22.com/demo/angular201707111100/css/bootstrap.min.css">



        <style>
            .panel{width:60%;margin:0 auto;text-align: center;}
            .form-inline{width:60%;margin:0 auto;}
        </style>

    </head>

    <body ng-app="app" ng-controller="ctrl">
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
                    <button  ng-click="" class="btn btn-primary btn-block btn-large">禁止登录</button>
                    <button  ng-click="" class="btn btn-primary btn-block btn-large">恢复登录</button>
                    <button  ng-click="" class="btn btn-primary btn-block btn-large">一键还原初始密码</button>

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


    </body>


    <script src="/deepsearch/js/angular/angular.js"></script>
    <script src="/deepsearch/js/spop/spop.js"></script>
    <script src="http://www.jq22.com/jquery/angular-1.4.6.js"></script>
    <script type="text/javascript" src="http://www.jq22.com/demo/angular201707111100/js/ui-bootstrap-tpls.min.js"></script>

    <script src="https://cdn.bootcss.com/angular-ui-bootstrap/2.5.0/ui-bootstrap-tpls.min.js"></script>

    <script src="/deepsearch/js/userController.js"></script>


    </html>
</code>