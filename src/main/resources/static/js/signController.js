var app=angular.module('sign',['Encrypt']);
app.controller('signController',['$scope','$http', '$document','Md5','Base64','Sha1', function ($scope,$http,$document,Md5,Base64,Sha1) {
    $scope.name = null;
    $scope.password = null;

    $document.bind("keypress", function(event) {
        if(event.keyCode == 13){
            $scope.sign();
        }

    });


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
        // var namereg = /^[1][0-9]{2,11}$/;
        var namereg = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
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
        // var passwordreg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{8,25}$/;
        if(!($scope.password.length>=6 && $scope.password.length<=25)){
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
                // var url='/deepsearch/searchIndex?ON=O';
                var url='/deepsearch/index?ON=O';
                // var url='/deepsearch/changeName';
                //登陆成功出现缓冲遮罩
                var index = layer.load(1, {
                    shade: [0.5,'#fff'] //0.1透明度的白色背景
                });
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

