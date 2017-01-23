<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>新增合作产品-审核管理-系统管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript   " src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="infoForm" method="post" action="product_add_insure.html">
    <div class="ui-info-main">
        <ul class="ui-info-list ui-subjectmod-list">
          <li class="ui-info-item  no-topbor">
            <label class="ui-info-lbl">操作内容</label>
            <span>运营-新增合作产品请求</span>
          </li>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">分销商信息</h2>
          </li>
          <li class="ui-info-item ui-info-item-grey ">
            <div class="ui-info-subitem">
           		<label class="ui-info-lbl">分销商ID</label>
           		<span>${domainPo.domainId}</span>
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">分销商名称</label>
              <span>${domainPo.domainName}</span>
            </div>
         	</li>
          <li class="ui-info-item">
            <div class="ui-info-subitem ui-vtop">
              <label class="ui-info-lbl">合作时间</label>
              <span> ${domainPo.effTimestr}至${domainPo.expTimestr}</span>
            </div>
          </li>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">产品信息</h2>
          </li>
         	<li class="ui-info-item ui-info-item-grey ">
            <div class="ui-info-subitem">
           		<label class="ui-info-lbl">产品ID</label>
           		<span>${product.productId}</span>
           		<input type="hidden" name="auditId" value="${auditPo.auditId}" />
           		<input type="hidden" name="bizId" value="${domainPo.domainId},${product.productId}" />
           		
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">保险名称</label>
                <a class="operation-link" href="${base}/product/toProductDetailMsgs?productId= ${product.productId}"><font color="#00F">${product.productName}</font></a>
            </div>
         	</li>
          <li class="ui-info-item">
            <div class="ui-info-subitem ui-vtop">
              <label class="ui-info-lbl">产品总量</label>
              <span><#if product.maxQuantity == -1>
	         			不限
	         		<#else>
		         		${product.maxQuantity} 份
	         		</#if> </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">剩余数量</label>
              <span class="ui-red-text"><#if product.maxQuantity == -1>
	         			不限
	         		<#else>
		         		${product.shengyuQuantity} 份
	         		</#if></span> 
            </div>
          </li>
           <li class="ui-info-item">
          
             <h2 class="ui-info-tit">配置信息</h2>
          </li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">合作数量</label>
            <span class="ui-price-infor"> ${domainproducts.maxQuantity}</span>
			</li>
            <li class="mod-item ui-info-item ui-info-item-grey ui-infocheck-item">
             <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
            <span class="ui-price-inforcheck"> ${domainproducts.maxQuantityedit}</span>
         	</li>
          <li class="ui-info-item">
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">上架时间</label>
              <span class="ui-date-source"> ${domainproducts.effTimestr}</span>
               <div class="ui-info-subitem ui-infocheck-item ui-infocheck-item">
             <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
            
              <span class="ui-date-check"> ${domainproducts.effTimestredit}</span>
              </div>
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">下架时间</label>
              <span class="ui-date-source">${domainproducts.expTimestr}</span>
               <div class="ui-info-subitem ui-infocheck-item ui-infocheck-item">
             <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
              
              <span class="ui-date-check">${domainproducts.expTimestredit}</span></div>
            </div>
          </li>
        
         	<li class="ui-info-item">
             <h2 class="ui-info-tit">审核记录</h2>
          </li>
           	 <#list logPoList as item>
          <li class="ui-info-item ui-info-item-grey">
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">提交时间</label>
              <span>
			                ${item.reqTime1}
		              </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">操作员</label>
             <span>
		                ${item.reqNickname}
		              </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">审核状态</label>
              <span>
		                <#if item.auditSts == 0>
		                	待审核
		                </#if>
		                <#if item.auditSts == 1>
		                	审核通过
		                </#if>
		                <#if item.auditSts == -1>
		                	审核不通过
		                </#if>
		              </span> 
            </div>
          </li>
           <#if item.auditSts != 0>
          <li class="ui-info-item   ui-info-item-grey" >
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">审核时间</label>
              <span>
			                ${item.auditTime1}
			                <input type="hidden" name="auditTime1" value="${item.auditTime2}" />
			              </span> 
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">审核员</label>
             <span>
			                ${item.auditNickname}
			              </span> 
            </div>
          </li></#if>	
         	 <#if item.auditSts == -1>
			        <li class="ui-info-item">
			              <label class="ui-info-lbl">审核不通过理由</label>
			              <span>
			                ${item.auditComment}
			              </span> 
			        </li>
		        </#if>
         	
         	 </#list>
         	  <#if auditPo.auditSts==0>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">审核意见</h2>
          </li>
         
         	<li class="ui-info-item ui-info-item-grey  ui-audit-rdo">
         		  <input type="radio"  name="auditSts" value="1" class="easyui-validatebox"  data-options="required:true,validType:{radio:['auditSts']}"/><label>审核通过</label>
              <input type="radio" name="auditSts" value="-1"/><label>审核不通过</label>
         	</li>
          <li class="ui-info-item ui-audit-txta fn-hide">
              <textarea class="easyui-validatebox" placeholder="审核不通过理由"  name="auditComment"
                    data-options="required:true"  missingMessage="请输入审核不通过理由" id="reason"></textarea>
          </li>
          </#if>
        </ul>
  	</div>
    <div class="ui-btn-double">
    <#if auditPo.auditSts==0>
      <input type="button" onclick="saveproduct()" value="提交" class="ui-btn-blue"/>
      </#if>
      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
    </div>
   </form>
 <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">审核完成!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
   <div id="dlgn" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">操作成功,等待下一轮审核!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
	<script>
   $(function(){
    validExtend();
    checkInformate();
	});
   function saveproduct(){
 
   if($('#infoForm').form('validate')){
	 $.ajax({
	             url:'${base}/aduit/aduitPrice',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (data) {
                if(data.succ){
                 if(data.entity==null){
                    showAlert("dlg");
                 }else{
                  showAlert("dlgn");
                 }
					 
				}else{
					alert(data.entity);
				}
                 }
             });
	}}
	
   function tomain(){
          window.location.href="${base}/aduit/aduitview";
   }
   
   
	</script>
</body>
</html>