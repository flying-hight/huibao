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
    
     <!-- 表单一-->
    <div class="ui-info-main" id="frm1" style="display:block">
    <form id="infoForm" method="post" action="${base}/operate/findinfoProduct">
    <#list pList as item>
     <h2 class="ui-info-tit">产品信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${item.productId}
         		  <input   name="domainProductsMap['${item.productId}${item_index}'].productId" type="hidden" value="${item.productId}">
         		   <input   name="domainProductsMap['${item.productId}${item_index}'].domainId" type="hidden" value="${item.domainId}">
         	    <label class="ui-info-lbl">保险名称</label>
         		  <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId=${item.productId}"><font color="#00F">${item.productName}</font></a>
         	    <label class="ui-info-lbl">上架渠道</label>
         	   		 ${item.domainName}
         	  
         	  
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
         		  
         	</li>
        </ul>
         <#if item.dppList?if_exists>
         <h2 class="ui-info-tit">定价记录</h2>
          <ul class="ui-info-list">
           <#list item.dppList as dpitem>
         	<li class="ui-info-item ui-info-item-grey">
         	  <label class="ui-info-lbl">开始日期</label>
         		  ${dpitem.effTimestr}
         	   <label class="ui-info-lbl">结束日期</label>
         		  ${dpitem.expTimestr}
         	    <label class="ui-info-lbl">折扣度</label>
         		  ${dpitem.discountRate}%
         	</li> 
         </#list>
        </ul>
         <#else> <h2 class="ui-info-tit">定价记录:无</h2> </#if>
      <h2 class="ui-info-tit">定价信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
         		 ${item.discount}%
         		 <input   name="domainProductsMap['${item.productId}${item_index}'].discountRate" type="hidden" value="${item.discount}"/> 
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">开始日期</label>
         		<input   name="domainProductsMap['${item.productId}${item_index}'].effTimestr" type="hidden" value="${item.effDate}"/>
         		 ${item.effDate}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         	 <input   name="domainProductsMap['${item.productId}${item_index}'].expTimestr" type="hidden" value="${item.expDate}"/>
         		<label class="ui-info-lbl">结束日期</label>
         		 ${item.expDate}
         	</li>
  	        
        </ul>
         </#list>
	    <div class="ui-btn-double">
	      <input type="button" value="完成"  class="ui-btn-blue"  onclick="domainok()"/>
	      <input type="button" value="返回修改"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
    
    <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">您新增产品定价的请求已提交审核!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
    
	<script>
          function domainok(){
             $.ajax({
                 url: '${base}/operate/addMarkProduct',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("dlg");
                     }else{
                       showAlert("dlgm");
                     }
                 }
             });
   }
   
   function tomain(){
   window.location.href="${base}/operate/markView";
   }
	</script>
</body>
</html>