<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>运营管理-红包管理-新增</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.form.js"></script>
  <style> 
    
  </style>
</head>
<body>
<div id="produce-add">
	<div class="ui-info-box">
    <div class="ui-crumbs" id="crumbs">
    	 <#include "/common/include/power.ftl">
    </div>
    <form id="infoForm" method="post" action="${base}/coupons/addCouponsConfirm">

      <div class="ui-info-main">
         <ul class="ui-info-list">
           	<li class="ui-info-item">
           		<label class="ui-info-lbl redrule-item-label">优惠券名称:</label>
           		<input name="couponName" type="text" class="easyui-validatebox ui-info-input"
              		data-options="required:true" missingMessage="请输入优惠券名称" maxlength="40"/>
           	</li>
            <li class="ui-info-item ui-info-item-grey">
           		<label class="ui-info-lbl redrule-item-label">优惠方式:</label>
           		<select class="ui-info-sel" id="concessSele" name="couponType">	             	  
                 	<option value="1">折扣优惠</option>
                  <option value="2">金额优惠</option>
           		</select>
              <span id="concessMoney">
                  <input name="couponValuebfb" type="text"   maxlength="9" class="easyui-validatebox ui-info-sinput decimal-pointtwo" 
                  data-options="required:true,validType:'noZeroMoney'" missingMessage="请输入"/> %
              </span>
              <span class="fn-hide" id="concessDiscount">  
                  <input name="couponValuestr" type="text"   maxlength="9" class="easyui-validatebox ui-info-sinput decimal-pointtwo"
                  data-options="required:true,validType:'noZeroMoney'" missingMessage="请输入"/> 元
              </span>
              
           	</li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">最大使用次数:</label>
                <input name="maxQuantity" type="text"  class="easyui-validatebox ui-info-sinput ui-marginr6" 
                  data-options="required:true" maxlength="9" missingMessage="请输入" onkeyup="clearNoNum(this);" id="maxUserFre"/>次
                <input type="checkbox" name="" value="0" class="query-result-span" onclick="findValLime(this);"/>不限
            </li>
            <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl redrule-item-label">单用户最大使用次数:</label>
                <input name="userQuantity" type="text" maxlength="9" value="" class="easyui-validatebox ui-info-sinput ui-marginr6" 
                  data-options="required:true" missingMessage="请输入" onkeyup="clearNoNum(this);" id="singleUserFre"/>次
                   <input type="checkbox" name="" value="0" class="query-result-span" onclick="findValLime(this);"/>不限
            </li>
            <li class="ui-info-item">
                <label class="ui-info-lbl redrule-item-label">允许单个用户领用次数:</label>
                <input name="multiSts" type="text" value="" maxlength="9" class="easyui-validatebox ui-info-sinput ui-marginr6" 
                  data-options="required:true" missingMessage="请输入" onkeyup="clearNoNum(this);"/>次
                   <input type="checkbox" name="" value="0" class="query-result-span" onclick="findValLime(this);"/>不限
            </li>
            <li class="ui-info-item ui-info-item-grey">
            <label class="ui-info-lbl redrule-item-label">是否允许与其他优惠券叠加使用:</label>
              <select class="ui-info-sel"  name="overlapSts">
                <option value="1" >允许</option>
                <option value="0">不允许</option>
              </select>
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">使用条件:</label>订单满
               <input name="offUptostr" type="text" value="" maxlength="9"  class="easyui-validatebox ui-info-sinput ui-marginr6" 
                  data-options="required:true" missingMessage="请输入" onkeyup="clearNoNum(this);"/> 元
                <input type="checkbox" name="" value="0" class="query-result-span" onclick="findValLime(this);"/>不限
            </li>
            <li class="ui-info-item">
              <label class="ui-info-lbl redrule-item-label">兑换成功提示语:</label>
              <input name="couponPrompt" type="text" maxlength="128" class="easyui-validatebox ui-info-input" missingMessage="请输入" placeholder="选填"/>
            </li>
            <li class="ui-info-item ui-info-item-grey">
              <label class="ui-info-lbl redrule-item-label">活动地址:</label>
              <input name="couponUrl" type="text" maxlength="128" class="easyui-validatebox ui-info-input" missingMessage="请输入" placeholder="选填"/>
            </li>
           	
          </ul>
    	</div>
      <div class="ui-btn-double">
       <input type="button" value="下一步" class="ui-btn-blue" id="concessSave"/>
        <input type="button" value="取消"  class="ui-btn-grey ui-back"/>
      </div>
      </form>
    </div>  
</div>
<!--保存并提交弹框-->
<div id="dlgSubmit" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
  <h3 class="ui-dlg-tit">确认提交吗</h3>
  <input type="button" class="ui-dlgOk-btn" value="确认" id="concessSubmit"/>
  <input type="button" class="ui-dlgCancel-btn" value="取消"/>
</div>
 <div id="produce-result" style="display:none"></div>
<script>
$(function(){
	 validExtend();
   var $conmoney = $("#concessMoney"),
       $condiscount = $("#concessDiscount");
   
  $("#concessSele").on('change',function(){
      var val = $(this).val();
      if(val == 1){
          seleNatureToggle([$conmoney],[$condiscount]);
      }else{
          seleNatureToggle([$condiscount],[$conmoney]);

      }

  })
  $condiscount.find('input').validatebox('disableValidation');
  $("#singleUserFre").on('keyup',function(){
      var maxleng = parseInt($("#maxUserFre").val()),
          thisval = parseInt($(this).val());
      if(thisval >= maxleng){
        $(this).val('');
      }
  })
  $('#concessSave').click(function(){
      var form = $("#infoForm");
      if(form.form('validate')){
      $('#infoForm').submit();
      }
  })
  
  $("#concessSubmit").click(function(){
      var form =$("#infoForm");
      $.ajax({
          url:form.attr('action') ,
          type: 'post',
          dataType: 'json',
          data: form.serialize(),
          success:function(data){
            location.href="";
          }
      });

  })
    
     
        
})	
function findValLime(obj) {
      var inpt = $(obj).prev();
      if ($(obj).is(':checked')) {
          inpt.val('').attr('readOnly', 'readOnly');
          inpt.validatebox('remove');
          
      } else {
          $(inpt).removeAttr('readOnly');
          inpt.validatebox('reduce');
         
      }
}
</script>	

</body>
</html>