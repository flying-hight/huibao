<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>分销商信息管理</title>
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
						<li>
							<label class="name ui-change-item-label">产品ID：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="20"/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">保险名称：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="40"/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">承保公司：</label>
							<select class="ui-combobox" name="" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="">人保</option>
								<option value="">太平洋</option>
							</select>	
						</li>
						<li>
							<label class="name ui-change-item-label">审核状态：</label>
							<select class="ui-combobox" name="" id="transaceAmount">
								<option value="" selected ="selected">全部</option>
								<option value="">待审核</option>
								<option value="">审核未通过</option>
								<option value="">审核通过</option>
							</select>	
						</li>	
					</ul>
					<ul class="search-list fn-clear">
						<li class="date">
							<label class="name ui-change-item-label">上下架时间：</label>
								<input class="easyui-datetimebox datetimeboxEnd" style="width:180px" id="">
							    <em class="ui-channel-titcolor">至</em>
							    <input class="easyui-datetimebox datetimeboxEnd" style="width:180px" id="">
						</li>
						<li>
							<label class="name ui-change-item-label">分销商配额：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="10"/></span>
						</li>
						<li>
							<label class="name ui-change-item-label">分销商剩余配额：</label>
							<span class="textbox"><input class="textbox-text textbox-prompt" type="text" maxlength="10"/></span>
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
			<div class="list-item fn-clear">
				<a href="channelproducenew.html" class="search-btn">新增合作产品</a>
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
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
			url:'channel_produce.json?date='+new Date().getTime(),
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			//idField:'userid',//id字段
			//sortName:'userid',//当数据表格初始化时以哪一列来排序
			//sortOrder:'desc',//'asc'/'desc'（正序/倒序）
			//remoteSort: false,//定义是否通过远程服务器对数据排序
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			title: "标题",
			columns:[[
				{field:'agentAreaCity',align:'center',width:"10%",title:'产品ID',sortable:true},
				{field:'agentAreaCityName',align:'center',width:"20%",title:'保险名称'},
				{field:'truename',align:'center',width:"10%",title:'承保公司'},
				{field:'agentAreaCounty',align:'center',width:"10%",title:'分配商配额<br/>(份)'},
				{field:'agentId',align:'center',width:"14%",title:'分销商剩余配额<br/>(份)'},
				{field:'agentProduceName',align:'center',width:"10%",title:'审核状态',
					formatter:function(value,rec){
						
							return '<a class="detail-link" href="editorsavechannel.html">'+value+'</a>';
					}
				},
				{field:'agentProduceCount',align:'center',width:"11%",title:'上架时间'},
				{field:'agentProducePending',align:'center',width:"11%",title:'下架时间'}
			]],
			queryParams: eb.form2Json("search-ff"),
	   loadFilter:function(data){
				var beginDate=$("input[name=startDateTime]").val(),
				    endDate=$("input[name=endDateTime]").val();
				var allBalance=!isNaN(Number(data.message))?(Number(data.message)/100).toFixed(2):"0.00";

				var titleHtml='<div class="query-result-title"><span class="query-result-span">分销商ID：001分销商名称：京东商城</span><span class="query-result-span">合作时间：2014-01-01 至 2014-01-01</span>'
				+'<span class="query-result-span">总计合作产品：<em class="query-result-num">20</em>个,其中审核通过<em class="query-result-num">15</em>个，待审核<em class="query-result-num">4</em>个，审核未通过<em class="query-result-num">1</em>个</span>'+
				'</div>';
				$(".panel-title").html(titleHtml);
				$(".panel-title").show();
	            return eb.loadFilter(data);//自定义过滤方法

      },
      onLoadSuccess:pageCls
		});
		//分页
		pageAction();
		
   });
	function submitForm(){
		if($('#search-ff').form('validate')){
			    //eb.backToFstPage("#datagrid");
				$("#dg-list").datagrid({queryParams : eb.form2Json("search-ff")});
				
				 pageAction();
			}
	}
	function clearForm(){
		$("#search-ff").form('clear');
	}
	
	</script>
</body>
</html>