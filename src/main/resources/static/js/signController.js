var app=angular.module('sign',[]);
app.controller('signController',['$scope','$http', function ($scope,$http) {
    $scope.name = null;
    $scope.password = null;

    //登陆
    $scope.sign = function () {
        if ($scope.name != null && $scope.password !=null){
            console.log('ok');
            $http({
                method:'GET',
                url:'http://127.0.0.1:8080/passwordToLogin',
                params:{
                    'name':$scope.name,
                    'password':$scope.password
                }
            }).success(function (data) {
                console.log(data);
                alert(data.data);
            }).error(function (data) {
                alert("失败了");
            });
        }else {
            alert('填写信息有误');
        }
    }

    //跳转到注册页面
    $scope.openSignup = function () {
        var url='http://127.0.0.1:8080/signup';
        location.href = url;
    }

    //跳转到修改密码页面
    $scope.forgot = function () {
        var url='http://127.0.0.1:8080/forgotpassword';
        location.href = url;
    }


}]);

