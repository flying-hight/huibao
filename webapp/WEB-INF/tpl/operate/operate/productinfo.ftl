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
    <form id="infoForm" method="post" action="">
     <h2 class="ui-info-tit">产品详情</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${product.productId}
         	    <label class="ui-info-lbl">保险名称</label>
         		  <a class="operation-link" ><font color="#00F">${product.productName}</font></a>
         		   <label class="ui-info-lbl">承保公司</label>
         		   <#list iList as item>
				             <#if product.insurerId == "${item.insurerId}">${item.insurerName}</#if>
				   </#list>
         	    <label class="ui-info-lbl">产品总量</label>
         		  ${product.maxQuantity}
                <label class="ui-info-lbl">剩余数量</label>
         		  ${product.currentQuantity}
         	</li>
         	<li class="ui-info-product ui-info-item-grey">
         		<label class="ui-info-lbl">产品有效期</label>
         		  ${product.effTimestr}${product.expTimestr}
         	</li>
         	<#if product.minAge=0 && product.maxAge=0>
         	   <li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">承保年龄</label>
         		    无限制
         	   </li>
         	   <#else>
         	   <li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">承保年龄</label>
         		   ${product.minAge}至${product.maxAge}周岁
         	   </li>
         	</#if>
         	<li class="ui-info-product ui-info-item-grey">
         	  <#list ppList as item>
  	       		<label class="ui-info-lbl">保障期限</label>
              <span>${item.minGuarantee}至${item.maxGuarantee}  
              <#if item.guaranteeType=1 >
             天
              </#if>
              <#if item.guaranteeType=2 >
             周
              </#if>
               <#if item.guaranteeType=3 >
             月
              </#if>
               <#if item.guaranteeType=4 >
            年
              </#if>
              </span>
              <label class="ui-info-lbl ui-info-lblw">标准价格</label>
              <span>${item.productPremium}</span> 元
              </#list>
         	</li>
         	<li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">适用人群</label>
         		     ${product.suitablePeople}
         	</li>
         	<li class="ui-info-product ui-info-item-grey">
         		<label class="ui-info-lbl">适用职业</label>
         		  ${product.occupationClass}级
         	</li>
         	<li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">产品亮点</label>
         		 
         		     ${product.productFeature}
         	</li>
         	<li class="ui-info-item ui-info-item-grey ui-guarant-item" >
				<label class="ui-info-lbl">保障利益</label>
				<div class="ui-guarant-wrap">
				<ul class="ui-guarant-list">
					<li>
						<span class="ui-gone">保障利益标题</span>
						<span class="ui-gtwo">保障价格</span>
						<span class="ui-gthree">保障次/天数</span>
					</li>
					
					<#if typeList?if_exists>
					<#list typeList as item>
					<li <#if typeList?size==item_index+1>class="ui-tab-last"</#if>>
						<div class="ui-guarant-tit">
				            <a href="javascript:;" onclick="toggleSub(this);" class="ui-gone">
								<strong>${item.benefitName}</strong><i class="ui-icon-arrow"></i>
							</a>
						</div>
						<table class="ui-guarant-tab" width='100%'>
						<#if typeList?if_exists>
						<#list item.benefitList as item2>
							<#-- <#if benefitsMap?values?size==item2_index+1>class="ui-tab-last"</#if> -->
							<tr <#if item.benefitList?size==item2_index+1>class="ui-tab-last"</#if>>
								<td width="40%" class="ui-td-fir">
									${item2.benefitName}
								</td>
								<td width="25%">${item2.sumAmount} ${item2.privaceType}</td>
								<td width="30%">${item2.maxRepetition} ${item2.amountUnit}</td>
							</tr>
						</#list>
						</#if>
						</table>
					</li>
			     	</#list>
			     	</#if>
		 	 	</ul>
		        </div>
			</li>
         	<li class="ui-info-product ui-info-item-grey">
         		<label class="ui-info-lbl">保险条款</label>
         		  ${product.insuranceTerms}
         	</li>
         		<li class="ui-info-item ui-relative">
	     		<label class="ui-info-lbl">保险条款</label>
	     		<#assign productsMap=productsPo.productsMap>
				<#list productsMap?values as item>
		     		<a href="${base}/product/fileDownload?path=${item.insuranceTerms3}" style="margin-left:10px;">
		     			${item.insuranceTerms2}
		     		</a>
				</#list>
	     	</li>
         	
         	
         	<li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">投保须知</label>
         		     ${product.productStatement}
         	</li>
         	<li class="ui-info-product ui-info-item-grey">
         		<label class="ui-info-lbl">理赔指南</label>
         		  ${product.claimsGuide}
         	</li>
         	<li class="ui-info-product ui-info-product-grey">
         		<label class="ui-info-lbl">温馨提示</label>
         		     ${product.productPrompt}
         	</li>
         	
        </ul>
	    <div class="ui-btn-double">
	      <input type="button" value="关闭"  class="ui-btn-grey ui-back"/>
	    </div>
	    </form>
   	 </div>
  	</div>
	<script>
	</script>
</body>
</html>