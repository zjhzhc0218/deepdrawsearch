var app=angular.module('sign',['Encrypt']);
app.controller('signController',['$scope','$http', 'Md5','Base64','Sha1', function ($scope,$http,Md5,Base64,Sha1) {
    $scope.name = null;
    $scope.password = null;

    
    //登陆
    $scope.sign = function () {

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

            $http({
                method:'GET',
                url:'/deepsearch/login/userLogin',
                params:{
                    'id':$scope.name,
                    'password':$scope.password
                }
            }).success(function (data) {
                console.log(data);
                if(data.code !=0) {
                    spop({
                        template: '<strong>' + data.msg +
                        '</strong>',
                        autoclose: 3000,
                        style: 'error'
                    });
                    return;
                }
                var url='/deepsearch/searchIndex';
                // var url='/deepsearch/changeName';
                location.href = url;
            }).error(function (data) {
                spop({template: '<strong>' +data.msg+
                '</strong>',
                    autoclose: 3000,
                    style:'error'
                });
            });

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

