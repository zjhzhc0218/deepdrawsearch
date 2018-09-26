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
                // url:'/deepsearch/passwordToLogin',
                url:'/deepsearch/login/userLogin',
                params:{
                    // 'name':$scope.name,
                    'id':$scope.name,
                    'password':$scope.password
                }
            }).success(function (data) {
                console.log(data);
            //     $http({
            //         method: 'GET',
            //         url: '/deepsearch/getSessionUser'
            //     }).success(function (data) {
            //         console.log(data);
            //         alert(data.data.name);
            //     }).error(function (data) {
            //         alert("获取失败了");
            // });

                var url='/deepsearch/searchIndex';
                location.href = url;
                alert(data.data);
            }).error(function (data) {
                alert("失败了");
            });
        }else {
            spop({template: '<strong>填写信息有误!</strong>',
                autoclose: 3000,
                style:'error'
               });
        }
    }

    //跳转到注册页面
    $scope.openSignup = function () {
        var url='/deepsearch/signup';
        location.href = url;
    }

    //跳转到修改密码页面
    $scope.forgot = function () {
        var url='/deepsearch/forgotpassword';
        location.href = url;
    }


}]);

