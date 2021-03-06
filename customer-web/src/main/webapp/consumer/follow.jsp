<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="">
		<meta http-equiv="X-UA-Compatible" content="chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"> 
		<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<title>净水器-申请关注</title>
		<link rel="stylesheet" type="text/css" href="${_staticPath}/resource/weuiWeb/css/weui.min.css" />
		<link rel="stylesheet" href="${_staticPath}/resource/weuiWeb/css/suspendedBall.css" />
		<link rel="stylesheet" type="text/css" href="${_staticPath}/resource/weuiWeb/css/xy-css.css" />
	</head>
	<script type="text/javascript">
		var _path="${_path}",_staticPath="${_staticPath}";
	</script>
	<body ontouchstart>
		<div class="page flex js_show height100">
			<div class="weui-flex xy-header">
				<div>
					<a href="javascript:history.go(-1);" class="weui-btn weui-btn_mini xy-btn-back"></a>
				</div>
				<div class="weui-flex__item"><div class="xy-h1-title">申请关注</div></div>
				<div class="xy-width-45"></div>
			</div><!--/header-->
		
			<div class="page__bd xy-container">
				<div class="xy-layout">
					<div class="xy-layout-bar xy-mar-10 xy-pad-10">						
						<p class="xy-fc-blue">昨天</p>
						<div class="xy-tac">
							<div class="xy-dib xy-pad-b7">
								<p class="mini-lovely"><img /></p>
								<p class="xy-pad-t3 xy-fs16" id="name">蒙奇浩浩</p>
								<p class="xy-pad-t3 xy-fs16 xy-fc-gray" id="content">申请关注您的饮水安全状态</p>
							</div>
						</div>
					</div>
					<div class="xy-pad-10">
						<a href="javascript:;" class="weui-btn weui-btn_primary bg-light-blue">同意</a>
						<a href="javascript:;" class="weui-btn weui-btn_primary xy-marIM-t10 bg-orange">拒绝</a>
					</div>
				</div>
			</div>
			<!--/ container -->
			
		</div>
		<!--/page End-->
		
		<script type="text/javascript" src="${_staticPath}/resource/weuiWeb/js/jquery-1.12.4.min.js"></script>
		<script src="${_path}/js/consumer/SuspendedBall.js"></script>
		<script type="text/javascript" class="js_show">
			function eventCollection(weui){
			}
			$(function(){
				//获取地址栏参数				
				function GetQueryString(name){
				     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				     var r = window.location.search.substr(1).match(reg);
				     if(r!=null)return  decodeURI(r[2]); return null;
				}
				 
				// 调用方法
				/* alert(GetQueryString("followTime"));
				alert(GetQueryString("name"));
				alert(GetQueryString("content"));
				alert(GetQueryString("thisSrc")); */
				$('#content').html(GetQueryString("content"));
				$('.xy-fc-blue').html(GetQueryString("followTime"));
				$('#name').html(GetQueryString("name"));
				$('.mini-lovely img').attr('src',GetQueryString("thisSrc"));
				var equipCode = GetQueryString("equipCode"),userId = GetQueryString("detailId"),
				id = GetQueryString("id");
				bindEvent(equipCode,userId,id);
			})
			function bindEvent(equipCode,userId,id){
				var status='';
				$('.bg-light-blue').click(function(){
					status = 1; 
					attentHandle(status,equipCode,userId,id);
				});
				$('.bg-orange').click(function(){
					//alert('45');
					status = 2;
					attentHandle(status,equipCode,userId,id);
				});				
			}
			function attentHandle(status,equipCode,userId,id){
				//关注处理
				$.ajax({
					type:'get',
					url:_path+'/consumer/equip/attentHandle?status='+status+'&equipCode='+equipCode+'&userId='+userId+'&id='+id,
					success : function(r){
						console.log(r);
						if(r){
							alert(r.message);
							window.location.href =_path+"/consumer/news.jsp?handle=1";
							}						
						}
				});
			}
		</script>
		
		<script type="text/javascript" src="${_staticPath}/resource/weuiWeb/js/xy-common.js"></script>
	</body>
</html>