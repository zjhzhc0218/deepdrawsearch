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
    var init = function() {
            if($scope.username!=null&& $scope.username.grade == 2) {
                $('#tixing').modal('show');
            }
    }
            // window.location.href = changeURLArg(window.location.href,'name',123)

    var updateGrage = function () {
        if($scope.username.grade != 2){
            return;
        }
        $http({
            method: 'GET',
            url: '/deepsearch/User/selectGrade',
            params: {
                'id': $scope.username.id
            }
        }).then(function successCallback(info) {
            $scope.username = angular.fromJson(info.data.data.shUser);
        },function errorCallback(info) {
        })
        
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
        /*判断权限是否改变*/
        updateGrage();
        //判断是否注册
        var fCount = getFTForUser();
        if($scope.username.grade == 2) {
            $('#tixing').modal('show');
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
                var resultWjc = angular.fromJson(info.data.data.replace(/'/g, '"'));
             /*   if (resultWjc.indexOf('small') !=-1) {
                    $scope.app.hasNoViolation = false;
                    $scope.app.examedContext =  resultWjc;
                }else {
                    $scope.app.hasNoViolation = true;
                    $scope.app.examedContext ="<span style='color: green;font-size: 22px' >恭喜你，没有发现任何禁用词／敏感词！</span>";
                }*/
                $scope.app.examedContext =resultWjc.data;
                // $scope.app.hideDetail = true;
                // $scope.app.working = false;
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
         /*判断权限是否改变*/
         updateGrage();
         //判断是否注册
         var fCount = getFTForUser();
         if($scope.username.grade == 2) {
             $('#tixing').modal('show');
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
                 $scope.xinYu.hasNoViolation == true;
                 $scope.$apply();
                 clearInterval(interval);
             }
         }, 950);

         $scope.xinYu.examedContext = null;
         $scope.xinYu.hasNoViolation = false;
         $scope.xinYu.working = true;
         $scope.xinYu.msg = null;
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
                $scope.xinYu.msg = info.data.msg;
                $scope.xinYu.hasNoViolation = true;
            }else if(info.data.code == 0){
                var result = info.data.data;
                var rec = angular.fromJson(result.replace(/'/g, '"'));
                var list = [];
                var userNode = {
                }
                for (var d in rec) {
                    var c = rec[d].split('~');
                    var node ={
                        'name' :d,
                        'id' :parseInt(c[0]),
                        'value' :c[1],
                    };
                    if (node.id ==1) {
                        userNode.value = c[1];
                    }
                    if (node.id ==2) {
                        userNode.addr = c[1];
                    }
                    if (node.id ==3) {
                        userNode.pic = c[1];
                    }

                    if(node.id!=3&&node.id!=2&&node.id!=1) {
                        list.push(node);
                    }
                }
                userNode.id = 1;
                userNode.name = '淘宝买家';
                list.push(userNode);
                var dList = $filter('orderBy')( list ,'id');
                $scope.xinYu.examedContext = dList;
            }
             xyvm.value = 100;
             clearInterval(interval);
             $scope.xinYu.working = false;
         },function errorCallback(info) {
             // alert("失败了");
             $scope.xinYu.working = false;
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
        /*判断权限是否改变*/
        updateGrage();
        //判断是否注册
        var fCount = getFTForUser();
        if($scope.username.grade == 2) {
            $('#tixing').modal('show');
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
        }, 450);

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
                // if($scope.jiangquan.isNormal==1){
                //     $scope.jiangquan.msg = "很抱歉！检测到您店铺宝贝有被降权。请选择上方异常按钮点击查询。";
                // }else{
                    $scope.jiangquan.msg = info.data.msg;
                // }
            }else if(info.data.code == 0){
                var result = info.data.data;
                var rec = angular.fromJson(result.replace(/'/g, '"'));
                $scope.jiangquan.examedContext = [];
                for (var d in rec) {
                    if(rec[d] == undefined) {
                        return;
                    }
                    var li = [];
                    var href_jq = null;
                    for (var n in rec[d]) {
                        var c = rec[d][n].split('~');
                        if(n=='a_href'){
                            href_jq = c[1];
                            break;
                        }
                    }
                    for (var n in rec[d]) {
                        if(rec[d][n] == undefined) {
                            return;
                        }
                        var c = rec[d][n].split('~');
                        var node ={
                            'id' :parseInt(c[0]),
                            'name' :n,
                            'href' : href_jq,
                            'value' :c[1]
                        };
                        if(n!='a_href'){
                            li.push(node);
                        }
                    }
                    $scope.jiangquan.examedContext.push(li);
                }

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
        /*判断权限是否改变*/
        updateGrage();
        //判断是否注册
        var fCount = getFTForUser();
        if($scope.username.grade == 2) {
            $('#tixing').modal('show');
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
        str = str.match(/id=(\d*)/);
        if (str) {
            $scope.bbPaiMing.tbaoId = str[1];
        }
        var reg = /^[0-9]+.?[0-9]*$/;
        if (!reg.test($scope.bbPaiMing.tbaoId)) {
            spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
        /* $("#pmrs").mLoading({
             text:"查询中"
         });*/
        vm.value = 0;
        var interval = setInterval(function(){
            vm.value++;
            $scope.$apply();
            if (vm.value == 100) {
                $scope.bbPaiMing.msg = "亲，您的宝贝在前100页没有展现，继续加油哦！";
                $scope.bbPaiMing.working = false;
                $scope.$apply();
                clearInterval(interval);
            }
        }, 600);
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
                    $scope.bbPaiMing.msg = "亲，您的宝贝在前100页没有展现，继续加油哦！";//info.data.msg;
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
  /*  $scope.freeSearchPaim = function () {

        if ($scope.bbPaiMing.keyWords == null || $scope.bbPaiMing.tbaoId == null) {
            spop({template: '<strong>请输入查询字符!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
      /!*  $("#pmrs").mLoading({
            text:"查询中"
        });*!/
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
    }*/
     //########################宝贝排名查询###############################//

     //########################热词查询###############################//

    $scope.toggleTable = function (id) {
            $('#'+id).toggle();
    };

    $scope.reciRecord = function(url) {
        if ($scope.username == null){
            $('#myModal').modal('show');
            return;
        }

        /*
        //判断是否注册
        var fCount = getFTForUser();
        if($scope.username.grade == 2) {
            $('#tixing').modal('show');
            return;
        }*/ else  {
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



     //########################动态评分查询###############################//
            $scope.dtPingFeng = {
                searchWordsXy : null,//查询
                working : false,
                hasNoViolation : false,
                examedContext : null
            };
            var dtpfvm = $scope.dtPingFeng.vm = {};
            dtpfvm.value = 0;
            dtpfvm.style = 'progress-bar-info';
            dtpfvm.showLabel = true;
            dtpfvm.striped = true;
            $scope.searchPingfeng = function () {
                if ($scope.username == null){
                    $('#myModal').modal('show');
                    return;
                }
                /*判断权限是否改变*/
                updateGrage();
                //判断是否注册
                var fCount = getFTForUser();
                if($scope.username.grade == 2) {
                    $('#tixing').modal('show');
                    return;
                }
                if( $scope.dtPingFeng.searchWordsXy == null) {
                    spop({template: '<strong>请输入查询字符!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                dtpfvm.value = 0;
                var interval = setInterval(function(){
                    dtpfvm.value++;
                    $scope.$apply();
                    if (dtpfvm.value == 100) {
                        $scope.dtPingFeng.msg = "查询超时！请重新查询";
                        $scope.dtPingFeng.working = false;
                        $scope.dtPingFeng.hasNoViolation == true;
                        $scope.$apply();
                        clearInterval(interval);
                    }
                }, 250);

                $scope.dtPingFeng.examedContext = null;
                $scope.dtPingFeng.hasNoViolation = false;
                $scope.dtPingFeng.working = true;
                $scope.dtPingFeng.msg = null;
                $http({
                    method:'get',
                    url:'/deepsearch/searchPingfeng', params:{"searchWords": $scope.dtPingFeng.searchWordsXy},
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
                        $scope.dtPingFeng.msg = info.data.msg;
                        $scope.dtPingFeng.hasNoViolation = true;
                    }else if(info.data.code == 0){
                        var result = info.data.data;
                        var rec = angular.fromJson(result.replace(/'/g, '"'));
                        var list = [];
                        for (var d in rec) {
                            var c = rec[d].split('~');
                            var node ={
                                'name' :d,
                                'id' :parseInt(c[0]),
                                'value' :c[1],
                            };
                            list.push(node);
                        }
                        var dList = $filter('orderBy')( list ,'id');
                        $scope.dtPingFeng.examedContext = dList;
                    }
                    dtpfvm.value = 100;
                    clearInterval(interval);
                    $scope.dtPingFeng.working = false;
                },function errorCallback(info) {
                    // alert("失败了");
                    $scope.dtPingFeng.working = false;
                    dtpfvm.value = 100;
                    clearInterval(interval);
                })
            }


     //########################动态评分查询end###############################//

        //########################目录查询###############################//
        $scope.searchWordsMulu = null;//查询
        $scope.mulu = {
            hasNoViolation : false,
            working : false,
            hideDetail : false,
            hasAbsolutedWord : false,
            examedContext : null
        };
        var muluvm = $scope.mulu.vm = {};
            muluvm.value = 0;
            muluvm.style = 'progress-bar-info';
            muluvm.showLabel = true;
            muluvm.striped = true;
        $scope.searchMulu = function () {

            if ($scope.username == null){
                $('#myModal').modal('show');
                return;
            }
            /*判断权限是否改变*/
            updateGrage();
            //判断是否注册
            var fCount = getFTForUser();
            if($scope.username.grade == 2) {
                $('#tixing').modal('show');
                return;
            }
            if( $scope.searchWordsMulu == null) {
                spop({template: '<strong>请输入查询字符!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
            var str = angular.copy($scope.searchWordsMulu);
            str = str.match(/id=(\d*)/);
            if (str) {
                $scope.searchWordsMulu = str[1];
            }
            var reg = /^[0-9]+.?[0-9]*$/;
            if (!reg.test($scope.searchWordsMulu)) {
                spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }

            /*  $("#wjcrs").mLoading({
             text:"查询中"
             });*/
            muluvm.value = 0;
            $scope.mulu.examedContext = null;
            $scope.mulu.msg = null;
            $scope.mulu.hasNoViolation = false;
            var interval = setInterval(function(){
                muluvm.value++;
                $scope.$apply();
                if (muluvm.value == 100) {
                    $scope.mulu.msg = "查询超时！请重新查询";
                    $scope.mulu.working = false;
                    $scope.mulu.hasNoViolation == true;
                    $scope.$apply();
                    clearInterval(interval);
                }
            }, 240);
            $scope.mulu.working = true;
            $http({
                method:'get',
                url:'/deepsearch/getSearchMulu', params:{"searchWords": $scope.searchWordsMulu},
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
                    $scope.mulu.msg = info.data.msg;
                    $scope.mulu.hasNoViolation = true;
                }else if(info.data.code == 0){
                    $scope.mulu.examedContext = info.data.data;
                    $scope.mulu.hideDetail = true;
                    $scope.mulu.working = false;
                    muluvm.value = 100;
                    clearInterval(interval);
                }
            },function errorCallback(info) {
                $scope.mulu.working = false;
                appvm.value = 100;
                clearInterval(interval);
                // $("#wjcrs").mLoading("hide");
                // alert("失败了");
            })
        }

       /* $scope.hideDetail = function () {
            $scope.mulu.hideDetail = false;
        }*/
        //########################目录查询###############################//

        //########################指数查询###############################//
            $scope.zhishu = {
                type : 'jyzs',
                searchWordsXy : null,//查询
                working : false,
                hasNoViolation : false,
                examedContext : null
            };

            $scope.searchZhishu = function () {
                if ($scope.username == null){
                    $('#myModal').modal('show');
                    return;
                }
                /*判断权限是否改变*/
                updateGrage();
                //判断是否注册
                var fCount = getFTForUser();
                if($scope.username.grade == 2) {
                    $('#tixing').modal('show');
                    return;
                }
                if( $scope.zhishu.searchWordsXy == null) {
                    spop({template: '<strong>请输入查询字符!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                $scope.zhishu.working = true;
                var str = $scope.zhishu.searchWordsXy;
                var temp = str.split(/[\n,]/g);
              /*  for(var i =0;i<temp.length;i++){
                    if(temp[i] == ""){
                        temp.splice(i, 1);
                        //删除数组索引位置应保持不变
                        i--;
                    }
                }*/
                console.log(temp);

                /*    zhishuvm.value = 0;
var reg = /^[0-9]+.?[0-9]*$/;
     if (!reg.test($scope.zhishu.searchWordsXy)) {
         spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
             autoclose: 3000,
             style:'error'
         });
         return;
     }
     var interval = setInterval(function(){
         zhishuvm.value++;
         $scope.$apply();
         if (zhishuvm.value == 100) {
             $scope.zhishu.msg = "查询超时！请重新查询";
             $scope.zhishu.working = false;
             $scope.zhishu.hasNoViolation == true;
             $scope.$apply();
             clearInterval(interval);
         }
     }, 250);*/

         $http({
             method:'get',
             url:'/deepsearch/searchZhishu', params:{"searchWords": temp.toString(),"type": $scope.zhishu.type},
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
                 $scope.zhishu.msg = info.data.msg;
                 // $scope.zhishu.hasNoViolation = true;
             }else if(info.data.code == 0){
                 var str = info.data.data.replace(/'/g, '"');
                 var listZs= angular.fromJson(str);
                 $scope.zhishu.examedContext= "";
                 for (var i = 0; i < listZs.length; i++) {
                     $scope.zhishu.examedContext += listZs[i]  + '\n';
                 }
             }
             $scope.zhishu.working = false;
         },function errorCallback(info) {
             // alert("失败了");
             $scope.zhishu.working = false;
         })
        }

            $scope.checkZhiShu = function(type) {
                $scope.zhishu = {
                    type : type,
                    searchWordsXy : null,//查询
                    working : false,
                    hasNoViolation : false,
                    examedContext : null
                };
            }

            //########################指数查询end###############################//


            //########################上下架查询###############################//
            $scope.shangxiajia = {
                searchWordsShangxiajia : null,//查询
                working : false,
                hasNoViolation : false,
                examedContext : null
            };
            var sxjvm = $scope.shangxiajia.vm = {};
            sxjvm.value = 0;
            sxjvm.style = 'progress-bar-info';
            sxjvm.showLabel = true;
            sxjvm.striped = true;
            $scope.searchShangxiajia = function () {
                if ($scope.username == null){
                    $('#myModal').modal('show');
                    return;
                }
                /*判断权限是否改变*/
                updateGrage();
                //判断是否注册
                var fCount = getFTForUser();
                if($scope.username.grade == 2) {
                    $('#tixing').modal('show');
                    return;
                }
                if( $scope.shangxiajia.searchWordsShangxiajia == null) {
                    spop({template: '<strong>请输入查询字符!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                sxjvm.value = 0;
                var interval = setInterval(function(){
                    sxjvm.value++;
                    $scope.$apply();
                    if (sxjvm.value == 100) {
                        $scope.shangxiajia.msg = "查询超时！请重新查询";
                        $scope.shangxiajia.working = false;
                        $scope.shangxiajia.hasNoViolation == true;
                        $scope.$apply();
                        clearInterval(interval);
                    }
                }, 250);

                $scope.shangxiajia.examedContext = null;
                $scope.shangxiajia.hasNoViolation = false;
                $scope.shangxiajia.working = true;
                $scope.shangxiajia.msg = null;
                $http({
                    method:'get',
                    url:'/deepsearch/getSearchShangxiajia', params:{"searchWords": $scope.shangxiajia.searchWordsShangxiajia},
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
                        $scope.shangxiajia.msg = info.data.msg;
                        $scope.shangxiajia.hasNoViolation = true;
                    }else if(info.data.code == 0){
                        var result = info.data.data;
                        var rec = angular.fromJson(result.replace(/'/g, '"'));
                        var list = [];
                        for (var d in rec) {
                            var c = rec[d].split('~');
                            var node ={
                                'name' :d,
                                'id' :parseInt(c[0]),
                                'value' :c[1],
                            };
                            list.push(node);
                        }
                        var dList = $filter('orderBy')( list ,'id');
                        $scope.shangxiajia.examedContext = dList;
                    }
                    sxjvm.value = 100;
                    clearInterval(interval);
                    $scope.shangxiajia.working = false;
                },function errorCallback(info) {
                    // alert("失败了");
                    $scope.shangxiajia.working = false;
                    sxjvm.value = 100;
                    clearInterval(interval);
                })
            }

            //########################上下架查询###############################//

            //########################下拉框选词开始###############################//
            $scope.xialakuang = {
                searchWordsXialakuang : null,//查询
                working : false,
                hasNoViolation : false,
                examedContext : null
            };
            var xlkvm = $scope.xialakuang.vm = {};
            xlkvm.value = 0;
            xlkvm.style = 'progress-bar-info';
            xlkvm.showLabel = true;
            xlkvm.striped = true;
            $scope.searchXialakuang = function () {
                if ($scope.username == null){
                    $('#myModal').modal('show');
                    return;
                }
                /*判断权限是否改变*/
                updateGrage();
                //判断是否注册
                var fCount = getFTForUser();
                if($scope.username.grade == 2) {
                    $('#tixing').modal('show');
                    return;
                }
                if( $scope.xialakuang.searchWordsXialakuang == null) {
                    spop({template: '<strong>请输入查询字符!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                xlkvm.value = 0;
                var interval = setInterval(function(){
                    xlkvm.value++;
                    $scope.$apply();
                    if (xlkvm.value == 100) {
                        $scope.xialakuang.msg = "查询超时！请重新查询";
                        $scope.xialakuang.working = false;
                        $scope.xialakuang.hasNoViolation == true;
                        $scope.$apply();
                        clearInterval(interval);
                    }
                }, 250);

                $scope.xialakuang.examedContext = null;
                $scope.xialakuang.hasNoViolation = false;
                $scope.xialakuang.working = true;
                $scope.xialakuang.msg = null;
                $http({
                    method:'get',
                    url:'/deepsearch/getSearchXialakuangxuanci', params:{"searchWords": $scope.xialakuang.searchWordsXialakuang},
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
                        $scope.xialakuang.msg = info.data.msg;
                        $scope.xialakuang.hasNoViolation = true;
                    }else if(info.data.code == 0){
                        var result = info.data.data;
                        var rec = angular.fromJson(result.replace(/'/g, '"'));
                        var list = [];
                        for (var d in rec) {
                            if(rec[d]==undefined){
                                return;
                            }
                            // var list = [];
                            for(var n in rec[d]){
                                if(rec[d][n] == undefined){
                                    return;
                                }
                                var node ={
                                    'name' :rec[d][n][0],
                                    'num' :parseInt(rec[d][n][1]),
                                    'weizhi' :parseInt(rec[d][n][2]),
                                    'bili' :parseInt(rec[d][n][3]),
                                };
                               list.push(node);
                            }
                        }
                        // var dList = $filter('orderBy')( list ,'id');
                        $scope.xialakuang.examedContext=list;
                    }
                    xlkvm.value = 100;
                    clearInterval(interval);
                    $scope.xialakuang.working = false;
                },function errorCallback(info) {
                    // alert("失败了");
                    $scope.xialakuang.working = false;
                    xlkvm.value = 100;
                    clearInterval(interval);
                })
            }

            //########################下拉框选词结束###############################//

            //########################展现查询###############################//
            $scope.zhanxian = {
                searchWordsXy : null,//查询
                working : false,
                hasNoViolation : false,
                examedContext : null
            };
            var zhanxianvm = $scope.zhanxian.vm = {};
            zhanxianvm.value = 0;
            zhanxianvm.style = 'progress-bar-info';
            zhanxianvm.showLabel = true;
            zhanxianvm.striped = true;
            $scope.searchZhanxian = function () {
                if ($scope.username == null){
                    $('#myModal').modal('show');
                    return;
                }
                /*判断权限是否改变*/
                updateGrage();
                //判断是否注册
                var fCount = getFTForUser();
                if($scope.username.grade == 2) {
                    $('#tixing').modal('show');
                    return;
                }
                if( $scope.zhanxian.searchWordsXy == null) {
                    spop({template: '<strong>请输入查询字符!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                var str = angular.copy($scope.zhanxian.searchWordsXy);
                str = str.match(/id=(\d*)/);
                if (str) {
                    $scope.zhanxian.searchWordsXy = str[1];
                }
                var reg = /^[0-9]+.?[0-9]*$/;
                if (!reg.test($scope.zhanxian.searchWordsXy)) {
                    spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                /* var reg = /^[0-9]+.?[0-9]*$/;
                 if (!reg.test($scope.zhanxian.searchWordsXy)) {
                     spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
                         autoclose: 3000,
                         style:'error'
                     });
                     return;
                 }*/

                zhanxianvm.value = 0;
                var interval = setInterval(function(){
                    zhanxianvm.value++;
                    $scope.$apply();
                    if (zhishuvm.value == 100) {
                        $scope.zhanxian.msg = "查询超时！请重新查询";
                        $scope.zhanxian.working = false;
                        $scope.zhanxian.hasNoViolation == true;
                        $scope.$apply();
                        clearInterval(interval);
                    }
                }, 400);

                $scope.zhanxian.examedContext = null;
                $scope.zhanxian.hasNoViolation = false;
                $scope.zhanxian.working = true;
                $scope.zhanxian.msg = null;
                $http({
                    method:'get',
                    url:'/deepsearch/searchZhanXian', params:{"searchWords": $scope.zhanxian.searchWordsXy},
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
                        $scope.zhanxian.msg = info.data.msg;
                        $scope.zhanxian.hasNoViolation = true;
                    }else if(info.data.code == 0){
                        $scope.zhanxian.examedContext = angular.fromJson( info.data.data.replace(/'/g, '"'));
                    }
                    zhanxianvm.value = 100;
                    clearInterval(interval);
                    $scope.zhanxian.working = false;
                },function errorCallback(info) {
                    // alert("失败了");
                    $scope.zhanxian.working = false;
                    zhanxianvm.value = 100;
                    clearInterval(interval);
                })
            }

            //########################展现查询end###############################//



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
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    var urlParams = getQueryString("name");
    if(urlParams) {
        $scope.zhanxian.searchWordsXy =window.location.search.substr(1);
        // $scope.searchZhanxian();
    }
            init();
    }]


    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])