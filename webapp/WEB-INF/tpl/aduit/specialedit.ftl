<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>编辑专题-审核管理-系统管理</title>
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
    <form id="infoForm" method="post" action="product_add_insure.html">
    <div class="ui-info-main">
        <ul class="ui-info-list ui-subjectmod-list">
          <li class="ui-info-item  no-topbor">
            <label class="ui-info-lbl">操作内容</label>
            <span>运营-编辑专题请求</span>
          </li>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">编辑详情</h2>
          </li>
         	<li class="ui-info-item ui-info-item-grey">
            <div class="ui-info-subitem ui-vtop">
           		<label class="ui-info-lbl">专题策略编号</label>
           		<span>${specialPo.specialId}</span>
           		<input type="hidden" name="auditId" value="${auditPo.auditId}" />
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">专题名称</label>
              <span class="ui-price-infor">${specialPo.specialName}</span>
               <div class="ui-info-subitem ui-infocheck-item">
              
              <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
              
              <span class="ui-price-inforcheck">${specialPo.specialNameedit}</span>
              </div>
              
            </div>
         	</li>
         	<li class="ui-info-item ">
         		<label class="ui-info-lbl">专题说明</label>
            <span class="ui-price-infor">${specialPo.specialIntro}</span>
            <label class="ui-info-lbl"></label>
            <div class="ui-info-subitem ui-infocheck-item">
             <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
            <span class="ui-price-inforcheck">${specialPo.specialIntroedit}</span>
            </div>
         	</li>
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">专题图片</label>
            <div class="mod-item-img">
           		<img src="${specialPo.specialLogo3}" class="ui-pictures" width='192' height='137'/>
            </div>
            <label class="ui-info-lbl"></label>
            <div class="mod-item-img ui-info-subitem ui-infocheck-item">
            	 <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
           		<img src="${specialPo.specialLogo3edit}" class="ui-pictures-check" width='192' height='137'/>
            </div>
         	</li>
          <li class="ui-info-item">
             <h2 class="ui-info-tit">关联产品</h2>
          </li>
          <li class="ui-info-item ui-submod-tab-item">
           <#list productList as item>
            <table class="ui-submod-tab" width="100%">
              <tr class="ui-submod-tab-tit">
                <td width='10%'>产品ID</td>
                <td width='15%'>保险名称</td>
                <td>保险公司</td>
                <td>保费金额(元)</td>
                <td>保费类别</td>
                <td>来源</td>
              </tr>
              <tr class="ui-submod-tr-grey">
                <td>${item.productId}</td>
                <td><a class="operation-link" href="${base}/operate/getProductInfo?pid= ${item.productId}"><font color="#00F">${item.productName}</font></a></td>
                <td>${item.insurerName}</td>
                <td> ${item.minPremium/100}(元)-${item.maxPremium/100}(元)</td>
                <td>${item.className}</td>
                <td>  <#if item.productSource==1>自研<#else>保险公司</#if></td>
              </tr>
              <tr class="ui-submod-tr-recom">
                <td><strong>推荐语</strong></td>
                <td><span>${item.productRecommend}</span></td>
                <td colspan="6"></td>
              </tr>
            </table>
             </#list>
          </li>
           <li class="ui-info-item">
             <h2 class="ui-info-tit">编辑后关联产品</h2>
          </li>
           <li class="ui-info-item ui-submod-tab-item">
           <#list productListedit as item>
            <table class="ui-submod-tab" width="100%">
              <tr class="ui-submod-tab-tit">
                <td width='10%'>产品ID</td>
                <td width='15%'>保险名称</td>
                <td>保险公司</td>
                <td>保费金额(元)</td>
                <td>保费类别</td>
                <td>来源</td>
              </tr>
              <tr class="ui-submod-tr-grey">
                <td>${item.productId}</td>
                <td><a class="operation-link" href="${base}/operate/getProductInfo?pid= ${item.productId}"><font color="#00F">${item.productName}</font></a></td>
                <td>${item.insurerName}</td>
                <td> ${item.minPremium/100}(元)-${item.maxPremium/100}(元)</td>
                <td>${item.className}</td>
                <td>  <#if item.productSource==1>自研<#else>保险公司</#if></td>
              </tr>
              <tr class="ui-submod-tr-recom">
                <td><strong>推荐语</strong></td>
                <td><span>${item.productRecommend}</span></td>
                <td colspan="6"></td>
              </tr>
            </table>
             </#list>
          </li>
          <li class="ui-info-item ui-info-item-grey ui-padb">
          <div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">开始时间</label>
              <span class="ui-date-source">${specialPo.effTimestr}</span>
            </div>
            <div class="ui-info-subitem">
              <label class="ui-info-lbl">结束时间</label>
              <span class="ui-date-source">${specialPo.expTimestr}</span>
            </div>
            </div>
            <div>
             <div class="ui-info-subitem ui-infocheck-item ">
             <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
              <span class="ui-date-check">${specialPo.effTimestredit}</span>
            </div>
            <div class="ui-info-subitem ui-infocheck-item">
              <label class="ui-info-lbl"><em class="ui-downorg-arr"></em></label>
              <span class="ui-date-check">${specialPo.expTimestredit}</span>
            </div>
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

         		  <input type="radio" name="auditSts"   value="1" class="easyui-validatebox"  data-options="required:true,validType:{radio:['auditSts']}"/><label>审核通过</label>
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
          }
	}
	
   function tomain(){
          window.location.href="${base}/aduit/aduitview";
   }
	
	</script>
</body>
</html>