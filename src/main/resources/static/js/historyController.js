// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('his_result'));
// 指定图表的配置项和数据
var option = {

    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['销量']
    },
    xAxis: {
        type: 'category',
        axisLabel :{
            interval:30
        },
        // data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
    },
    yAxis: {
        scale: true,

    },
    series: [{
        name:"价格",
        type: 'line',
        markPoint: {
            data: [
                {type: 'max', name: '最高价格'},
                {type: 'min', name: '最低价格'}
            ]
        },
    }]
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);

var app=angular.module('history',[])
    .controller('historyController',['$scope','$http','$sce','$filter', function ($scope,$http,$sce,$filter) {

    /**
     * 登陆信息
     * @type {string}
     */
    $scope.username = null;
    if (user != '') {
        $scope.username = angular.fromJson(user);
    }


        //########################历史价格查询###############################//
        $scope.searchWordsHistory = null;//查询
        $scope.history = {
            hasNoViolation : false,
            working : false,
            hideDetail : false,
            hasAbsolutedWord : false,
            examedContext : null
        };
        var historyvm = $scope.history.vm = {};
            historyvm.value = 0;
            historyvm.style = 'progress-bar-info';
            historyvm.showLabel = true;
            historyvm.striped = true;
            var data = null;
            var series=null;
            var seriesX=new Array();
            var seriesY=new Array()
            $scope.high=null;
            $scope.low=null;
        $scope.searchHistory = function () {

            if ($scope.username == null){
                $('#myModal').modal('show');
                return;
            }

            //判断是否注册
            // var fCount = getFTForUser();
            if($scope.username.grade == 2) {
                $(".index_frame").stop(true).fadeIn(300);
                return;
            }
            if( $scope.searchWordsHistory == null) {
                spop({template: '<strong>请输入查询字符!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
            var str = angular.copy($scope.searchWordsHistory);
            str = str.match(/id=(\d*)/);
            if (str) {
                $scope.searchWordsHistory = str[1];
            }
            var reg = /^[0-9]+.?[0-9]*$/;
            if (!reg.test($scope.searchWordsHistory)) {
                spop({template: '<strong>宝贝ID或者宝贝链接输入不符合规则!</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }

            /*  $("#wjcrs").mLoading({
             text:"查询中"
             });*/
            historyvm.value = 0;
            $scope.history.examedContext = null;
            $scope.history.msg = null;
            $scope.history.hasNoViolation = false;
            var interval = setInterval(function(){
                historyvm.value++;
                $scope.$apply();
                if (historyvm.value == 100) {
                    $scope.history.msg = "查询超时！请重新查询";
                    $scope.history.working = false;
                    $scope.history.hasNoViolation == true;
                    $scope.$apply();
                    clearInterval(interval);
                }
            }, 240);
            $scope.history.working = true;
            $http({
                method:'get',
                url:'/deepsearch/getSearchhistory', params:{"searchWords": $scope.searchWordsHistory},
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                transformRequest: function ( data ) {
                    var str = '';
                    for( var i in data ) {
                        str += i + '=' + data[i] + '&';
                    }
                }}
            ).then(function successCallback(info) {
                if (info.data.code == 1) {
                    // alert(info.data.msg);
                    $scope.history.msg = info.data.msg;
                    $scope.history.hasNoViolation = true;
                }else if(info.data.code == 0){
                    data = angular.fromJson(info.data.data);
                    $scope.history.examedContext = data;
                    $scope.history.hideDetail = true;
                    $scope.history.working = false;
                    historyvm.value = 100;
                    //最低价格current_price
                    //最高价格last_price

                    //x轴 y轴
                    series=$scope.history.examedContext.series['180'];
                    //最高和最低价格
                    var str1=series.max.toString()
                    str1=str1.substring(0,str1.length-2);
                    $scope.high=parseInt(str1)
                    var str2=series.min.toString()
                    str2=str2.substring(0,str2.length-2);
                    $scope.low=parseInt(str2)
                    Transformation(series.data,seriesX,seriesY);
                    myChart.setOption({
                        title: {
                            //标题
                            // text:$scope.history.examedContext.dp_info.title
                        },
                        xAxis: {
                            //x轴
                            data:seriesX,
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            data: seriesY
                        }]
                    });
                    clearInterval(interval);
                }
            },function errorCallback(info) {
                $scope.history.working = false;
                historyvm.value = 100;
                clearInterval(interval);
                // $("#wjcrs").mLoading("hide");
                // alert("失败了");
            })
        }

       /* $scope.hideDetail = function () {
            $scope.history.hideDetail = false;
        }*/
       //点击不同的天数进行切换
        $scope.switchDay = function (key) {
            if(key==1){
                series=data.series['360']
            }
            else if(key==2){
                series=data.series['180']

            }
            else if(key==3){
                series=data.series['30']
            }
            else if(key==4){
                series=data.series['5']
            }
            seriesX=[];
            seriesY=[];
            var str1=series.max.toString()
            str1=str1.substring(0,str1.length-2);
            $scope.high=parseInt(str1)
            var str2=series.min.toString()
            str2=str2.substring(0,str2.length-2);
            $scope.low=parseInt(str2)
            Transformation(series.data,seriesX,seriesY);
            myChart.setOption({
                xAxis: {
                    //x轴
                    data:seriesX,
                },
                series: [{
                    // 根据名字对应到相应的系列
                    data: seriesY
                }]
            });

        }

    $scope.searchLogin = function () {
        if ($scope.username == null){
            $('#myModal').modal('show');
            return;
        }
    }
    var Transformation=function(a,b,c){
        for(var i=0;i<a.length;i++){

            //时间戳转换
            var date=new Date(a[i].x * 1000);
            var Y = date.getFullYear() + '-';
            var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            var D = date.getDate() + ' ';
            b[i] =Y+M+D;
            //去掉y轴后面两位小数点
            var str=a[i].y.toString()
            str=str.substring(0,str.length-2);
            c[i]=parseInt(str)
        }
    }
    //注销
    $scope.signLogin = function() {
        if($scope.username) {
            $http({
                    method: 'post',
                    url: '/deepsearch/removeSession',
                    params: {},
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    transformRequest: function (data) {
                        var str = '';
                        for (var i in data) {
                            str += i + '=' + data[i] + '&';
                        }
                    }
                }
            )
        }
        var url='/deepsearch/sign';
        location.href = url;
    };

    $scope.toAdminPage = function () {
        var url='/deepsearch/adminPage';
        location.href = url;
    }

    $scope.jqWords = function (str) {
        $("."+str).toggle();
    }


    $scope.showWeModal = function (name) {
        $('#'+ name).modal('show');
    }

            /**
             * 获得次数
             */
    var getFTForUser = function () {
             var count = null;
                $.ajaxSettings.async = false;
                $.ajax({
                    url: '/deepsearch/functionUsing/getFTForUser', data: {"id": $scope.username.id},
                    dataType: 'json',
                    method: 'GET',
                    success: function (data) {
                        count =  data.data.count;
                    }
                })
                return  count;
           /*     $http({
                    method: 'GET',
                    // url:'/deepsearch/registered',
                    url:'/deepsearch/functionUsing/getFTForUser', params:{"id":  $scope.username.id},
                }).success(function (data) {
                    return data.data.count;
                });*/
            }

    var   getQueryString = function(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        // var r = window.location.search.substr(1).match(reg);
        var r = decodeURI(decodeURI(window.location.search.substr(1))).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    var urlParams = getQueryString("name");
    if(urlParams) {
        $scope.xialakuang.searchWordsXialakuang =urlParams;
        // $scope.searchZhanxian();
    }

    }]


    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])