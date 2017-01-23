<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-产品上架管理-产品信息</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <a href="javascript:history.go(-1);" class="search-btn">重新选择</a>
    </div>
    
     <!-- 表单一-->
    <div class="ui-info-main" id="frm1" style="display:block">
    <form id="infoForm" method="post" action="${base}/operate/findinfoDomainProduct">
    
     <h2 class="ui-info-tit">分销商信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">分销商ID</label>
         		  ${domainPo.domainId}
         		  <input   name="domainId" type="hidden" value="${domainPo.domainId}">
         	    <label class="ui-info-lbl">分销商名称</label>
         	     ${domainPo.domainName}
         	     <label class="ui-info-lbl">合作时间</label>
         	     ${domainPo.effTimestr}至${domainPo.expTimestr}
         	</li>
        </ul>
    <#list pList as item>
     <h2 class="ui-info-tit">产品${item_index +1}</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${item.productId}
         		  <input   name="domainProductsMap['${item.productId}'].productId" type="hidden" value="${item.productId}">
         	    <label class="ui-info-lbl">保险名称</label>
         		 
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId=${item.productId}"><font color="#00F">${item.productName}</font></a>
         	    <label class="ui-info-lbl">产品总量</label>
         		   <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.maxQuantity}
         		  </#if>
                <label class="ui-info-lbl">剩余数量</label>
         		    <#if item.maxQuantity==-1>
         		      不限
         		  <#else> ${item.shengyuQuantity}
         		  </#if>
         		  <input   id="checknumber${item.shengyuQuantity}" type="hidden" value=" ${item.shengyuQuantity}">
         	</li>
        </ul>
      <h2 class="ui-info-tit">配置信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">当前库存</label>
         		<input   type="text"  name="domainProductsMap['${item.productId}'].domainQuantity" readonly="true"  value="${item.domainQuantity}" class="easyui-validatebox ui-info-input"> 份
         	</li>
         	
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">分配数量</label>
         		<input  name="domainProductsMap['${item.productId}'].maxQuantity" type="text" maxlength=10  onKeyUp="this.value=this.value.replace(/\D/g,'');if(parseInt(this.value)>=0) $('#countall${item.productId}').val(parseInt(this.value)+${item.domainQuantity}) "  onafterpaste="this.value=this.value.replace(/\D/g,'')" value="" class="easyui-validatebox ui-info-input" data-options="required:true,validType:['plusNum','limitNum(\'${item.shengyuQuantity}\')']"/> 份
         	<#if item.maxQuantity==-1>
         	*分配数量不限
         	  <#else> 
              <font color="#FF0000">*分配数量最多为${item.shengyuQuantity}份</font>
         		  </#if>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">库存总量</label>
          <input   type="text" id="countall${item.productId}"   readonly="true"  value="${item.domainQuantity}" class="easyui-validatebox ui-info-input"> 份
         	</li>
         	<li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">上架时间</label>
         		<input id="startime${item_index+1}" name="domainProductsMap['${item.productId}'].effTimestr"    class="easyui-datetimebox ui-info-input date-timestart" data-options="editable:false" vlaue="" >
         		<span class="showMessage"></span>
         	</li>
         	 <li class="ui-info-item ui-info-item-grey ui-month-base">
         		<label class="ui-info-lbl">下架时间</label>
         		<input id="endtime${item_index+1}" name="domainProductsMap['${item.productId}'].expTimestr"   class="easyui-datetimebox ui-info-input date-timeend" data-options="editable:false" vlaue="" validType="mdMs['#startime${item_index+1}']">
         		<span class="showMessage"></span>
         	</li>
  	        
        </ul>
         </#list>
	    <div class="ui-btn-double">
	      <input type="submit" value="下一步" class="ui-btn-blue ui-submit" />
	      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
    <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">库存不足！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
	<script>
	  $(function(){
	    validExtend();
	   	richEdit();
	    prodProfit();
	    $('.ui-submit').click(function(){
	      var f=$(this).parents('form'),isflag = checkDate(f);
	      if(f.form('validate') && isflag){
	       f.submit();
	      }else{
	      	return false;
	      } 
	     
	    });
	});
	function checkNumber(obj,value,temp,id){
	var first=document.getElementById("checknumber"+temp).value;
	if(parseInt(value)>parseInt(first)){
     showAlert("dlgm");
     obj.focus();
     obj.select();
     window.setTimeout( function(){ obj.focus();obj.select(); }, 0); 
     return false;
	}
	
	}
	
	$('#startime1').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime1').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
	 $('#startime2').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime2').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
	 $('#startime3').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime3').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#startime4').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime4').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#startime5').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
      $('#endtime5').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
	</script>
</body>
</html>