var app=angular.module('app',['ui.bootstrap','ngFileUpload']);
app.controller('adminController',['$scope','$http','$sce','$document','$filter', function ($scope,$http,$sce,$document,$filter,Upload) {


            $scope.moduleType = 1;
        $scope.djl = false;
        $scope.dianjiliang = null;
        $scope.qixian = null;
        $scope.paiming = null;
        $scope.weijinci = null;
        $scope.xinyu = null;
        $scope.reci = null;
        $scope.jiangquan = null;

        $scope.dongtaipingfen = null;
        $scope.mulu = null;
        $scope.shangxiajia = null;
        $scope.zhishu = null;
        $scope.zhanxian = null;
        $scope.xialakuang = null;

        /**
         * 登陆信息
         * @type {string}
         */
        $scope.username = null;
        if (user != '') {
            $scope.username = angular.fromJson(user);
        }else {
            var url='/deepsearch/searchIndex';
            // var url='/deepsearch/changeName';
            location.href = url;
        }

        $scope.datasTotal = [];
       /* /!*键盘按回车事件*!/
        $document.bind("keypress", function(event) {
            if(event.keyCode == 13) {
                if ($scope.moduleType == 1) {
                    $scope.select();
                } else {
                    $scope.selectFT();
                }
            }
        });*/

        /*表单内容显示*/
        $scope.go = 1 ;
        $scope.id = null;
        $scope.type = 99;


       /* 时间部分显示*/
        $scope.over = function (type) {
            if($scope.type == 99){
                $('#time').show();
            }else{
                $('#time').hide();
            }
        }

        /*禁止某个id登录*/
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

        /*恢复某个id登录*/
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


        /*降某个id等级*/
        $scope.gradeJ = function (id) {
            $http({
                method: 'GET',
                url: '/deepsearch/User/updateGrade',
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

        /*升某个id权限*/
        $scope.gradeH = function (id) {
            $http({
                method: 'GET',
                url: '/deepsearch/User/updateGrade',
                params: {
                    'id': id,
                    'type':3
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



        /*一键设置某个用户的密码为123456abc*/
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

       /* 主要功能:查询用户信息*/
        $scope.select = function () {
            if($scope.time.startTime > $scope.time.endTime){
                spop({template: '<strong>起始时间不可以超过结束时间，请检查后重新输入时间</strong>',
                    autoclose: 3000,
                    style:'error'
                });
                return;
            }
            $scope.datasTotal = [];
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
                spop({template: '<strong>' +data.data.count +
                '</strong>',
                    autoclose: 3000,
                    style:'success'
                });

                //总条数
                $scope.total = data.data.User.length;
                //反转函数转化abcd转dcba
                $scope.data = data.data.User.reverse();
                $scope.datasTotal =angular.copy($scope.data);
                //选择显示的条数
                $scope.values = [{"limit": 8}, {"limit": 16}, {"limit": 32}, {"limit": 50}, {"limit": 100}, {"limit": 200}];
                //默认显示的条数
                $scope.selectedLimit = $scope.values[3];
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

        $scope.time = {
        'endTime' : null,
        'startTime' : null
    }
        /*另一个主要功能：查询模块使用情况*/
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
                'id': $scope.id,
                'module':$scope.module,
                'type': $scope.type,
                'timeStart': $scope.time.startTime,
                'timeEnd': $scope.time.endTime
            }
        }).success(function (data) {
            console.log(data.data);
            $scope.djl = true;
            if($scope.id==null){
                $scope.dianjiliang="本次全用户";
            }else{
                $scope.dianjiliang="本次"+$scope.id;
            }
            if($scope.module==null){
                $scope.dianjiliang =  $scope.dianjiliang+"全模块";
            }

            if($scope.type==99){
                if($scope.time.startTime==null && $scope.time.endTime==null){
                    $scope.qixian = "全时间";
                }else{
                    $scope.qixian = "固定时间";
                }
            }else if($scope.type==2){
                $scope.qixian = "当天";
                $scope.dianjiliang =  $scope.dianjiliang+"当天";
            }
            else if($scope.type==3){
                $scope.qixian = "当周";
                $scope.dianjiliang =  $scope.dianjiliang+"当周";
            }
            else if($scope.type==4){
                $scope.qixian = "当月";
                $scope.dianjiliang =  $scope.dianjiliang+"当月";
            }
            else if($scope.type==5){
                $scope.qixian = "当年";
                $scope.dianjiliang =  $scope.dianjiliang+"当年";
            }

            $scope.paiming = data.data.paiming;
            $scope.weijinci = data.data.weijinci;
            $scope.xinyu = data.data.xinyu;
            $scope.reci = data.data.reci;
            $scope.jiangquan = data.data.jiangquan;

            $scope.dongtaipingfen = data.data.dongtaipingfen;
            $scope.mulu = data.data.mulu;
            $scope.shangxiajia = data.data.shangxiajia;
            $scope.zhishu = data.data.zhishu;
            $scope.zhanxian = data.data.zhanxian;
            $scope.xialakuang = data.data.xialakuang;

            $scope.dianjiliang =$scope.dianjiliang+"点击量为"+ data.data.count;
            });

        }

        $scope.look = function(){
            alert($scope.adStyle)
        }

        $scope.check = function () {
        console.log($scope.time);
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

      $scope.export = function () {
          if($scope.datasTotal.length == 0) {
              spop({template: '<strong>暂无数据可导出</strong>',
                  autoclose: 3000,
                  style:'error'
              });
              return;
          }
          var str = `用户,用户归属地,注册时间,最后登录时间,登录次数,用户权限,是否禁用\n`;
          for(var i = 0 ; i < $scope.datasTotal.length ; i++ ){
              for(var item in $scope.datasTotal[i]){
                  if(item == "ban") {
                      str+=`${$scope.datasTotal[i][item]  == '1' ?'正常':'禁用' + '\t'},`;
                  }
                  if(item == "grade") {
                      str+=`${$scope.datasTotal[i][item]  == '2' ?'普通':'管理员' + '\t'},`;
                  }
                  if(item == "lastLoginDate" || item == "registerDate" ) {
                      str+=`${ $filter('date')($scope.datasTotal[i][item],'yyyy-MM-dd HH:mm:ss') + '\t'},`;
                  }
                  if(item == "id") {
                      str+=`${$scope.datasTotal[i][item] + '\t'},`;
                  }
                  if(item == "nickname") {
                      str+=`${$scope.datasTotal[i][item] + '\t'},`;
                  }
                  if(item == "loginCount") {
                      str+=`${$scope.datasTotal[i][item] + '\t'},`;
                  }
                  // str+=`${$scope.datas[i][item] + '\t'},`;
              }
              str+='\n';
          }
          //encodeURIComponent解决中文乱码
          var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
          //通过创建a标签实现
          var link = document.createElement("a");
          link.href = uri;
          //对下载的文件命名
          link.download =  "人员信息表.csv";
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);

      }



    $scope.shopParams = {
        'reader':new FileReader(), //创建一个FileReader接口
        'form' : { //用于绑定提交内容，图片或其他数据
            image: {},
        },
        'thumb':null, //用于存放图片的base64
        'shopStoreUrl':null,//url
        'imgSrc':null,//imgSrc
        'file':null,//file
        'img':null,//状态
        'uploadFiles' : function (file, errorFile) {
            if ( file ) {
                $scope.shopParams.reader.onload = function(ev) {
                    $scope.$apply(function() {
                        $scope.shopParams.thumb = ev.target.result; //接收base64
                    });
                    $scope.shopParams.imgSrc = $scope.shopParams.thumb;
                };
            }
            $scope.shopParams.reader.readAsDataURL(file); //FileReader的方法，把图片转成base64
        },
       /* 'show' : function () {
           $('#export').modal('show');
        },*/
        'editShop' : function () { //修改
            // console.log( $scope.editshopParams);
            // var data = new FormData();
            if(!$scope.shopParams.file) {
                alert("请上传图片");
                return ;
            }
            // data.append("params", angular.toJson($scope.shopParams));
            var data = new FormData();
            data.append("img", $scope.shopParams.file);
            $http({
                method: "POST",
                url: "/deepsearch/User/saveShopRecord",
                data: data,
                headers: {
                    'Content-Type': undefined
                },
                transformRequest: angular.identity

            }).then(function successCallback(response) {
                    // console.log(response.data)
                    alert("上传成功，请刷新页面")
                },
                function errorCallback(response) {
                    console.log("error");
                    alert("上传成功，请刷新页面");
                });

        }
    };


    /**
     * 上传资讯
     */
    var initPage = function() {
        $scope.page = {

            'text':editor.txt.html(),//内容
            'title':'',
            'author':null,
            'select':1,
            'words':null,
            'reader':new FileReader(), //创建一个FileReader接口
            'form' : { //用于绑定提交内容，图片或其他数据
                image: {},
            },
            'thumb':null, //用于存放图片的base64
            'shopStoreUrl':null,//url
            'imgSrc':null,//imgSrc
            'file':null,//file
            'img':null,//状态
            'uploadFiles' : function (file, errorFile) {
                if ( file ) {
                    $scope.page.reader.onload = function(ev) {
                        $scope.$apply(function() {
                            $scope.page.thumb = ev.target.result; //接收base64
                        });
                        $scope.page.imgSrc = $scope.page.thumb;
                    };
                }
                $scope.page.reader.readAsDataURL(file); //FileReader的方法，把图片转成base64
            }
        };
    }
    initPage();
    //
    $scope.infosum =function () {

        if($scope.page.author==null||$scope.page.title==null||$scope.page.select==null||$scope.page.words==null){
            alert('缺少内容');
        }
        var data = new FormData();
        data.append("img", $scope.page.file);
        data.append("title", $scope.page.title);
        data.append("author", $scope.page.author);
        data.append("select", $scope.page.select);
        data.append("words", $scope.page.words);
        data.append("text", editor.txt.html());
        if($scope.page.id){
            data.append("id", $scope.page.id);
        }
        $http({
            method: "POST",
            url: "/deepsearch/File/uploadWords",
            data: data,
            headers: {
                'Content-Type': undefined
            },
            transformRequest: angular.identity

        }).then(function successCallback(response) {
                // console.log(response.data)
                // alert("上传成功，请刷新页面")
            },
            function errorCallback(response) {
                console.log("error");
                // alert("上传成功，请刷新页面");
            });

    }

    /**
     * 查询资讯
     */
    $scope.queryparam = {
        'title': null,
        'type': 0
    };
    $scope.queryinfo = function () {
        $.ajax({
            url: '/deepsearch/File/getAI', data: {"title": $scope.queryparam.title,"typeN": $scope.queryparam.type},
            dataType: 'json',
            method: 'GET',
            success: function (data) {
                $scope.zixunrecord =  data.data.list;
                for (var i=0;i<$scope.zixunrecord.length;i++) {
                    $scope.zixunrecord[i].checked = false;
                    $scope.zixunrecord[i]._creationTime = $filter('date')($scope.zixunrecord[i].creationTime,'yyyy-MM-dd HH:mm:ss');
                    $scope.$apply();
                }
            }
        })
    }

    /**
     * 批量删除
     * @param name
     */
    $scope.deleteAll = function() {
        var list = [];
        for (var i=0;i<$scope.zixunrecord.length;i++)  {
            if ($scope.zixunrecord[i].checked) {
                list.push($scope.zixunrecord[i].serialNumber);
            }
        }
        $.ajax({
            url: '/deepsearch/File/getAI', data: {"ids":list},
            dataType: 'json',
            method: 'GET',
            success: function (data) {
               alert("删除成功");
            }
        })
    };
    $scope.deleteOne = function(id) {
        var list = [];
        list.push(id);
        $.ajax({
            url: '/deepsearch/File/getAI', data: {"ids":list},
            dataType: 'json',
            method: 'GET',
            success: function (data) {
                alert("删除成功");
            }
        })
    };

    /**
     * 编辑
     * @param name
     */
    $scope.edit = function(params) {
        editor.txt.html(params.specificContent);
        $scope.page = {
            'id':params.serialNumber,//
            'text':params.specificContent,//内容
            'title':params.title,
            'author':params.author,
            'select':params.typeN,
            'words':params.describeN,
            'reader':new FileReader(), //创建一个FileReader接口
            'form' : { //用于绑定提交内容，图片或其他数据
                image: {},
            },
            'thumb':null, //用于存放图片的base64
            'shopStoreUrl':null,//url
            'imgSrc':null,//imgSrc
            'file':params.cover,//file
            'img':null,//状态
            'uploadFiles' : function (file, errorFile) {
                if ( file ) {
                    $scope.page.reader.onload = function(ev) {
                        $scope.$apply(function() {
                            $scope.page.thumb = ev.target.result; //接收base64
                        });
                        $scope.page.imgSrc = $scope.page.thumb;
                    };
                }
                $scope.page.reader.readAsDataURL(file); //FileReader的方法，把图片转成base64
            }
        };

        $('#zixun').modal('show');
    }



    $scope.showZxModal = function (name) {
        initPage();
        $('#'+ name).modal('show');
    }





    }]
    );
app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}])