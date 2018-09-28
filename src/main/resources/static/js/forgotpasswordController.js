var app=angular.module('signup',['Encrypt']);
        app.controller('signupController',['$scope','$http', 'Md5','Base64','Sha1', function ($scope,$http,Md5,Base64,Sha1) {
            $scope.name = null;
            $scope.password = null;
            $scope.passwordAgain1 = null;

            //修改密码
            $scope.forgot = function () {

                if($scope.name == null){
                    spop({template: '<strong>请输入手机号!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                if($scope.name.length !=11){
                    spop({template: '<strong>手机号长度未满或者超出11位!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                var namereg = /^[1][0-9]{2,11}$/;
                if(!namereg.test($scope.name)){
                    spop({template: '<strong>手机号格式不对</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                if($scope.password == null){
                    spop({template: '<strong>请输入密码!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                var passwordreg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{8,25}$/;
                if(!passwordreg.test($scope.password)){
                    spop({template: '<strong>密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }


                if($scope.passwordAgain1 == null){
                    spop({template: '<strong>请输入新密码!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                if(!passwordreg.test($scope.passwordAgain1)){
                    spop({template: '<strong>新密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                if($scope.passwordAgain2 == null){
                    spop({template: '<strong>请输入密码!</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }


                if(!passwordreg.test($scope.passwordAgain2)){
                    spop({template: '<strong>第二次输入的新密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }

                if($scope.passwordAgain1!=$scope.passwordAgain2){
                    spop({template: '<strong>二次输入的新密码不一样，请重新输入</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }



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
                        spop({template: '<strong>' +data.msg+
                        '</strong>',
                            autoclose: 3000,
                            style:'success'
                        });
                        return;
                    }).error(function (data) {
                        spop({template: '<strong>' +data.msg+
                        '</strong>',
                            autoclose: 3000,
                            style:'error'
                        });
                        return;
                    });

            }


            //跳转到登录页面
            $scope.openSign = function () {
                var url='/deepsearch/sign';
                location.href = url;
            }

        }]);

