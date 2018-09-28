var app=angular.module('search',[])
    .controller('searchController',['$scope','$http','$sce', function ($scope,$http,$sce) {

    /**
     * 登陆信息
     * @type {string}
     */
    $scope.username = null;
    if (user != '') {
        $scope.username = angular.fromJson(user);
    }


    //########################违禁词###############################//
    $scope.searchWordsWjc = null;//查询
    $scope.app = {
        hasNoViolation : false,
        working : false,
        hideErrors : false,
        hideErrorsDetail : false,
        hasAbsolutedWord : false,
        examedContext : null
    };
    $scope.searchWjc = function () {

        if ($scope.username == null){
            $('#myModal').modal('show');
            return;
        }
        if( $scope.searchWordsWjc == null) {
            spop({template: '<strong>请输入查询字符!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
        $("#wjcrs").mLoading({
            text:"查询中"
        });
        $scope.app.working = true;
        $http({
            method:'get',
            url:'/deepsearch/getSearchWjc', params:{"searchWords": $scope.searchWordsWjc},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function ( data ) {
                var str = '';
                for( var i in data ) {
                    str += i + '=' + data[i] + '&';
                }
            }}
        ).then(function successCallback(info) {
            if(info.data.data) {
                var resultWjc = info.data.data;
                var index = resultWjc.lastIndexOf(':');
                //第一个
                if(resultWjc.substr(index+2,1) =='T') {
                    $scope.app.hasAbsolutedWord = true;
                }else {
                    $scope.app.hasAbsolutedWord = false;
                }
                //第二个
                var index2 = resultWjc.substr(0,resultWjc.lastIndexOf(':')-1).lastIndexOf(':');
                if (resultWjc.substr(index2+2,1) == 'T') {
                    $scope.app.hasNoViolation = true;
                }else {
                    $scope.app.hasNoViolation = false;
                }
                //第三个
                var index3 = resultWjc.substr(resultWjc.indexOf(':')+3);
                var worss = index3.substring(0,index3.indexOf('\', \'hasNoViolation'));
                $scope.app.examedContext =  worss;
                console.log(worss);
                $scope.app.working = false;
                $("#wjcrs").mLoading("hide");
                // $scope.$apply();
                // resultWjc.contextWords;
            }
        },function errorCallback(info) {
            $scope.app.working = false;
            $("#wjcrs").mLoading("hide");
            // alert("失败了");
        })
        }
    //########################违禁词###############################//


    //########################信誉查询###############################//
     $scope.xinYu = {
         searchWordsXy : null,//查询
         working : false,
         hasNoViolation : false,
         examedContext : null
     };

     $scope.searchXinyu = function () {
         if ($scope.username == null){
             $('#myModal').modal('show');
             return;
         }
         if( $scope.xinYu.searchWordsXy == null) {
             spop({template: '<strong>请输入查询字符!</strong>',
                 autoclose: 3000,
                 style:'error'
             });
             return;
         }
         $("#xyrs").mLoading({
             text:"查询中"
         });
         $scope.xinYu.examedContext = null;
         $scope.xinYu.hasNoViolation = false;
         $scope.xinYu.working = true;
         $http({
             method:'get',
             url:'/deepsearch/getSearchXinyu', params:{"searchWords": $scope.xinYu.searchWordsXy},
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
                $scope.xinYu.hasNoViolation = true;
            }else if(info.data.code == 0){
                var result = info.data.data;
                var rec = angular.fromJson(result.replace(/'/g, '"'));
                var list = [];
                for (var d in rec) {
                    var c = rec[d].split('-');
                    var node ={
                        'name' :d,
                        'id' :c[0],
                        'value' :c[1],
                    };
                    list.push(node);
                }
                $scope.xinYu.examedContext = list;
            }
             $("#xyrs").mLoading('hide');
             $scope.xinYu.working = false;
         },function errorCallback(info) {
             // alert("失败了");
             $scope.xinYu.working = false;
             $("#xyrs").mLoading('hide');
         })
     }
     //########################信誉查询###############################//


     //########################降权查询###############################//

    $scope.jiangquan = {
        searchWordsJq : null,//查询
        working : false,
        msg : null,
        isNormal : 0,
        examedContext : null
    };

     //查询
    $scope.searchJiangQuan = function () {
        if ($scope.username == null){
            $('#myModal').modal('show');
            return;
        }
        if( $scope.jiangquan.searchWordsJq == null) {
            spop({template: '<strong>请输入查询字符!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
        $("#jqrs").mLoading({
            text:"查询中"
        });
        $scope.jiangquan.msg = null;
        $scope.jiangquan.examedContext = null;
        $scope.jiangquan.working = true;
        $http({
            method:'get',
            url:'/deepsearch/getSearchJiangQuan', params:{"searchWords": $scope.jiangquan.searchWordsJq,"isNormal":$scope.jiangquan.isNormal},
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
                $scope.jiangquan.msg = info.data.msg;
            }else if(info.data.code == 0){
                var result = info.data.data;
                $scope.jiangquan.examedContext = angular.fromJson(result.replace(/'/g, '"'));
            }
            $("#jqrs").mLoading("hide");
            $scope.jiangquan.working = false;
        },function errorCallback(info) {
            // alert("失败了");
            $scope.jiangquan.working = false;
            $("#jqrs").mLoading("hide");
        })
    };

     //########################降权查询###############################//


     //########################宝贝排名查询###############################//

    $scope.bbPaiMing = {
        keyWords : null,//查询
        tbaoId : null,//查询
        working : false,
        msg : null,
        examedContext : null
    };
        //查询
        $scope.searchPaiming = function () {
            if ($scope.username == null){
                $('#myModal').modal('show');
                return;
            }
            if ($scope.bbPaiMing.keyWords == null || $scope.bbPaiMing.tbaoId == null) {
                spop({template: '<strong>请输入查询字符!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
            $("#pmrs").mLoading({
                text:"查询中"
            });
            $scope.bbPaiMing.msg = null;
            $scope.bbPaiMing.examedContext = null;
            $scope.bbPaiMing.working = true;
            $scope.ad_oneTimeout=setTimeout(function(){
                $scope.bbPaiMing.msg = "查询超时！请重新查询";
                $scope.bbPaiMing.working = false;
                $scope.$apply();
            },180000);
         $http({
                    method: 'get',
                    url: '/deepsearch/getSearchPaiming',
                    params: {"keyWords": $scope.bbPaiMing.keyWords, "tbaoId": $scope.bbPaiMing.tbaoId},
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    transformRequest: function (data) {
                        var str = '';
                        for (var i in data) {
                            str += i + '=' + data[i] + '&';
                        }
                    }
                }
            ).then(function successCallback(info) {
                if (info.data.code == 1) {
                    // alert(info.data.msg);
                    $scope.bbPaiMing.msg = info.data.msg;
                } else if (info.data.code == 0) {
                    var result = info.data.data;
                    $scope.bbPaiMing.examedContext = angular.fromJson(result.replace(/'/g, '"'));
                }
                $("#pmrs").mLoading("hide");
                $scope.bbPaiMing.working = false;
             clearTimeout($scope.ad_oneTimeout);
         }, function errorCallback(info) {
             // alert("失败了");
             $scope.bbPaiMing.working = false;
             $("#pmrs").mLoading("hide");
             clearTimeout($scope.ad_oneTimeout);
            })
        }

     //########################宝贝排名查询###############################//

     //########################热词查询###############################//

    $scope.toggleTable = function (id) {
            $('#'+id).toggle();
    };

    $scope.reciRecord = function() {
        $http({
                method: 'get',
                url: '/deepsearch/setReciRecord',
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

     //########################热词查询###############################//
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





    }]


    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])