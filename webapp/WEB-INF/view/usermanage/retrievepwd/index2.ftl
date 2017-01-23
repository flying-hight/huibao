<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理-人工找回审核</title>
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datagrid.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
</head>

<body>
  <div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	    <#include "/common/include/power.ftl">
		<#--<a class="crumbs-link" href="#">用户管理 <span>></span></a>
		<a class="crumbs-link" href="#">人工找回审核 <span>></span></a>
		<span class="crumbs-tit">人工找回审核</span>-->
	</div>
	<div class="ui-list-content">
	<!-- 搜索 -->
	<div class="search-item">
		<form name="searchform" method="get" action="" id ="searchform" class="ui-search-form">
			<input type="hidden" id="reviewPhase" name="reviewPhase"  value="${reviewPhase}"/>
			<ul class="search-list fn-clear">
				<li>
					<span class="name">用户ID：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt intOnly" type="text" name="userId" value=""  maxlength=19/></span>
				</li>
				<li>
					<span class="name">账户名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120  type="text" name="username" value=""/></span>
				</li>
				<li>
					<span class="name">实名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="realName" value=""/></span>
				</li>
				<li class="btn-group">
					<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_search" >搜 索</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton search-btn" id="submit_reset">重 置</a>
				</li>
			</ul>
			<ul class="search-list fn-clear">
				<li>
					<span class="name">电话号码：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120  type="text" name="enterprisePhone" value=""/></span>
				</li>
			
				<li>
					<span class="name">法人姓名：</span>
					<span class="textbox"><input class="textbox-text textbox-prompt" maxlength=120 type="text" name="businessLegal" value=""/></span>
				</li>
				<li>
					<span class="name">找回种类：</span>
					<select class="seaway-combobox" name="operType" >
						<option value="">全部</option>
						<#if findOperType?has_content>
							<#list findOperType as cl>
								<option value="${cl.key?if_exists}">${cl.value?if_exists}</option>
							</#list>
						</#if>
					</select>
				</li>
			    <li>
					<span class="name">审核状态：</span>
					<select class="seaway-combobox" name="reviewState" >
						
						<option value="0">待审核</option>
					<option value="1">已审核</option>		
					<option value="2">全部</option>				
					</select>
				</li>
			</ul>
			<input type="hidden" name="sort" value="userId"/>
			<input type="hidden" name="order" value="desc"/>
		</form>
		<input type="hidden" id="excel-data"/>
	</div>
	<!-- 搜索end -->
	<!-- 列表 -->
	<div class="list-item fn-clear ui-relative">
		 ${fButton(list, 'EXPORTEXCEL','<a href="javascript:doExcel(\'@URL@\');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>')} 
	    <#--<a href="javascript:doExcel('/userManage/retrievePwd/retrieveList2Excel/${reviewPhase}');" class="ui-excel ui-add-pos">[导出EXCEL表格]</a>-->
		<table id="userList" class="easyui-tab" width="100%">
		</table>
		<div class="ui-nodata fn-hide">
		  <img src="/images/nodata.png"/>
		  <span>暂无数据</span>
		</div>
	</div>
	<!-- 列表end -->
  </div>
 </div> 
	<script>
	$(function(){
	$("#userList").datagrid({
		url:'/userManage/retrievePwd/selectRetrieveList2',
		method:'get',
		fitColumns:true,
		rownumbers:true,
		nowrap: true,//当数据长度超出列宽时将会自动截取
		idField:'userId',//id字段
		sortName:'userId',//当数据表格初始化时以哪一列来排序
		sortOrder:'desc',//'asc'/'desc'（正序/倒序）
		pageSize:20,
		remoteSort: true,//定义是否通过远程服务器对数据排序
		resizable:false,
		checkOnSelect:false,
		pagination:true,
		pagePosition:top,
		columns:[[
			{field:'userId',align:'center',width:"12%",title:'用户ID',sortable:true,
				formatter:function(value,rec){
				   return pad(rec.userId, 6);
				}
			},
			{field:'username',align:'center',width:"15%",title:'账户名'},
			{field:'realName',align:'center',width:"13%",title:'实名'},
			{field:'businessLegal',align:'center',width:"14%",title:'法人姓名'},
			{field:'operTypeName',align:'center',width:"15%",title:'找回种类'},
			{field:'auditStateName',align:'center',width:"15%",title:'状态'},			
			{field:'opt',align:'center',width:"15%",title:'操作',
				formatter:function(value,rec){
				  var html='';
				  if((${reviewPhase}==0&&rec.auditState==10)||(${reviewPhase}==1&&rec.auditState==20)){
				     html='${fButton(list, 'DETAILS','<a class="operation-link" href="@URL@?id=\'+rec.id+\'">[审核]</a>')}'
				    //html='<a class="operation-link" href="/userManage/retrievePwd/selectEnterRetrievePwd/${reviewPhase}?id='+rec.id+'">[审核]</a>';
				  }
			        return  html;
				}
			}
		]],
	    queryParams: form2Json("searchform"),
	    loadFilter:function(data){
            return loadFilter(data);    //自定义过滤方法
         }
	});
    $("#userList").datagrid("getPager").pagination({
		    pageSize:20,
		    displayMsg:"",
		    layout:['list','sep','prev','links','next','manual'],
		    showPageList:false
		 });
	 function loadFilter(data) {
//console.log(data);
	var value = {
		total: data.succ?data.entity.totalItems:0,
		rows: []
	};
	if(data.succ){
	for (var i = 0; i < data.entity.items.length; i++) {
		var o = {};
		_loadArray(data.entity.items[i], o, "");
		value.rows.push(o);
	}
	}
	if( data.entity.items.length==0){
		   $('.ui-nodata').removeClass('fn-hide');
		   $('.datagrid-pager').css('visibility','hidden');
		}else{
		   $('.ui-nodata').addClass('fn-hide');
		   $('.datagrid-pager').css('visibility','visible');
	}
	return value;
}

function _loadArray(data, o, pre) {
	if (pre)
		pre = pre + ".";
	for (var att in data) {
		var row = data[att];
		if (typeof(row) == "object") {
			_loadArray(row, o, pre + att);
		} else {
			o[pre + att] = row;
		}

	}
}
function form2Json(id) {
       var arr = $("#"+id).serializeArray()
       var jsonStr = "";
       jsonStr += '{';
        $.each(arr, function(i, field){
           if(field.value){
            jsonStr += '"' + field.name + '":"' + field.value + '",'
           }
        });
        jsonStr = jsonStr.length>1?jsonStr.substring(0, (jsonStr.length - 1)):jsonStr;
         jsonStr += '}';
          var exdata=$("#"+id).serialize();
	        $('#excel-data').val(exdata);
        var json = $.parseJSON(jsonStr);
        return json
}

$("#submit_search").click(function () {
	 var listId=$('.easyui-tab').attr('id');
     $("#"+listId).datagrid({ queryParams: form2Json("searchform") });   //点击搜索
});
$("#submit_reset").click(function(){
    $(this).parents("form").get(0).reset();
    /*$(this).parents("form").find('select').each(function(index){
    	  var optidx='';
    	  $(this).find('option').each(function(opt){
    	  	if($(this).val()==''){
               optidx=opt;
               return;
    	  	}
    	  });
          
    });*/
  
  //$.fn.combo.methods.reset($('.combo-p'));
  });

	});
	</script>
</body>
</html>