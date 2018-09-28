var pageApp = angular.module("app",['ui.bootstrap']);
pageApp.controller("ctrl",function($scope, $http){


    $http({
        method: 'GET',
        url: '/deepsearch/login/getUsers',
    }).success(function (data) {
        console.log(data);
        //总条数
        $scope.total = data.data.length;
        //反转函数转化abcd转dcba
        $scope.data = data.data.reverse();
        //选择显示的条数
        $scope.values = [{"limit":3},{"limit":4},{"limit":5},{"limit":6},{"limit":7},{"limit":8}];
        //默认显示的条数
        $scope.selectedLimit=$scope.values[0];
        //默认显示当前页数
        $scope.currentPage = 1;
        if($scope.data != null){
            $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.currentPage-1),$scope.selectedLimit.limit*$scope.currentPage);
        }else{
            alert($scope.data);
        }
        $scope.page = {
            "limit":$scope.selectedLimit.limit,"pageSize":5,"pageNo":$scope.currentPage,"totalCount":$scope.total};
    })
    $scope.change = function(selectedLimit){
        $scope.page.limit = selectedLimit.limit;
        $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
    }
    $scope.pageChanged = function(){
        $scope.page.limit = $scope.selectedLimit.limit;
        $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
    }
    $scope.setPage = function (go) {
        $scope.length = Math.ceil($scope.total/$scope.selectedLimit.limit);
        console.log($scope.length);
        if(go > $scope.length){
            $scope.page.pageNo =  $scope.length;
            console.log($scope.length);

        }else{
            $scope.page.pageNo=go;
        }
        $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
    };
});