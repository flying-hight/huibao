<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理-商户管理-编辑</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script>
    $(function(){
    	$('#editMerch').validationEngine({
			maxErrorsPerField: 1
		});
    	var str=pad2('${usersSellerExtendMdl.userId}',6);
			$('td[data-str="str"]').text(str);
    });
	</script>
</head>
<body>
<div class="ui-main-container">
	<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
	</div>
  <div class="ui-info-content">
  <form id ="editMerch" method="post" action="/userManage/sellerManage/updateSellNext" >
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">商户基本信息</h3>
			<div class="ui-infobg">
				<table class="ui-center-tab">
          <tbody>
	          <tr>
	            <td class="ui-oddtd">商户ID：</td>
	            <td data-str="str">
	            	${usersSellerExtendMdl.userId}
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">账户名：</td>
	            <td>
	                ${usersSellerExtendMdl.username}
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">实名：</td>
	            <td>
	               ${usersSellerExtendMdl.sellerName}
	            </td>
	          </tr>
	          <tr>
	            <td class="ui-oddtd">商户类型：</td>
	            <td>
	                ${usersSellerExtendMdl.sellerTypeName}
	            </td>
	          </tr>
	          <!--商户类型为平台 才显示-->
		        <#--<#if usersSellerExtendMdl.sellerType==1>-->
	           <tr class="platform-part">
	            <td class="ui-oddtd">平台IP地址：</td>
	            <td>
	                <input type="text" maxlength=15 dataType="reqIp" class="validate[required,custom[ipv4]] ui-dinput" name="sellerIps" value="${usersSellerExtendMdl.sellerIps}"/>
	            </td>
	          </tr>
	           <tr  class="platform-part">
	            <td class="ui-oddtd">平台域名：</td>
	            <td>
	                <input type="text" maxlength=120 dataType="reqDomain" class="validate[required,custom[domin]] ui-dinput" name="sellerDomain" value="${usersSellerExtendMdl.sellerDomain}"/>
	            </td>
	          </tr>
	           <#--</#if>-->
	          <tr>
	            <td class="ui-oddtd">商户类别：</td>
	            <td>  
	                ${usersSellerExtendMdl.userLevelExtendMdl.levelName}
	            </td>
	          </tr>
	          <input type="hidden"  name="userId" value="${usersSellerExtendMdl.userId}" />
	          <input type="hidden"  name="username" value="${usersSellerExtendMdl.username}" />
	          <input type="hidden"  name="sellerName" value="${usersSellerExtendMdl.sellerName}" />
	          <input type="hidden"  name="sellerType" value="${usersSellerExtendMdl.sellerType}" />
	           <input type="hidden"  name="sellerTypeName" value="${usersSellerExtendMdl.sellerTypeName}" />
	          <input type="hidden"  name="sellerLevel" value="${usersSellerExtendMdl.userLevelExtendMdl.sellerLevel}" />
	          <input type="hidden"  name="userLevelExtendMdl.levelName" value="${usersSellerExtendMdl.userLevelExtendMdl.levelName}" />
			    </tbody>
	      </table>
			</div>
		</div>
		
		<div class="ui-info-wrap ui-dotted">
	  	<h3 class="ui-info-tit">收银限额</h3>
			<div class="ui-infobg ui-infobg-line">
			  <table class="ui-info-tab" >
			      <tr>
			        <td class="ui-oddtd">日收银限额：</td>
		            <td>
		              ${usersSellerExtendMdl.userLevelExtendMdl.dayMoneyYuan} 元
		            </td>
		             <td class="ui-oddtd">月收银限额：</td>
		            <td>
		              ${usersSellerExtendMdl.userLevelExtendMdl.monthMoneyYuan} 元
		            </td>
		          </tr>
		          <input type="hidden"  name="userLevelExtendMdl.dayMoneyYuan" value="${usersSellerExtendMdl.userLevelExtendMdl.dayMoneyYuan}" />
		          <input type="hidden"  name="userLevelExtendMdl.monthMoneyYuan" value="${usersSellerExtendMdl.userLevelExtendMdl.monthMoneyYuan}" />
			  </table>
			</div>
		</div>
				
		<div class="ui-info-wrap ui-multi-wrap ui-info-two" 
		     <#if usersSellerExtendMdl.sellerType!=1>style="margin-bottom:20px;"</#if>>
      <h3 class="ui-info-tit">手续费</h3>
			<div class="ui-infobg">
				<table class="ui-info-tab" width="900" >
		      <tr>
		      	<td class="ui-firtd ui-oddtd" >收银手续费：
		      	<input type="hidden"  name="feeSellerExtendMdl[0].operType" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].operType}" />
		      	</td>
		      	<td colspan='3'></td>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd "> 
		      		${usersSellerExtendMdl.feeSellerExtendMdl[0].calculationMethodName} 
		      		<input type="hidden" name="feeSellerExtendMdl[0].calculationMethod" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].calculationMethod}"/>  
		      		<input type="hidden" name="feeSellerExtendMdl[0].calculationMethodName" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].calculationMethodName}"/>                  
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<#if usersSellerExtendMdl.feeSellerExtendMdl[0].calculationMethod==0><!--百分比-->
		      	<td colspan='3' class="ui-eventd fn-fee">
		      	    ${usersSellerExtendMdl.feeSellerExtendMdl[0].scale} %
		      		<label class="ui-pos3">下限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[0].minimumYuan} 元
		      		<label  class="ui-pos3">上限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[0].maximumYuan} 元
		      		<input type="hidden" name="feeSellerExtendMdl[0].scale" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].scale}"/> 
		      		<input type="hidden" name="feeSellerExtendMdl[0].minimumYuan" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].minimumYuan}"/> 
		      		<input type="hidden" name="feeSellerExtendMdl[0].maximumYuan" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].maximumYuan}"/> 
		      	</td>
		      	<#else>
		      	<td colspan='3' class="ui-eventd fn-fee">
		      	    ${usersSellerExtendMdl.feeSellerExtendMdl[0].fixedYuan} 元
		      		<input type="hidden" name="feeSellerExtendMdl[0].fixedYuan" value="${usersSellerExtendMdl.feeSellerExtendMdl[0].fixedYuan}"/> 
		      	</td>
		      	</#if>
		      </tr>
				</table>
			</div>
			<!--商户类型为平台 显示内容-->
			<#if usersSellerExtendMdl.sellerType==1>
			<div class="ui-infobg2 platform-part">
				<table class="ui-info-tab" width="900">
		      <tr>
		      	<td class="ui-firtd ui-oddtd">银行代付手续费：
		      	<input type="hidden"  name="feeSellerExtendMdl[1].operType" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].operType}" />
		      	</td>
		      	<td colspan='3'></td>
		      </tr>
		      <tr class="radio-wrap">
		      	<td class="ui-oddtd">手续费类型：</td>
		      	<td colspan='3' class="ui-eventd"> 
		      		${usersSellerExtendMdl.feeSellerExtendMdl[1].calculationMethodName} 
		      		<input type="hidden" name="feeSellerExtendMdl[1].calculationMethod" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].calculationMethod}"/>  
		      		<input type="hidden" name="feeSellerExtendMdl[1].calculationMethodName" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].calculationMethodName}"/>                             
		      	</td>
		      </tr>
		      <tr class="ui-lastr">
		      	<td class="ui-oddtd">手续费值：</td>
		      	<#if usersSellerExtendMdl.feeSellerExtendMdl[1].calculationMethod==0><!--百分比-->
		      	<td colspan='3' class="ui-eventd fn-fee">${usersSellerExtendMdl.feeSellerExtendMdl[1].scale} %
		      		<label class="ui-pos3">下限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[1].minimumYuan} 元
		      		<label  class="ui-pos3">上限：</label>
		      		${usersSellerExtendMdl.feeSellerExtendMdl[1].maximumYuan} 元
		      		<input type="hidden" name="feeSellerExtendMdl[1].scale" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].scale}"/> 
		      		<input type="hidden" name="feeSellerExtendMdl[1].minimumYuan" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].minimumYuan}"/> 
		      		<input type="hidden" name="feeSellerExtendMdl[1].maximumYuan" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].maximumYuan}"/> 
		      	</td>
		      	<#else>
		      	<td colspan='3' class="ui-eventd fn-fee"> 
		      	    ${usersSellerExtendMdl.feeSellerExtendMdl[1].fixedYuan} 元
		      		<input type="hidden" name="feeSellerExtendMdl[1].fixedYuan" value="${usersSellerExtendMdl.feeSellerExtendMdl[1].fixedYuan}"/> 
		      	</td>
		      	</#if>
		      </tr>
				</table>
			</div>
			</#if>
		</div>
		
	  <div class="ui-submit-warp">
      <a href="javascript:history.go(-1);" class="ui-red-btn">返 回</a>
      <input type="submit" class="ui-red-btn ui-pos3" value="提交" />
    </div>
	</form>
	</div>
</div>
</body>
</html>