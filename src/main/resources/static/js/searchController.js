var app=angular.module('search',[])
    .controller('searchController',['$scope','$http','$sce', function ($scope,$http,$sce) {

    /**
     * 登陆信息
     * @type {string}
     */
    $scope.username ="测试人员";

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
            if( $scope.searchWordsWjc == null) {
                alert("请输入查询字符");
                return;
            }
            $scope.app.working = true;
            $http({
                method:'get',
                url:'/getSearchWjc', params:{"searchWords": $scope.searchWordsWjc},
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
                    // $scope.$apply();
                    // resultWjc.contextWords;
                }
            },function errorCallback(info) {
                $scope.app.working = false;
                alert("失败了");
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
         if( $scope.xinYu.searchWordsXy == null) {
             alert("请输入查询字符");
             return;
         }
         $scope.xinYu.examedContext = null;
         $scope.xinYu.hasNoViolation = false;
         $scope.xinYu.working = true;
         $http({
             method:'get',
             url:'/getSearchXinyu', params:{"searchWords": $scope.xinYu.searchWordsXy},
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
             $scope.xinYu.working = false;
         },function errorCallback(info) {
             alert("失败了");
             $scope.xinYu.working = false;
         })
     }
     //########################信誉查询###############################//













    }]


    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])