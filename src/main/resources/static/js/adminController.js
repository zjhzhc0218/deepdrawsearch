var app=angular.module('app',[])
    .controller('adminController',['$scope','$http','$sce', function ($scope,$http,$sce) {


    $scope.time = {
        'endTime' :"2018-09-28 11:31:38",
        'startTime' :null
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