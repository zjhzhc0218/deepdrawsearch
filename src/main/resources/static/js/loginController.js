var app=angular.module('login',[])
    .controller('loginController',['$scope', function ($scope) {
        $scope.name = null;
        $scope.password = null;

        //登陆
        $scope.login = function () {
            if ($scope.name != null && $scope.password !=null){
                console.log('ok');
                $http({
                    method:'get',
                    url:'http://127.0.0.1:8080/passwordToLogin'
                }).then(function successCallback(response) {
                    alert('成功了');
                },function errorCallback(response) {
                    alert("失败了");
                })
            }else {
                alert('填写信息有误');
            }
        }
    }])

