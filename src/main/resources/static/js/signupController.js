var app = angular.module('signup', ['Encrypt']);
app.controller('signupController', ['$scope', '$http','$interval' ,'$document', function ($scope, $http,$interval,$document) {
    $scope.name = null;
    $scope.password = null;
    $scope.tisiyu = null;

    $document.bind("keypress", function(event) {

        if(event.keyCode == 13){
            $scope.sign();
        }
    });

    //控制按钮是否可以再按
    $scope.selected = 1;

    $scope.over = function () {

            $('#codeUrl').hide();

    };

    $scope.down = function () {
            $('#codeUrl').show();

    };

    //控制倒计时
    var countDown = 0;
    $scope.timing = "获取";

    function settime() {
        if(countDown > 0) {
            setTimeout(function() {settime(countDown--); $scope.$apply();}, 1000);
            $scope.timing =
                // $scope.tisiyu+
                countDown + 's';
            $scope.selected = 0;
        }else {
            $scope.timing = "获取";

            $scope.selected = -1;
        }
    }
    settime();



    //生成手机验证码
    $scope.changeVerify = function () {//定义了一个点击事件，获取验证码

        if ($scope.name == null) {
            spop({
                template: '<strong>请输入手机号!</strong>',
                autoclose: 3000,
                style: 'error'
            });
            return;
        }
        // var namereg = /^[1][0-9]{2,11}$/;
        var namereg = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;// "[1]"代表第1位为数字1，"[358]"代表第二位可以为3、5、8中的一个，"\\d{9}"
        if(!namereg.test($scope.name)){
            spop({template: '<strong>手机号格式不对</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
        if($(".huakuai").css('display') === 'block'){
            if(!$(".sliderContainer").hasClass("sliderContainer_success")) {
                spop({template: '<strong>请滑动验证</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
        }
        if(countDown <= 0) {
            countDown = 60;
            $scope.timing =
                // $scope.tisiyu+
                countDown + "s";
            settime();
        }

        $http({
            method: 'GET',
            url: '/deepsearch/mobile/getMobile',
            params: {
                'PhoneNumbers': $scope.name
            }
        }).success(function (data) {
            console.log(data);

            if(data.code!=0){
                $scope.tisiyu = "验证码发送失败";
                spop({template: '<strong>' +data.msg+
                '</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }else{
                $scope.tisiyu = "验证码发送成功";
                spop({template: '<strong>' +data.data+
                '</strong>',
                    autoclose: 3000,
                    style:'success'
                });
                return;
            }
        }).error(function (data) {
            console.log(data);
            if(data.code!=0){
                spop({template: '<strong>' +data.msg+
                '</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
        })
    }


    $scope.todoSomething=function($event){
        if($event.keyCode==13){//回车
            registered();
        }
    }


    //注册
    $scope.registered = function () {
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
        var namereg = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;// "[1]"代表第1位为数字1，"[358]"代表第二位可以为3、5、8中的一个，"\\d{9}"
        if(!namereg.test($scope.name)){
            spop({template: '<strong>手机号格式不对</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }

        // if(!$(".sliderContainer").hasClass(".sliderContainer_success")) {
        //     spop({template: '<strong>请重新滑动验证</strong>',
        //         autoclose: 3000,
        //         style:'error'
        //     });
        //     return;
        // }

        if($scope.password == null){
            spop({template: '<strong>请输入密码!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
        // var passwordreg = /^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,25}$/;
        if(!($scope.password.length>=6 && $scope.password.length<=25)){
            spop({template: '<strong>密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }

        if($scope.passwordAgain == null){
            spop({template: '<strong>请输入密码!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }
        if(!($scope.passwordAgain.length>=6 && $scope.passwordAgain.length<=25)){
            spop({template: '<strong>再次输入密码密码长是8-25个字符，必须包含数字、字母、特殊字符其中的两种</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }

        if($scope.password != $scope.passwordAgain){
            spop({template: '<strong>二次输入的密码不一样</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }

        if($scope.showAuthCode == null){
            spop({template: '<strong>请输入手机验证码!</strong>',
                autoclose: 3000,
                style:'error'
            });
            return;
        }




            $http({
                method: 'GET',
                // url:'/deepsearch/registered',
                url: '/deepsearch/login/userRegistered',
                params: {
                    // 'name':$scope.name,
                    'id': $scope.name,
                    'password': $scope.password,
                    'mobileCode':$scope.showAuthCode,
                    'signCode':$scope.signCode
                }
            }).success(function (data) {
                if(data.code!=0){
                    spop({template: '<strong>' +data.msg+
                    '</strong>',
                        autoclose: 3000,
                        style:'error'
                    });
                    return;
                }
                //注册成功跳转到登录页面
                // var url='/deepsearch/searchIndex?ON=N';
                var url='/deepsearch/index?ON=N';
                // var url='/deepsearch/changeName';
                location.href = url;
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
        var url = '/deepsearch/sign';
        location.href = url;
    }



    /**
     * 二维码
     * @type {string}
     */
/*
    var toUtf8 = function (str) {   //地址中可用中文字符
        var out, i, len, c;
        out = "";
        len = str.length;
        for (i = 0; i < len; i++) {
            c = str.charCodeAt(i);
            if ((c >= 0x0001) && (c <= 0x007F)) {
                out += str.charAt(i);
            } else if (c > 0x07FF) {
                out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
                out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
                out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
            } else {
                out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
                out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
            }
        }
        return out;
    };
    var init = function () {
        //获取二维码
        var path="zjhzhc0218";
        var realPath=toUtf8(path);
        $('#codeUrl').qrcode(realPath);

    }

    init();*/


}

]);

