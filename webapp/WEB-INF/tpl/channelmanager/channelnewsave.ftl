<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>产品新增合作渠道</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>

</head>

<body style="">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>

		<div class="ui-datagrid-wrap">
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
			<div class="search-wrap">
				<div class="ui-base-colsinfor">
					已合作分销渠道：<em>E保APP</em><em>京东商城</em>
				</div>

				<div class="ui-detail-show">
                	<div class="ui-base-colsinfor ui-base-colwidth-business">
     					<label class="ui-base-label ui-channel-base-label">分销渠道:</label>
 						<span class="ui-base-data" id="cdetailName">京东商城</span>
         			</div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-channel-base-label">最大数量:</label>
                        <span class="ui-base-data" id="cdetailNum">999份</span>
                    </div>
                   <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-channel-base-label">上架时间:</label>
                       <span class="ui-base-data" id="cdetailDateStart">2015-04-20 12:22:20</span>
                    </div>   
                     <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-channel-base-label">下架时间:</label>
                        <span class="ui-base-data" id="cdetailDateEnd">2015-04-20 12:22:20</span>
                    </div>
                    <div class="ui-detail-btnposition">
                        <input type="button" value="完成并提交审核" class="ui-btn-blue ui-submit ui-detail-bntwidth" onclick="showAlert('dlg')"/>
                        <input type="button" value="返回修改"  class="ui-btn-grey ui-back ui-detail-bntwidth"/>
                    </div> 
                </div>
			</div>
		<!--提示添加成功start-->
            <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
               <h3 class="ui-dlg-tit">您新增合作渠道的请求已提交审核！</h3>
               <input type="button" class="ui-dlgOk-btn" value="查看审核详情" id="contentDelete"/>
             </div>
        <!--提示添加成功end-->
			
		</div>
	</div>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script>
	$(function(){
		validExtend();
		//列表
		$("#dg-list").datagrid({
			url:'channel_neweditor.json',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,//当数据长度超出列宽时将会自动截取
			resizable:false,
			checkOnSelect:false,
			columns:[[
				{field:'agentAreaCity',align:'center',width:"14%",title:'产品ID'},
				{field:'agentAreaCityName',align:'center',width:"14%",title:'保险名称'},
				{field:'truename',align:'center',width:"14%",title:'保险公司'},
				{field:'agentAreaCounty',align:'center',width:"14%",title:'产品总量'},
				{field:'agentId',align:'center',width:"14%",title:'保费金额(元)'},
				{field:'agentProduceName',align:'center',width:"14%",title:'保险类别'},
				{field:'agentProduceCount',align:'center',width:"14%",title:'来源'}
			]],
			queryParams: eb.form2Json("search-ff"),
		   loadFilter:function(data){
	            return eb.loadFilter(data);    //自定义过滤方法
	      },
      onLoadSuccess:pageCls
		});
		
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