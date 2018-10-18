var app=angular.module('search',[])
    .controller('searchController',['$scope','$http','$sce','$filter', function ($scope,$http,$sce,$filter) {

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
        hideDetail : false,
        hasAbsolutedWord : false,
        examedContext : null
    };
    var appvm = $scope.app.vm = {};
        appvm.value = 0;
        appvm.style = 'progress-bar-info';
        appvm.showLabel = true;
        appvm.striped = true;
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
      /*  $("#wjcrs").mLoading({
            text:"查询中"
        });*/
        appvm.value = 0;
        $scope.app.examedContext = null;
        $scope.app.hasNoViolation = false;
        var interval = setInterval(function(){
            appvm.value++;
            $scope.$apply();
            if (appvm.value == 100) {
                $scope.app.msg = "查询超时！请重新查询";
                $scope.app.working = false;
                $scope.$apply();
                clearInterval(interval);
            }
        }, 90);
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
                
                if (resultWjc.indexOf('small') !=-1) {
                    $scope.app.hasNoViolation = false;
                    $scope.app.examedContext =  resultWjc;
                }else {
                    $scope.app.hasNoViolation = true;
                    $scope.app.examedContext ="<span style='color: green;font-size: 22px' >恭喜你，没有发现任何禁用词／敏感词！</span>";
                }
                $scope.app.hideDetail = true;
                $scope.app.working = false;
                appvm.value = 100;
                clearInterval(interval);
                // $("#wjcrs").mLoading("hide");
                // $scope.$apply();
                // resultWjc.contextWords;
            }
        },function errorCallback(info) {
            $scope.app.working = false;
            appvm.value = 100;
            clearInterval(interval);
            // $("#wjcrs").mLoading("hide");
            // alert("失败了");
        })
        }

        $scope.hideDetail = function () {
            $scope.app.hideDetail = false;
        }
    //########################违禁词###############################//


    //########################信誉查询###############################//
     $scope.xinYu = {
         searchWordsXy : null,//查询
         working : false,
         hasNoViolation : false,
         examedContext : null
     };
    var xyvm = $scope.xinYu.vm = {};
        xyvm.value = 0;
        xyvm.style = 'progress-bar-info';
        xyvm.showLabel = true;
        xyvm.striped = true;
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
        /* $("#xyrs").mLoading({
             text:"查询中"
         });*/
         xyvm.value = 0;
         var interval = setInterval(function(){
             xyvm.value++;
             $scope.$apply();
             if (xyvm.value == 100) {
                 $scope.xinYu.msg = "查询超时！请重新查询";
                 $scope.xinYu.working = false;
                 $scope.$apply();
                 clearInterval(interval);
             }
         }, 150);

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
                        'id' :parseInt(c[0]),
                        'value' :c[1],
                    };
                    if(node.id == 8) {
                        var r = node.value.split(':');
                        node.value = r[0];
                        node.img = r[1];
                    }
                    list.push(node);
                }
                var dList = $filter('orderBy')( list ,'id');
                $scope.xinYu.examedContext = dList;
            }
             // $("#xyrs").mLoading('hide');
             xyvm.value = 100;
             clearInterval(interval);
             $scope.xinYu.working = false;
         },function errorCallback(info) {
             // alert("失败了");
             $scope.xinYu.working = false;
             // $("#xyrs").mLoading('hide');
             xyvm.value = 100;
             clearInterval(interval);
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
    var jqvm = $scope.jiangquan.vm = {};
    jqvm.value = 0;
    jqvm.style = 'progress-bar-info';
    jqvm.showLabel = true;
    jqvm.striped = true;
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
       /* $("#jqrs").mLoading({
            text:"查询中"
        });*/
        jqvm.value = 0;
        var interval = setInterval(function(){
            jqvm.value++;
            $scope.$apply();
            if (jqvm.value == 100) {
                $scope.jiangquan.msg = "查询超时！请重新查询";
                $scope.jiangquan.working = false;
                $scope.$apply();
                clearInterval(interval);
            }
        }, 400);

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
            // $("#jqrs").mLoading("hide");
            jqvm.value = 100;
            clearInterval(interval);
            $scope.jiangquan.working = false;
        },function errorCallback(info) {
            // alert("失败了");
            $scope.jiangquan.working = false;
            jqvm.value = 100;
            // $("#jqrs").mLoading("hide");
            clearInterval(interval);
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

    var vm = $scope.bbPaiMing.vm = {};
        vm.value = 0;
        vm.style = 'progress-bar-info';
        vm.showLabel = true;
        vm.striped = true;
    //查询
    $scope.searchPaiming = function () {
       /* if ($scope.username == null){
            $('#freeSearch').modal('show');
            return;
        }*/
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
        var str = angular.copy($scope.bbPaiMing.tbaoId);
        str = str.match(/id=(\d*)&/);
        if (str) {
            $scope.bbPaiMing.tbaoId = str[1];
        }

        /* $("#pmrs").mLoading({
             text:"查询中"
         });*/
        vm.value = 0;
        var interval = setInterval(function(){
            vm.value++;
            $scope.$apply();
            if (vm.value == 100) {
                $scope.bbPaiMing.msg = "查询超时！请重新查询";
                $scope.bbPaiMing.working = false;
                $scope.$apply();
                clearInterval(interval);
            }
        }, 500);
        $scope.bbPaiMing.msg = null;
        $scope.bbPaiMing.examedContext = null;
        $scope.bbPaiMing.working = true;
      /* $scope.ad_oneTimeout=setTimeout(function(){
            $scope.bbPaiMing.msg = "查询超时！请重新查询";
            $scope.bbPaiMing.working = false;
            $("#pmrs").mLoading("hide");
            $scope.$apply();
        },180000);*/
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
                 vm.value = 100;
                 clearInterval(interval);
                // $("#pmrs").mLoading("hide");
                $scope.bbPaiMing.working = false;
             // clearTimeout($scope.ad_oneTimeout);
         }, function errorCallback(info) {
             // alert("失败了");
             $scope.bbPaiMing.working = false;
             vm.value = 100;
             // $("#pmrs").mLoading("hide");
             clearInterval(interval);
             // clearTimeout($scope.ad_oneTimeout);
            })
        }

    //查询
    $scope.freeSearchPaim = function () {

        if ($scope.bbPaiMing.keyWords == null || $scope.bbPaiMing.tbaoId == null) {
            spop({template: '<strong>请输入查询字符!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
      /*  $("#pmrs").mLoading({
            text:"查询中"
        });*/
        vm.value = 0;
        var interval = setInterval(function(){
            vm.value++;
            $scope.$apply();
            if (vm.value == 100) {
                $scope.bbPaiMing.msg = "查询超时！请重新查询";
                $scope.bbPaiMing.working = false;
                $scope.$apply();
                clearInterval(interval);
            }
        }, 500);
        $scope.bbPaiMing.msg = null;
        $scope.bbPaiMing.examedContext = null;
        $scope.bbPaiMing.working = true;

        var str = angular.copy($scope.bbPaiMing.tbaoId);
        str = str.match(/id=(\d*)&/);
        if (str) {
            $scope.bbPaiMing.tbaoId = str[1];
        }
        $http({
                method: 'get',
                url: '/deepsearch/getFreeSearchPaiming',
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
            vm.value = 100;
            clearInterval(interval);
            $scope.bbPaiMing.working = false;
        }, function errorCallback(info) {
            // alert("失败了");
            $scope.bbPaiMing.working = false;
            vm.value = 100;
            clearInterval(interval);
        })
    }
     //########################宝贝排名查询###############################//

     //########################热词查询###############################//

    $scope.toggleTable = function (id) {
            $('#'+id).toggle();
    };

    $scope.reciRecord = function(url) {
        if ($scope.username == null){
            $('#myModal').modal('show');
            return;
        }else  {
            window.open(url);
        }
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

    $scope.toAdminPage = function () {
        var url='/deepsearch/adminPage';
        location.href = url;
    }

    $scope.jqWords = function (str) {
        $("."+str).toggle();
    }

    

    }]


    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])