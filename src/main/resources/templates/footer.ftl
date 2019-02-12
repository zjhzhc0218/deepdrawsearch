<!--  / footer  -->
<div class="footer">
	<p>Copyright  2018-2019  杭州兴淘网络科技有限公司 白马查 www.baiamcha.com   浙ICP备18047066号  <span class="footer_ab" >关于我们</span>   <span class="footer_cont">联系我们 </span>   </p>
</div>
<!--  / footer  -->
<!-- 二维码 -->
<div class="index_core">
	<h5>白马哥，您的运营参谋</h5>
	<img src="/codeimg/codeImg.jpg" width="100%">
	<p>5分钟响应你的问题<br>不信您试试？</p>
</div>
<!-- 二维码 -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 12%;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">提示</h4>
			</div>
			<div class="modal-body" style="text-align: center">
				<label style="font-size: 25px ;color: red;text-align: center">注册或登录后可免费查询呦！</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="signLogin()">注册/登陆</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<!--关于我们 Modal -->
<div class="modal fade" id="weModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 25%;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">关于我们</h4>
			</div>
			<div class="modal-body" style="text-align: center">
				<#--<label style="font-size: 25px ;color: red;text-align: center">请登陆后进行查询！</label>-->
				<p style="word-break:break-all;text-align:left;text-indent:2em"> 杭州兴淘网络科技有限公司是一家以技术为驱动、以社群为闭环的电商服务公司。其旗下的白马查产品为广大电商用户提供了精准的在线数据查询功能。 同时公司旗下的白马会为电商社群，为广大电商提供交流互助、资源共享的平台。</p>
				<p>公司自成立以来一直以服务广大电商卖家为己任。未来兴淘网络还会继续推出更多的服务，敬请期待。</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>


<!--联系我们 Modal -->
<div class="modal fade" id="tellweModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="top: 25%;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">联系我们</h4>
			</div>
			<div class="modal-body" style="text-align: center">
				<p>联系方式：杭州市江干区艮山支三路5号4幢104室</p>
				<p>联系电话：0571-88983115</p>
				<p>联系时间：工作日9:00—18:00</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<div class="all_bg"></div>
<script>


		var last=document.referrer;
		var typeInfo=0;
		// console.log(last)
		if(window.location.href !=last){
			if(last.indexOf("baidu.com") != -1){
				// window.location.href = changeURLArg(window.location.href,'id','b')
				typeInfo=1;
				sessionStorage.setItem("entrance",typeInfo);
			}
			else if(last.indexOf("so.com") != -1){
				// window.location.href = changeURLArg(window.location.href,'id',"o")
				typeInfo=2;
				sessionStorage.setItem("entrance",typeInfo);
			}
			// console.log(sessionStorage.getItem("entrance"))

		}

		function changeURLArg(url,arg,arg_val){
			var pattern=arg+'=([^&]*)';
			var replaceText=arg+'='+arg_val;
			if(url.match(pattern)){
				var tmp='/('+ arg+'=)([^&]*)/gi';
				tmp=url.replace(eval(tmp),replaceText);
				return tmp;
			}else{
				if(url.match('[\?]')){
					return url+'&'+replaceText;
				}else{
					return url+'?'+replaceText;
				}
			}
		}


</script>