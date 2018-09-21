var app=angular.module('signup',[]);
        app.controller('signupController',['$scope','$http', function ($scope,$http) {
            $scope.name = null;
            $scope.password = null;


            //生成验证码
            $scope.changeVerify=function () {//定义了一个点击事件，获取验证码
                var authCode="";
                var authCodeLength=4;//取几个随机数字
                var randomArray=[0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z'];
                for(var i=0;i<authCodeLength;i++){
                    var index=Math.floor(Math.random()*36);//随机取一位数
                    authCode +=randomArray[index];//取四位数，并+相连
                }
                $scope.showAuthCode=authCode;//赋值
                console.log($scope.showAuthCode);
            };


            //注册
            $scope.registered = function () {
                if ($scope.name != null && $scope.password !=null){
                    console.log('ok');
                    $http({
                        method:'GET',
                        url:'http://127.0.0.1:8080/registered',
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

            //跳转到登录页面
            $scope.openSign = function () {
                var url='http://127.0.0.1:8080/sign';
                location.href = url;
            }

        }]);

