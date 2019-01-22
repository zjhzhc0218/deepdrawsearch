var app=angular.module('history',[])
    .controller('historyController',['$scope','$http','$sce','$filter', function ($scope,$http,$sce,$filter) {

    /**
     * 登陆信息
     * @type {string}
     */
    $scope.username = null;
    if (user != '') {
        $scope.username = angular.fromJson(user);
    }


        //########################历史价格查询###############################//
        $scope.searchWordsHistory = null;//查询
        $scope.history = {
            hasNoViolation : false,
            working : false,
            hideDetail : false,
            hasAbsolutedWord : false,
            examedContext : null
        };
        var historyvm = $scope.history.vm = {};
            historyvm.value = 0;
            historyvm.style = 'progress-bar-info';
            historyvm.showLabel = true;
            historyvm.striped = true;
        $scope.searchHistory = function () {

            if ($scope.username == null){
                $('#myModal').modal('show');
                return;
            }

            //判断是否注册
            // var fCount = getFTForUser();
            if($scope.username.grade == 2) {
                $(".index_frame").stop(true).fadeIn(300);
                return;
            }
            if( $scope.searchWordsHistory == null) {
                spop({template: '<strong>请输入查询字符!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
            var str = angular.copy($scope.searchWordsHistory);
            str = str.match(/id=(\d*)/);
            if (str) {
                $scope.searchWordsHistory = str[1];
            }
            var reg = /^[0-9]+.?[0-9]*$/;
            if (!reg.test($scope.searchWordsHistory)) {
                spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }

            /*  $("#wjcrs").mLoading({
             text:"查询中"
             });*/
            historyvm.value = 0;
            $scope.history.examedContext = null;
            $scope.history.msg = null;
            $scope.history.hasNoViolation = false;
            var interval = setInterval(function(){
                historyvm.value++;
                $scope.$apply();
                if (historyvm.value == 100) {
                    $scope.history.msg = "查询超时！请重新查询";
                    $scope.history.working = false;
                    $scope.history.hasNoViolation == true;
                    $scope.$apply();
                    clearInterval(interval);
                }
            }, 240);
            $scope.history.working = true;
            $http({
                method:'get',
                url:'/deepsearch/getSearchhistory', params:{"searchWords": $scope.searchWordsHistory},
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                transformRequest: function ( data ) {
                    var str = '';
                    for( var i in data ) {
                        str += i + '=' + data[i] + '&';
                    }
                }}
            ).then(function successCallback(info) {
                if (info.data.code == 1) {
                    // alert(info.data.msg);
                    $scope.history.msg = info.data.msg;
                    $scope.history.hasNoViolation = true;
                }else if(info.data.code == 0){
                    $scope.history.examedContext = angular.fromJson(info.data.data);
                    $scope.history.hideDetail = true;
                    $scope.history.working = false;
                    historyvm.value = 100;
                    clearInterval(interval);
                }
            },function errorCallback(info) {
                $scope.history.working = false;
                historyvm.value = 100;
                clearInterval(interval);
                // $("#wjcrs").mLoading("hide");
                // alert("失败了");
            })
        }

       /* $scope.hideDetail = function () {
            $scope.history.hideDetail = false;
        }*/


    $scope.searchLogin = function () {
        if ($scope.username == null){
            $('#myModal').modal('show');
            return;
        }
    }

    //注销
    $scope.signLogin = function() {
        if($scope.username) {
            $http({
                    method: 'post',
                    url: '/deepsearch/removeSession',
                    params: {},
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    transformRequest: function (data) {
                        var str = '';
                        for (var i in data) {
                            str += i + '=' + data[i] + '&';
                        }
                    }
                }
            )
        }
        var url='/deepsearch/sign';
        location.href = url;
    };

    $scope.toAdminPage = function () {
        var url='/deepsearch/adminPage';
        location.href = url;
    }

    $scope.jqWords = function (str) {
        $("."+str).toggle();
    }


    $scope.showWeModal = function (name) {
        $('#'+ name).modal('show');
    }

            /**
             * 获得次数
             */
    var getFTForUser = function () {
             var count = null;
                $.ajaxSettings.async = false;
                $.ajax({
                    url: '/deepsearch/functionUsing/getFTForUser', data: {"id": $scope.username.id},
                    dataType: 'json',
                    method: 'GET',
                    success: function (data) {
                        count =  data.data.count;
                    }
                })
                return  count;
           /*     $http({
                    method: 'GET',
                    // url:'/deepsearch/registered',
                    url:'/deepsearch/functionUsing/getFTForUser', params:{"id":  $scope.username.id},
                }).success(function (data) {
                    return data.data.count;
                });*/
            }

    var   getQueryString = function(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        // var r = window.location.search.substr(1).match(reg);
        var r = decodeURI(decodeURI(window.location.search.substr(1))).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    var urlParams = getQueryString("name");
    if(urlParams) {
        $scope.xialakuang.searchWordsXialakuang =urlParams;
        // $scope.searchZhanxian();
    }

    }]


    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])