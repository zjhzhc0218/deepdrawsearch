var app=angular.module('signup',['Encrypt']);
        app.controller('signupController',['$scope','$http', 'Md5','Base64','Sha1', function ($scope,$http,Md5,Base64,Sha1) {
            $scope.name = null;
            $scope.password = null;
            $scope.passwordAgain1 = null;

            //修改密码
            $scope.forgot = function () {
                if ($scope.name != null && $scope.password !=null && $scope.passwordAgain1 == $scope.passwordAgain2){
                    console.log('ok');
                    $http({
                        method:'GET',
                        url:'http://127.0.0.1:8080/forgot',
                        params:{
                            'name':$scope.name,
                            'password':Md5.hex_md5($scope.password),
                            'passwordagain':Md5.hex_md5($scope.passwordAgain1)
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

