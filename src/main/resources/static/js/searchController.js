var app=angular.module('search',[])
    .controller('searchController',['$scope','$http', function ($scope,$http) {

    $scope.username ="测试人员";
    $scope.searchWords = null;

    //查询
    $scope.searchWjc = function () {
        if( $scope.searchWords == null) {
            alert("请输入查询字符");
            return;
        }
        $http({
            method:'get',
            url:'/getSearchWjc', params:{"searchWords": $scope.searchWords},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            transformRequest: function ( data ) {
                var str = '';
                for( var i in data ) {
                    str += i + '=' + data[i] + '&';
                }
            }}
            ).then(function successCallback(info) {
            alert('成功了');
        },function errorCallback(info) {
            alert("失败了");
        })


    }











    }]);
