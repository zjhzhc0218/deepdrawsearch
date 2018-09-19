var app=angular.module('login',[])
    .controller('loginController', function ($scope,$http) {
        $scope.name = null;
        $scope.password = null;

        //登陆
        $scope.login = function () {
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
                    alert("成功了"+data);
                }).error(function (data) {
                    alert("失败了");
                });
            }else {
                alert('填写信息有误');
            }
        }
    })

