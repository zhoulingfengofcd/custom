<%@ page language="java" pageEncoding="utf-8"%>

<jsp:include page="../../common/common.jsp">
	<jsp:param name="title" value="应用"/>
</jsp:include>

<div class="page-header">
	<h1>
		消息列表
	</h1>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="row">
			<div class="col-xs-12">
				<div class="widget-box">
					<div class="widget-header widget-header-small">
						<h5 class="widget-title lighter">搜索栏</h5>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<form id="_form" class="form-inline">
								<label>
									<label class="control-label" for="form-field-1"> ： </label>
									<input name="name" type="text" class="form-data input-medium search-data">
								</label>
								<!-- 
								<button id="_search" type="button" class="btn btn-info btn-sm">
									<i class="ace-icon fa fa-search bigger-110"></i>搜索
								</button>
								 -->
							</form>
						</div>
					</div>
				</div>

				<div>
					<div class="dataTables_wrapper form-inline no-footer">
						<table id="_table" class="table table-striped table-bordered table-hover dataTable no-footer">
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="table-dialog"></div>

<script type="text/javascript">
	scripts.push(
			"${_staticPath}/custom/zTree/js/jquery.ztree.core-3.5.min.js?v=" + Math.random(),
			"${_staticPath}/custom/zTree/js/jquery.ztree.excheck-3.5.min.js?v=" + Math.random());
	
	var myScripts = [
		// 验证
		"${_staticPath}/custom/jquery.validate-2.0.min.js?v=" + Math.random(),
		"${_staticPath}/custom/jquery.validate-2.0.custom.min.js?v=" + Math.random()
	];	
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		jQuery(function($) {
			
			// 列表
    		var $table = $("#_table").table({
    			url : "${_path}/admin/message/list",
    			formId : "_form",
    			ajaxData : {//加载表格的请求设置
    				type : "post",
    				dataFormat : "json",
    				contentType : "application/json; charset=utf-8"
    			},
				tools : [
					{text : '新增', clazz : 'btn-info', icon : 'fa fa-plus-circle blue', permission : '/admin/user/edit', handler : function(){
						$table.dialog(null,null,"消息添加",{
							url:'${_path}/admin/message/insert',
							type:'post',
							callback:function(d){
								$.gritter.add({
									text: d.message,
									sticky: false,
									time: '1000'
								});
							}
						});
						//必须重新加载jquery validate js，否则无法校验
						$('.page-content-area').ace_ajax('loadScripts', myScripts, function() {});
					}},
					{text : '删除', clazz : 'btn-danger', icon : 'fa fa-trash-o red', permission : '/admin/user/delete', handler : function(){
						$table.ajaxDelete({
							confirm : "确认要删除?",
							url : "${_path}/admin/message/delete",
							data:JSON.stringify({entitys:$table.getSelectedItemKeyArray("userId","sortCode","id")}),
							contentType: "application/json; charset=utf-8"
						});
					}}
				],
				columns : [
					{field:'rowKey',hide:true},
			        {field:'id'},
			        //{field:'id', hide : true},
			        
			        {field:'userId', title:'用户ID', mobileHide : true},
			        {field:'title', title:'标题', mobileHide : true},
			        {field:'content', title:'内容', mobileHide : true},
			        {field:'imageUrl', title:'图片url', mobileHide : true,replace : function (d){
			        	return	'<div class="col-xs-3">'+
			        				//'<a id="updatePortrait_'+d.id+'" data-toggle="dropdown" href="www.baidu.com" class="dropdown-toggle">'+
										'<img class="img-circle img-responsive center-block nav-user-photo" src="${_staticPath}'+d.imageUrl+'" alt="Jasons\' Photo" />'+
									//'</a>'+
								'</div>';
					}},
			        {field:'sortCode', title:'分类编码', mobileHide : true},
			        {field:'readFlag', title:'读标志', mobileHide : true},
			        {field:'status', title:'处理状态', mobileHide : true},
			        {field:'createTime', title:'创建时间', mobileHide : true},
			        
				],
				operate : [
					{text : '修改', clazz : 'blue', icon : 'fa fa-pencil', permission : '/admin/user/edit', handler : function(d, i){
						$table.dialog(d,i,"修改消息",{
							url:'${_path}/admin/message/update',
							type:'post',
							callback:function(d){
								$.gritter.add({
									text: d.message,
									sticky: false,
									time: '1000'
								});
							}
						}).validate();
					}},
					{text : '删除', clazz : 'red', icon : 'fa fa-trash-o', permission : '/admin/user/delete', handler : function(d, i){
						$table.ajaxDelete({
							confirm : "确认要删除?",
							url : "${_path}/admin/message/delete",
							data:JSON.stringify({entitys:$table.getSelectedItemKeyArray("userId","sortCode","id")}),
							contentType: "application/json; charset=utf-8"
						});
					}}
				],
				after : function(){
					// 权限处理
					$.permission();
					
				}
			});
			/* $table.dialog(null,null,"用户添加");
			$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
				//弹出层初始化
		        $('.modal.aside').ace_aside();
			
				$(document).one('ajaxloadstart.page', function(e) {
					//in ajax mode, remove before leaving page
					$('.modal.aside').remove();
					$(window).off('.aside');
				});
				
				$("#table-dialog-modal-a").click();
				$("#_name").focus();
			}); */
			
			/*console.log("d:"+$table.options.data);
			var data=$table.options.data;
			$.each(data,function(index,element){
				var addBtn = $("#updatePortrait_" + element.id);
				if(addBtn){
					console.log("yes");
					addBtn.bind("click", function(){
						setForm(treeNode,'add');
						$("#my-modal-a").click();
						$("#_name").focus();
					});
				}
			});*/
			
			//点击保存按钮
			$("#_submit").click(function(){
				if($('#_editForm').validate()){
					alert("正在保存.");
					/* var btn = $(this);
					btn.button('loading');
					$.post("${_path}/admin/permission/save", $.formJson('_editForm'),function(d) {
						if(d){
							btn.button('reset');
							$.gritter.add({
								text: d.message,
								sticky: false,
								time: '1000'
							});
							$("#_editForm")[0].reset();
							reloadTree();
						}else{
							//这里打印提示信息
							$.gritter.add({
								text: "服务器返回值空"+d.message,
								sticky: false,
								time: '1000'
							});
						}
			        },'json'); */
				}else{
					return false;
				}
			});
			
			//弹出层初始化
	        $('.modal.aside').ace_aside();
		
			$(document).one('ajaxloadstart.page', function(e) {
				//in ajax mode, remove before leaving page
				$('.modal.aside').remove();
				$(window).off('.aside');
			}); 
			
			//搜索
			$(".search-data").keyup(function () { 
				$table.search();
			});
			$("#_appId").change(function () { 
				$table.search();
           	});
            
			// 取消
			$("#_cancel").click(function(){
				$table.search();
			});
			
			//$("#my-modal-a").click();
		});
	});
</script>
