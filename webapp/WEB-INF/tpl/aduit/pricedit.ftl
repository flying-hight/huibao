<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>编辑产品定价-审核管理-系统管理</title>
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
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="infoForm" method="post" action="">
    <div class="ui-info-main">
        <ul class="ui-info-list ui-subjectmod-list">
          <li class="ui-info-item  no-topbor">
            <label class="ui-info-lbl">操作内容</label>
            <span>运营-编辑产品定价请求</span>
          </li>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">编辑详情</h2>
          </li>
          <li class="ui-info-item">
             <h2 class="ui-info-subtit">产品信息</h2>
          </li>
         	<li class="ui-info-item ui-info-item-grey ">
            <div class="ui-info-subitem">
           		<label class="ui-info-lbl">产品ID</label>
           		<span>${product.productId}</span>
           		<input type="hidden" name="bizId" value="${product.productId}" />
           		<input type="hidden" name="auditId" value="${auditPo.auditId}" />
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
		         		${product.shengyuQuantity} 份
	         		</#if></span>
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">剩余数量</label>
            <span class="ui-red-text">   <#if product.maxQuantity == -1>
	         			不限
	         		<#else>
		         		${product.shengyuQuantity} 份
	         		</#if></span>
            </div>
          </li>
         <#if priceList?if_exists>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">定价记录</h2>
          </li>
            <#list priceList as dpitem>
         	<li class="ui-info-item ui-normal-lbl  ui-info-item-grey">
         		<label class="ui-info-lbl">开始日期</label>
         		  ${dpitem.effTimestr}
         	   <label class="ui-info-lbl">结束日期</label>
         		  ${dpitem.expTimestr}
         	    <label class="ui-info-lbl">折扣度</label>
         		  ${dpitem.discountRate}%
         	</li>
         	 </#list>
         	  <#else> <h2 class="ui-info-tit">定价记录:无</h2> </#if>
           <li class="ui-info-item">
           <h2 class="ui-info-tit">定价信息</h2>
          </li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">折扣度</label>
            <span class="ui-price-infor">${domainproduct.discountRate}%</span>
         	</li>
         	<li class="mod-item ui-info-item ui-info-item-grey ui-infocheck-item">
                <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
                <span class="ui-org-text ui-price-inforcheck">${domainproduct.discountRateedit}%</span>
             </li>
         	
          <li class="ui-info-item">
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">开始时间</label>
              <span class="ui-date-source">${domainproduct.effTimestr}</span>
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">结束时间</label>
              <span class="ui-date-source">${domainproduct.expTimestr}</span>
            </div>
          </li>
         <li class="ui-info-item">
            <div class="ui-info-subitem ui-infocheck-item ui-infocheck-item">
              <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
              <span class="ui-org-text ui-date-check">${domainproduct.effTimestredit}</span>
            </div>
            <div class="ui-info-subitem ui-infocheck-item ui-infocheck-item">
              <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
              <span class="ui-org-text ui-date-check">${domainproduct.expTimestredit}</span>
            </div>
          </li>
           <#if logPoList?if_exists>
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
          <li class="ui-info-item">
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
          </li>
         	 <#if item.auditSts == -1>
			        <li class="ui-info-item  ui-info-item-grey">
			              <label class="ui-info-lbl">审核不通过理由</label>
			              <span>
			                ${item.auditComment}
			              </span> 
			        </li>
		        </#if>
         	 </#if>
         	 </#list>
         	   <#else>  <h2 class="ui-info-tit">审核记录:无</h2></#if>
         	    <#if auditPo.auditSts==0>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">审核意见</h2>
          </li>
         
         	<li class="ui-info-item ui-info-item-grey  ui-audit-rdo">
         		  <input type="radio"  name="auditSts" value="1" class="easyui-validatebox"  data-options="required:true,validType:{radio:['auditSts']}"/><label>审核通过</label>
              <input type="radio" name="auditSts" value="-1"/><label>审核不通过</label>
         	</li>
          <li class="ui-info-item ui-audit-txta fn-hide">
              <textarea class="easyui-validatebox" name="auditComment" placeholder="审核不通过理由" 
                    data-options="required:true" MsingMessage="请输入审核不通过理由" id="reason"></textarea>
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
 		}
   
	}
	 function tomain(){
          window.location.href="${base}/aduit/aduitview";
   }
   
	</script>
</body>
</html>