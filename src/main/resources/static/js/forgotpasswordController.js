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
                        // url:'http://127.0.0.1:8080/forgot',
                        url:'/deepsearch/login/userForgot',
                        params:{
                            // 'name':$scope.name,
                            'id':$scope.name,
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
                var url='/deepsearch/sign';
                location.href = url;
            }

        }]);

