
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>

</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
	  <#include "/common/include/power.ftl">
		<!--<a class="crumbs-link" href="#">系统管理 <span>></span></a>
		<a class="crumbs-link" href="#">角色管理 <span>></span></a>
		<span class="crumbs-tit">新增角色</span>-->
	</div>
  <div class="ui-info-content">
	  <form id ="editMerchs" method="post" action="${action?if_exists}" >
			<div class="ui-info-wrap">
  	  			<h3 class="ui-info-tit">商品账户信息</h3>
				<div class="ui-infobg">
					<table class="ui-center-tab">
			          <tbody>
			          <#if product.productId != null>
				            	<input type="hidden" name="productId" value="${product?if_exists.productId}"/>
				          </#if>
				          <tr class="platform-part">
				            <td class="ui-oddtd">商品名称：</td>
				            <td>
				            	${product?if_exists.productName}
				            </td>
				          </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">所属业务：</td>
				            <td>
				             <#list serviceList as item>
				             <#if product.serviceId == "${item.serviceId}">${item.serviceName}</#if>
				             </#list>
				             </td>
				          </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">有效期：</td>
				            <td>
				            	${product.effTimeStr} 	至  ${product.expTimeStr}
				            </td>
				          </tr>
				             <tr class="platform-part">
				            <td class="ui-oddtd">服务时间：</td>
				            <td>
				            	${product.serviceBeginTime} 	至  ${product.serviceEndTime}
				            </td>
				          </tr>
				            <tr class="platform-part">
				            <td class="ui-oddtd">是否需要渠道提供用户ID：</td>
				            <td>
				             <#if product.productProps == 1>需要</#if>
				              <#if product.productProps == 0>不需要 </#if>
				             </td>
				          </tr>
				          
				         <tr class="platform-part">
				            <td class="ui-oddtd">价格类型：</td>
				            <td>
				             <#if product.pricingMode == 1>固定价格</#if>
				             <#if product.pricingMode == 2>浮动价格</#if>
				            </td>
				          </tr>
				          <#if product.pricingMode == 1> 
				          <tr class="platform-part">
				            <td class="ui-oddtd">面值价：</td>
				            <td>
				              <input type="hidden" name="productParvalue" value="${product?if_exists.productParvalue}"/>
				                ${product.productParvalue}元
				            </td>
				          </tr></#if>
			           
				          </tbody>
				         <input type="hidden" name="productName" value="${product?if_exists.productName}"/>
				          <input type="hidden" name="productId" value="${product?if_exists.productId}"/>
				         <input type="hidden" name="serviceId" value="${product?if_exists.serviceId}"/>
				         <input type="hidden" name="effTimeStr" value="${product?if_exists.effTimeStr}"/>
				         <input type="hidden" name="expTimeStr" value="${product?if_exists.expTimeStr}"/>
				         <input type="hidden" name="serviceBeginTime" value="${product?if_exists.serviceBeginTime}"/>
				         <input type="hidden" name="serviceEndTime" value="${product?if_exists.serviceEndTime}"/>
				         <input type="hidden" name="productProps" value="  <#if product.productProps == 1>1</#if>
				         <#if product.productProps == 0>0</#if>"/>
				         <input type="hidden" name="pricingMode" value="<#if product.pricingMode == 1>1</#if>
				          <#if product.pricingMode == 2>2</#if> "/>
				        <input type="hidden" name="productParvalue" value="${product?if_exists.productParvalue}"/>
		      		</table>
				</div>
			</div>
		  <div class="ui-submit-warp">
	      <a href="javascript:void(0);" id="back" class="ui-red-btn">返 回</a>
	      <a href="javascript:ajaxSubmit('editMerchs','dlgOk2','dlgWarn');" class="ui-red-btn ui-pos3">保存</a>
	    </div>
		</form>
	</div>
</div>
<!--成功提示-->	      
<div id="dlgOk2" class="ui-dialog ok2-dialog" data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-icon ui-dlg-ok ui-clearfix"></div>
    <div class="ui-dlg-text"><#if product.productId !=0>编辑商品成功！<#else>新增商品成功！</#if></div>
    <a data-fn="backToList" href="/product/downListView" class="ui-red-btn ui-toList">确 定</a>
	</div>
</div>
<!--失败提示-->	
<div id="dlgWarn" class="ui-dialog warn-dialog"  data-options="iconCls:'icon-save'">
	<div class="ui-dlg-content ui-relative">
    <div class="ui-dlg-text"><#if product.productId !=0>编辑商品失败！<#else>新增商品失败！</#if></div>
    <a href="#" class="ui-red-btn ui-toClose">确 定</a>
	</div>
</div>
</body>
</html>