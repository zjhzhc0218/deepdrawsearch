var app=angular.module('sign',['Encrypt']);
app.controller('signController',['$scope','$http', 'Md5','Base64','Sha1', function ($scope,$http,Md5,Base64,Sha1) {
    $scope.name = null;
    $scope.password = null;

    //登陆
    $scope.sign = function () {
        if ($scope.name != null && $scope.password !=null){
            console.log('ok');
            $http({
                method:'GET',
                // url:'http://127.0.0.1:8080/passwordToLogin',
                url:'http://127.0.0.1:8080/login/userLogin',
                params:{
                    // 'name':$scope.name,
                    'id':$scope.name,
                    'password':$scope.password
                }
            }).success(function (data) {
                console.log(data);
            //     $http({
            //         method: 'GET',
            //         url: 'http://127.0.0.1:8080/getSessionUser'
            //     }).success(function (data) {
            //         console.log(data);
            //         alert(data.data.name);
            //     }).error(function (data) {
            //         alert("获取失败了");
            // });

                var url='http://127.0.0.1:8080/searchIndex';
                location.href = url;
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

