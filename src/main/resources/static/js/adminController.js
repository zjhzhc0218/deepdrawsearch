var app=angular.module('app',['ui.bootstrap']);
app.controller('adminController',['$scope','$http','$sce','$document', function ($scope,$http,$sce,$document) {

         $scope.moduleType = 1;
        $scope.djl = false;
        $scope.dianjiliang = null;

        $document.bind("keypress", function(event) {

            if(event.keyCode == 13) {
                if ($scope.moduleType == 1) {
                    $scope.select();
                } else {
                    $scope.selectFT();
                }
            }
        });

        /*表单内容显示*/
        $scope.go = 1 ;
        $scope.id = null;
        $scope.type = 99;


        $scope.over = function (type) {
            if($scope.type == 99){
                $('#time').show();
            }else{
                $('#time').hide();
            }
        }

        $scope.banJ = function (id) {
            $http({
                method: 'GET',
                url: '/deepsearch/User/ban',
                params: {
                    'id': id,
                    'type':2
                }
            }).success(function (data) {
                spop({
                    template: '<strong>' + data.data +
                    '</strong>',
                    autoclose: 3000,
                    style: 'success'
                });
                $scope.id = id;
                $scope.select();
            }).error(function (data) {
                spop({
                    template: '<strong>' + data.data +
                    '</strong>',
                    autoclose: 3000,
                    style: 'error'
                });
            })
        }
        $scope.banH = function (id) {
            $http({
                method: 'GET',
                url: '/deepsearch/User/ban',
                params: {
                    'id': id,
                    'type':1
                }
            }).success(function (data) {
                spop({
                    template: '<strong>' + data.data +
                    '</strong>',
                    autoclose: 3000,
                    style: 'success'
                });
                $scope.id = id;
                $scope.select();
            }).error(function (data) {
                spop({
                    template: '<strong>' + data.data +
                    '</strong>',
                    autoclose: 3000,
                    style: 'error'
                });
            })
        }
        $scope.resetpassword = function (id) {
            $http({
                method: 'GET',
                url: '/deepsearch/User/passwordReduction',
                params: {
                    'id': id
                }
            }).success(function (data) {
                spop({
                    template: '<strong>' + data.data +
                    '</strong>',
                    autoclose: 3000,
                    style: 'success'
                });
                $scope.id = id;
                $scope.select();
            }).error(function (data) {
                spop({
                    template: '<strong>' + data.data +
                    '</strong>',
                    autoclose: 3000,
                    style: 'error'
                });
            })
        }

        $scope.select = function () {
            if($scope.time.startTime > $scope.time.endTime){
                spop({template: '<strong>起始时间不可以超过结束时间，请检查后重新输入时间</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
            $http({
                method: 'GET',
                url: '/deepsearch/login/getUsers',
                params: {
                    // 'name':$scope.name,
                    'id': $scope.id,
                    'type': $scope.type,
                    'timeStart': $scope.time.startTime,
                    'timeEnd': $scope.time.endTime

                }
            }).success(function (data) {
                console.log(data.data.User);
                spop({template: '<strong>' +data.data.count +
                '</strong>',
                    autoclose: 3000,
                    style:'success'
                });

                //总条数
                $scope.total = data.data.User.length;
                //反转函数转化abcd转dcba
                $scope.data = data.data.User.reverse();
                //选择显示的条数
                $scope.values = [{"limit": 3}, {"limit": 4}, {"limit": 5}, {"limit": 6}, {"limit": 7}, {"limit": 8}];
                //默认显示的条数
                $scope.selectedLimit = $scope.values[0];
                //默认显示当前页数
                $scope.currentPage = 1;
                if ($scope.data != null) {
                    $scope.datas = $scope.data.slice($scope.selectedLimit.limit * ($scope.currentPage - 1), $scope.selectedLimit.limit * $scope.currentPage);
                } else {
                    alert($scope.data.User);
                }
                $scope.page = {
                    "limit": $scope.selectedLimit.limit,
                    "pageSize": 5,
                    "pageNo": $scope.currentPage,
                    "totalCount": $scope.total
                };
            })

            $scope.change = function (selectedLimit) {
                $scope.page.limit = selectedLimit.limit;
                $scope.datas = $scope.data.slice($scope.selectedLimit.limit * ($scope.page.pageNo - 1), $scope.selectedLimit.limit * $scope.page.pageNo);
            }
            $scope.pageChanged = function () {
                $scope.page.limit = $scope.selectedLimit.limit;
                $scope.datas = $scope.data.slice($scope.selectedLimit.limit * ($scope.page.pageNo - 1), $scope.selectedLimit.limit * $scope.page.pageNo);
            }
            $scope.setPage = function (go) {
                $scope.length = Math.ceil($scope.total / $scope.selectedLimit.limit);
                console.log($scope.length);
                if (go > $scope.length) {
                    $scope.page.pageNo = $scope.length;
                    console.log($scope.length);

                } else {
                    $scope.page.pageNo = go;
                }
                $scope.datas = $scope.data.slice($scope.selectedLimit.limit * ($scope.page.pageNo - 1), $scope.selectedLimit.limit * $scope.page.pageNo);
            };
        }


        // var Date = new Date();
        // var yDate = new Date().setDate(yDate.getDate()-7);
        //
        // var date = new Date().toLocaleTimeString();
        //     // .replace("年","-").replace("月","-").replace("日","");
        // var ydate = (yDate).toLocaleTimeString();
        //     // .replace("年","-").replace("月","-").replace("日","");


    $scope.time = {
        'endTime' : null,
        'startTime' : null
    }

    $scope.selectFT  = function () {

                if ($scope.time.startTime > $scope.time.endTime) {
                    spop({
                        template: '<strong>起始时间不可以超过结束时间，请检查后重新输入时间</strong>',
                        autoclose: 3000,
                        style: 'error'
                    });
                    return;
                }


        $http({
            method: 'GET',
            url: '/deepsearch/functionUsing/getFT',
            params: {
                // 'name':$scope.name,
                'id': $scope.id,
                'module':$scope.module,
                'type': $scope.type,
                'timeStart': $scope.time.startTime,
                'timeEnd': $scope.time.endTime

            }
        }).success(function (data) {
            console.log(data.data);
            // spop({template: '<strong>' +data.data.count +
            // '</strong>',
            //     autoclose: 3000,
            //     style:'success'
            //     });

            $scope.djl = true;
            if($scope.id==null){
                $scope.dianjiliang="本次全用户";
            }else{
                $scope.dianjiliang="本次"+$scope.id;
            }

            if($scope.module==null){
                $scope.dianjiliang =  $scope.dianjiliang+"全模块";
            }else if($scope.module==1){
                $scope.dianjiliang =  $scope.dianjiliang+"排名模块";
            }else if($scope.module==2){
                $scope.dianjiliang =  $scope.dianjiliang+"违禁词模块";
            }else if($scope.module==3){
                $scope.dianjiliang =  $scope.dianjiliang+"信誉模块";
            }else if($scope.module==4){
                $scope.dianjiliang =  $scope.dianjiliang+"热词模块";
            }else if($scope.module==5){
                $scope.dianjiliang =  $scope.dianjiliang+"降权模块";
            }

            if($scope.type==99){
                if($scope.time.startTime==null && $scope.time.endTime==null){
                    $scope.dianjiliang =  $scope.dianjiliang+"在全时间";
                }else{
                $scope.dianjiliang =  $scope.dianjiliang+"在"+$scope.time.startTime+至+$scope.time.endTime;}
            }else if($scope.type==2){
                $scope.dianjiliang =  $scope.dianjiliang+"当天";
            }
            else if($scope.type==3){
                $scope.dianjiliang =  $scope.dianjiliang+"当周";
            }
            else if($scope.type==4){
                $scope.dianjiliang =  $scope.dianjiliang+"当月";
            }
            else if($scope.type==5){
                $scope.dianjiliang =  $scope.dianjiliang+"当年";
            }

            $scope.dianjiliang =$scope.dianjiliang+"点击量为"+ data.data.count;
            });

        }

    $scope.look = function(){
            alert($scope.adStyle)
        }

        $scope.check = function () {
        console.log($scope.time);
    }
        }]
    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])