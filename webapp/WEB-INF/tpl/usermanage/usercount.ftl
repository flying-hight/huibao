<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>无标题文档</title>
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

		<div class="ui-datagrid-wrap ui-datagrid-wrap-mgt">
			<!-- 搜索 -->
			<div class="search-wrap">
				<form  id="search-ff" class="ui-search-form" action="${base}/user/findUserCount">
					<ul class="search-list fn-clear ui-usermanager">
						<li class="date">
							<label class="name">统计时间</label>
								<input id="startTime" class="easyui-datebox" data-options="editable:false" value="${startDateTime}" validType="mdMonth['#endTime']" name="startDateTime">
							  <em class="name">至</em>
							  <input id="endTime" class="easyui-datebox" data-options="editable:false" value="${endDateTime}" validType="mdMonth['#startTime']" name="endDateTime">
						</li>
						<li class="btn-group">
							<a href="javascript:void(0)" class="search-btn" onclick="submitForm()">统计</a>
				    		<a href="javascript:void(0)" class="search-btn" onclick="javascript:reSet();">重置</a>
						</li>
					</ul>
				</form>
			</div>
			<!-- 搜索end -->
			<!-- 列表 -->
			<div class="list-item fn-clear">
				
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
			url:'${base}/user/findUserCount',
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
				{field:'time',align:'center',width:"30%",title:'日期'},
				{field:'con1',align:'center',width:"30%",title:'新增用户数',sortable:true},
				{field:'con2',align:'center',width:"30%",title:'购买用户数',sortable:true}
			]],
			queryParams: eb.form2Json("search-ff"),
	   		loadFilter:function(data){
				var beginDate=$("input[name=startDateTime]").val(),
				    endDate=$("input[name=endDateTime]").val();
				var allBalance=!isNaN(Number(data.message))?(Number(data.message)/100).toFixed(2):"0.00";
				var userCount = 0;
				var tradeCount = 0;
				var userTotalCount = 0;
				if (data.total != 0){
					userCount = data.records[0].userCount;
					tradeCount = data.records[0].tradeCount;
					userTotalCount = data.records[0].userTotalCount;
				}
				var titleHtml='<div class="query-result-title"><span class="query-result-span">截止至'+endDate+
					'</span><span class="query-result-span">累计用户数：<em class="query-result-num">'+userTotalCount+
					'</em></span></br><span class="query-result-span">统计时间'+beginDate+'至'+endDate+
					'</span><span class="query-result-span">总计新增用户数：<em class="query-result-num">'+
					userCount+'</em>,总计购买用户数：<em class="query-result-num">'+tradeCount+
					'</em></span>'+
				'</div>';
				$(".panel-title").html(titleHtml);
				$(".panel-title").show();
	            return eb.loadFilter(data);//自定义过滤方法
      },
	      onLoadSuccess:function(){
	      		pageCls();
	      		sortCell(['con1','con2']);//排序要显示箭头的，以数组形式传
	      }
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
	function reSet(){
		location.href = "${base}/user/toUserCount";
	}
	</script>
</body>
</html>