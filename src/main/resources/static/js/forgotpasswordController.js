var app=angular.module('signup',[]);
        app.controller('signupController',['$scope','$http', function ($scope,$http) {
            $scope.name = null;
            $scope.password = null;
            $scope.passwordAgain1 = null;

            //登陆
            $scope.forgot = function () {
                if ($scope.name != null && $scope.password !=null && $scope.passwordAgain1 == $scope.passwordAgain2){
                    console.log('ok');
                    $http({
                        method:'GET',
                        url:'http://127.0.0.1:8080/forgot',
                        params:{
                            'name':$scope.name,
                            'password':$scope.password,
                            'passwordagain':$scope.passwordAgain1
                        }
                    }).success(function (data) {
                        console.log(data);
                        alert(data.data);
                    }).error(function (data) {
                        alert("失败了");
                    });
                }else {
                    alert('填写信息有误，或者二次输入密码不符合，请重新输入');
                }
            }


            //跳转到登录页面
            $scope.openSign = function () {
                var url='http://127.0.0.1:8080/sign';
                location.href = url;
            }

        }]);

