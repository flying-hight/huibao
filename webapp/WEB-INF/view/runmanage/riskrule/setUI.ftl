<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-风控规则设置</title>
	<link rel="stylesheet" type="text/css" href="/themes/seaway/easyui.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/icon.css">
	<link rel="stylesheet" type="text/css" href="/themes/seaway/demo.css">
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/plugins.css">
	<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/plugins.js"></script>
	<script type="text/javascript" src="/js/jquery.validationEngine.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div id="page-form">
	<div class="ui-main-container">
		<div class="crumbs" id="crumbs">
		<#include "/common/include/power.ftl">
			<!--<a class="crumbs-link" href="#">运营管理<span>></span></a>
		    <a class="crumbs-link" href="">风控管理 <span>></span></a>
			<span class="crumbs-tit">风控规则设置</span>-->
		</div>
	     <div class="ui-info-content"> 
	     	<form id ="editUserTypeNext" method="post" action="/runManage/riskRule/confirm" >       
			<div class="ui-info-wrap ui-multi-wrap ui-info-two ui-dotted">
	           	<h3 class="ui-info-tit">设置风控规则</h3>
			      <!--循环-->
			      <#if riskRuleList?if_exists>
			      	 <#list riskRuleList as riskRule>
			      	 	 <#assign limitName = ""/>
			      	 	 <#if riskRule?if_exists.operType == 0>
			      	 	 	<#assign limitName = "rechargeLimit"/>
			      	 	 <#elseif riskRule?if_exists.operType == 1>	
			      	 	 	<#assign limitName = "withdrawLimit"/>
			      	 	 <#elseif riskRule?if_exists.operType == 2>	
			      	 	 	<#assign limitName = "transferLimit"/>
			      	 	 <#elseif riskRule?if_exists.operType == 3>	
			      	 	 	<#assign limitName = "collectLimit"/>
			      	 	 <#elseif riskRule?if_exists.operType == 4>
			      	 	 	<#assign limitName = "paymentLimit"/>
			      	 	 </#if>
					     <div class="ui-infobg <#if (riskRule_index+1)%2==0>ui-infobg2 no-bottbor</#if>">
							<table class="ui-info-tab ">
						      <tr>
						      	<td class="ui-oddtd">${riskRule?if_exists.operTypeName}控制：</td><td></td><td></td><td></td>
						      	<input type="hidden" value="${mdl.operType}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].operType"/>
						      	<input type="hidden" value="${mdl.id}" name="feeLevelExtendMdl[<#if mdl_index?if_exists>${mdl_index}</#if>].id"/>
						      </tr>
						      <tr class="ui-lastr">
						      <#assign countValue = ""/>
						      	 <#if riskRule?if_exists.childList?if_exists>
						      	 	<#list riskRule?if_exists.childList as limit>
						      	 		<#if limit?if_exists.operType == 1 && limit?if_exists.requirementType == 0><#assign countValue = "${limit?if_exists.countValue?if_exists}"/></#if>
						      	 		 <input id="" name="${limitName?if_exists}" value="${limit?if_exists.id}" type="hidden"/>
								      	 <td class="ui-oddtd">${limit?if_exists.requirementTypeName?if_exists}限额：</td>
								      	 <td>
								      	 <input name="${limitName?if_exists}" value="${limit?if_exists.feeValueStr?if_exists}" class="<#if limit.requirementType==0>day<#elseif limit.requirementType==1>month<#else>sum</#if> 
								      	 validate[required,custom[money],min[0],max[9999999999]] ui-dinput ui-dinput-small qfw"> 元</td>
						      	 	</#list>
						      	 </#if>
						      </tr>
						      <#if riskRule?if_exists.operType == 1>
							      <tr class="ui-lastr">
							      	 <td class="ui-oddtd">单日限次：</td>
							      	 <td><input name="withdrawLimitCount" value="${countValue?if_exists}" class="validate[required,custom[integer],min[0]] ui-dinput ui-dinput-small"> 次</td>
							      	 <!-- 
							      	 <td class="ui-oddtd">信用卡充值资金：</td><td colspan="3"><input name="" value="1234" class="validate[required,custom[number]] ui-dinput ui-dinput-small"> 日后才能提现、转账</td>
							      	  -->
							      </tr>
						      </#if>
							</table>
						</div>
			      	 </#list>
			      </#if>
				<!-- 
				<div class="ui-infobg2 no-bottbor" style="padding-bottom:5px;">
			      <table class="ui-info-tab ">
			      	<tr>
			        <td class="ui-oddtd">信用卡充值开关：</td><td></td>
			      </tr>
			      </table>
			      </div>
			       -->
			      <div class="ui-infobg ui-infobg2">	
					<table class="ui-info-tab ">
				      <tr>
				      	<td class="ui-oddtd">可疑交易控制：</td><td></td>
				      </tr>
				      <tr>
				      	<td class="ui-oddtd">IP钓鱼：</td><td><input id="refund" name="suspiciousTrade" value="0" <#if sysParam?if_exists.value?if_exists == 0>checked="checked"</#if> type="radio"/><label for="refund"> 直接拒绝</label></td><td><input id="checkRepeat" name="suspiciousTrade" <#if sysParam?if_exists.value?if_exists == 1>checked="checked"</#if> value="1" type="radio"/><label for="checkRepeat"> 二次验证</label></td>
				      </tr>
			      </table>
			      </div>
			      <div class="ui-submit-warp">
				      <a href="javascript:history.go(-1);" class="ui-red-btn">返&nbsp;&nbsp;回</a>
	      			 <input type="submit" value="提交" class="ui-red-btn ui-pos3"/>
				    </div>
			    </div>
			    </form>
			</div> 
		</div>
	</div>
	<div id="page-result"></div>
	<script type="text/javascript" src="/js/jquery.validationEngine-zh_CN.js"></script>	
	<script>
	  $(document).ready(function(){
		 moneyThousands();
		 $("body").delegate('#back', 'click', function(event) {
	            $("#page-form").show()
	            $("#page-result").empty()
	      });
	    $('#editUserTypeNext').ajaxForm({
	        target: '#page-result',
	        success: function() {
	            $('#page-result').fadeIn('slow');
	            $("#page-form").hide();
	        }
	    });
	 });
	  var flag=true;
	 $("#editUserTypeNext").validationEngine({
		maxErrorsPerField: 1
	});
	 $(".sum").blur(function(){
		 var o=$(this);
		  var month=Number(o.parents("tr").find(".month").val().replace(/\,/g,"")),
		 	 day=Number(o.parents("tr").find(".day").val().replace(/\,/g,"")),
		 	 sum=Number(o.val().replace(/\,/g,""));
		  if(sum>month||sum>day){
			 alert("单笔限额不能大于单日限额或者单月限额");
			 flag=false;
		  }else{
			  flag=true;
		  }
	  })
	  $(".day").blur(function(){
			 var o=$(this);
			 var month=Number(o.parents("tr").find(".month").val().replace(/\,/g,"")),
			     sum=Number(o.parents("tr").find(".sum").val().replace(/\,/g,"")),
			 	 day=Number(o.val().replace(/\,/g,""));
			 if(day>month||day<sum){
				 alert("单日限额不能大于单月限额或者小于单笔限额");
				 flag=false;
			  }else{
				  flag=true;
			  }
		  })
	  $(".month").blur(function(){
			 var o=$(this);
			 var day=Number(o.parents("tr").find(".day").val().replace(/\,/g,"")),
			     sum=Number(o.parents("tr").find(".sum").val().replace(/\,/g,"")),
			 	 month=Number(o.val().replace(/\,/g,""));
			 if(day>month||month<sum){
				 alert("单月限额不能小于单日限额或者小于单笔限额");
				 flag=false;
			  }else{
				  flag=true;
			  }
		  })
		  $("#editUserTypeNext").submit(function(){
			  if(flag){
				  return true;
			  }else{
				  return false;
			  }
		  });
	  </script>
</body>
</html>