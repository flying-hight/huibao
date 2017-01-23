<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>查看产品合作分销商</title>
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
			<!-- 列表 -->
			<div class="list-item fn-clear">
				<table id="dg-list" class="easyui-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
			<!-- 列表end -->
			<div class="">
                <h4 class="ui-info-tit"></h4>
                <form>
         			<div class="ui-base-colsinfor ui-base-colwidth-business">
     					<label class="ui-base-label ui-channel-base-label">分销渠道:</label>
 						<span class="ui-base-data" id="edetailName">京东商城</span>
         			</div>
     
   
                    <div class="ui-base-colsinfor ui-base-colwidth-business">
                        <label class="ui-base-label ui-infor-width">合作数量:</label>
                        <span class="ui-base-data">
                            <input class="clause-input ui-channel-inforspan easyui-validatebox ui-cover" type="text" name="phone"  data-options="required:true,validType:['plusIntOther']" missingMessage="请输入合作数量" />份
                        </span>
                        
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base ui-newcontent-item">
                        <label class="ui-base-label ui-infor-width">上架时间:</label>
                        <span class="ui-base-data">
                             <input class="easyui-datetimebox" style="width:300px" id="datetimeStart">
                        </span>
                       <div class="predent-textarea ctooltip-bottom custom-month-position custom-tool-left4" id="clientTimeStart" v>
                           <span class="custom-textarea-tooltip custom-txt-style">请输入上架时间</span>
                           <div class="ctooltip-arrow-outer custom-triange-outstyle" style=""></div>
                           <div class="ctooltip-arrow custom-triange-intstyle" style=""></div>
                       </div>
                    </div>
                    <div class="ui-base-colsinfor ui-base-colwidth-business ui-month-base ui-newcontent-item">
                        <label class="ui-base-label ui-infor-width">下架时间:</label>
                        <span class="ui-base-data">
                             <input class="easyui-datetimebox" style="width:300px" id="datetimeEnd">
                        </span>
                        <div class="predent-textarea ctooltip-bottom custom-month-position custom-tool-left4" id="clientTimeEnd" v>
                           <span class="custom-textarea-tooltip custom-txt-style">请输入下架时间</span>
                           <div class="ctooltip-arrow-outer custom-triange-outstyle" style=""></div>
                           <div class="ctooltip-arrow custom-triange-intstyle" style=""></div>
                       </div>

                    </div>
                    <div class="ui-detail-btnposition">
                        <input type="button" value="完成并提交审核" class="ui-btn-blue ui-submit ui-detail-bntwidth" id="produceSave"/>
                        <input type="button" value="取消"  class="ui-btn-grey ui-back ui-detail-bntwidth"/>
                    </div>
                </form>
            </div>
		</div>
		<!--提示添加成功start-->
            <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
               <h3 class="ui-dlg-tit">您编辑产品合作分销商的请求已提交审核！</h3>
               <input type="button" class="ui-dlgOk-btn" value="查看审核详情" id="contentDelete"/>
             </div>
        <!--提示添加成功end-->
	</div>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/base.js"></script>
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


		$("#produceSave").click(function(event) {

            var datastart = $("#datetimeStart"),
                dataend = $("#datetimeEnd"),
                valstart = datastart.datetimebox('getValue'),
                valend = dataend.datetimebox('getValue'),
                isnull = true;

            if(valstart == ""){
                 $("#clientTimeStart").show();
                isnull = false;
            }else{
                   $("#clientTimeStart").hide();
                 isnull = true;
            }   
            if(valend == ""){
                $("#clientTimeEnd").show();
                isnull = false;

            }else{
                 $("#clientTimeEnd").hide();
                isnull = true;
            }    
         })
		
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