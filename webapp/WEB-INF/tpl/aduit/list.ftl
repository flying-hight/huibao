
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>系统管理-审核管理-审核员管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	
	
</head>

<body style="">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
		<div class="ui-datagrid-wrap">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form">
				<ul class="search-list fn-clear">
				
							<li class="date">
							<label class="name ui-change-item-label">提交日期：</label>
								<input id="startTime" name="effTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#endTime']">
							  <em class="ui-channel-titcolor">至</em>
							  <input id="endTime" name="expTimestr" class="easyui-datebox" data-options="editable:false" vlaue="" validType="md['#startTime']">
						</li>
						
						<li>
							<label class="name">操作类型</label>
							<select class="ui-combobox" name="itemType" id="itemType">
								<option value="">全部</option>
								<option value="11">新增</option>
								<option value="12">修改</option>
								<option value="13">删除</option>
							</select>
						</li>
						<li>
							<label class="name">审核状态</label>
							<select class="ui-combobox" name="auditSts" id="auditSts">
								<option value="">全部</option>
								<option value="0" selected ="selected">待审核</option>
								<option value="-1">审核不通过</option>
								<option value="1" >审核通过</option>
							</select>
						</li>
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">搜索</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="clearForm()">重置</a>
						</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item list-noadd fn-clear">
				<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
		</div>
	</div>
	
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'${base}/aduit/aduitListView',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'auditId',align:'center',width:"10%",title:'操作流水号',styler:function(value,rowData,rowIndex){
 		var html='cursor:pointer;color:blue';
 		return html;
			} },
				{field:'reqTime',align:'center',width:"15%",title:'提交时间',
					formatter:function(value,rec){
					    return formatTimestamp(rec.reqTime);
					}},
				{field:'reqNickname',align:'center',width:"15%",title:'操作员'},
				{field:'itemType',align:'center',width:"13%",title:'操作类型',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.itemType == 11){
							str = "新增";
						}if(rec.itemType == 12){
							str = "修改";
						}if(rec.itemType == 13){
							str = "删除";
						}
						return str;
					}},
					{field:'itemName',align:'center',width:"15%",title:'操作内容'},
					{field:'auditTime',align:'center',width:"14%",title:'审核时间',sortable:true,
					formatter:function(value,rec){
					    return formatTimestamp(rec.auditTime);
					}},
					
					{field:'auditSts',align:'center',width:"15%",title:'审核状态',
				formatter:function(value,rec){
						 var str = "其他";
						if(rec.auditSts == 0){
							str = "待审核";
						}if(rec.auditSts == -1){
							str = "审核不通过";
						}if(rec.auditSts == 1){
							str = "审核通过";
						}
						return str;
					}}
				
			]],
	onClickCell:function(rowIndex, field, value){
if(field=='auditId'){
window.location.href="${base}/aduit/findAuditInfo?auditId="+value;

}
},

			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      },
      onLoadSuccess:pageCls
		});
		//分页
		pageAction();
		
   });
	</script>
</body>
</html>