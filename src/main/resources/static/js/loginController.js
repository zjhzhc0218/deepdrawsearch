var app=angular.module('login',[])
    .controller('loginController',['$scope', function ($scope) {
        $scope.name = null;
        $scope.password = null;

        //登陆
        $scope.login = function () {
            if ($scope.name != null && $scope.password !=null){
                console.log('ok');
            }else {
                alert('填写信息有误');
            }
        }








    }])
