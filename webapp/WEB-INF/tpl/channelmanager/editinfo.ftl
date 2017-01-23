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
    <h2 class="ui-info-tit">分销商信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">分销商ID</label>
         		  ${domainPo.domainId}
         		  <input id="domainIdvalue"  name="domainId" type="hidden" value="${domainPo.domainId}">
         	    <label class="ui-info-lbl">分销商名称</label>
         	     ${domainPo.domainName}
         	     <label class="ui-info-lbl">合作时间</label>
         	     ${domainPo.effTimestr}至${domainPo.expTimestr}
         	</li>
        </ul>
     <h2 class="ui-info-tit">产品信息</h2>
        <ul class="ui-info-list">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">产品ID</label>
         		  ${product.productId}
         	    <label class="ui-info-lbl">保险名称</label>
         		 
         		  <a class="operation-link" href="${base}/product/toProductDetailMsg?productId= ${product.productId}"><font color="#00F">${product.productName}</font></a>
         	    <label class="ui-info-lbl">产品总量</label>
         		       <#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.maxQuantity}
         		  </#if>
         		  
                <label class="ui-info-lbl">剩余数量</label>
         		      <#if product.maxQuantity==-1>
         		      不限
         		  <#else> ${product.shengyuQuantity}
         		  </#if>
         		  	  <input   name="totalQuantity" type="hidden" value="${domainproduct.totalQuantity}">
         		   <input   id="checknumber" type="hidden" value="${domainproduct.maxQuantity+product.shengyuQuantity}">
         	</li>
        </ul>
      <h2 class="ui-info-tit">配置信息</h2>
        <ul class="ui-info-list" id="ChildMenu1">
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">分配数量</label>
         		 ${domainproduct.maxQuantity}份
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">上架时间</label>
         		 ${domainproduct.effTimestr}
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">下架时间</label>
         		 ${domainproduct.expTimestr}
         	</li>
  	        
  	        
        </ul>
        <ul class="ui-info-list" id="ChildMenu2" >
         	
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">当前库存</label>
         		<input   type="text"  name="domainQuantity" readonly="true"  value="${domainproduct.maxQuantity}" class="easyui-validatebox ui-info-input"> 份
         	</li>
         	
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">分配数量</label>
         		  <input id="productIdvalue"  name="productId" type="hidden" value="${domainproduct.productId}">
         		 <input   name="maxQuantity" type="text" maxlength=10   onKeyUp="this.value=this.value.replace(/\D/g,'');if(parseInt(this.value)>=0) $('#countall').val(parseInt(this.value)+${domainproduct.maxQuantity}) " onafterpaste="this.value=this.value.replace(/\D/g,'')"   class="easyui-validatebox ui-info-input" data-options="required:true,validType:['plusNum','limitNum(\'${product.shengyuQuantity}\')']"/> 份
              <#if product.maxQuantity==-1>
         	<font color="#FF0000">*分配数量不限</font>
         	  <#else> 
               <font color="#FF0000">*分配数量最多为${product.shengyuQuantity}份</font>
         		  </#if>
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">库存总量</label>
          <input   type="text"  id="countall" readonly="true"  value="${domainproduct.maxQuantity}" class="easyui-validatebox ui-info-input"> 份
         	</li>
         	 
         	<li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">上架时间</label>
         	  <input id="startTimestr" name="effTimestr" class="easyui-datetimebox ui-info-input" data-options="editable:false" value="${domainproduct.effTime?string('yyyy-MM-dd HH:mm:ss')}" />
         	</li>
         	 <li class="ui-info-item ui-info-item-grey">
         		<label class="ui-info-lbl">下架时间</label>
         		<input id="expTime1" name="expTimestr" class="easyui-datetimebox ui-info-input" validType="mdMs['#startTimestr']" data-options="editable:false" value="${domainproduct.expTime?string('yyyy-MM-dd HH:mm:ss')}" />
         	</li>
        </ul>
          <#if logPoList?if_exists>
             <h2 class="ui-info-tit">审核记录</h2>
          
           	 <#list logPoList as item>
           	 <ul class="ui-info-list"  >
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
         	 </ul>
         	 </#list> 
           <#else>  <h2 class="ui-info-tit">审核记录:无</h2></#if>
	    <div id="dosome" class="ui-btn-double ui-detail-btnposition">
	       <#if domainproduct.sts==1 || domainproduct.sts==-1>
	      <input type="button" value="编辑" onclick="editpuduct()" class="ui-btn-blue" />
	       </#if>
	      <input type="button" value="返回"  class="ui-btn-grey ui-back"/>
	    </div>
	     <div id="doproducteidt" class="ui-btn-double" style="display:none">
	      <input type="button" value="完成"   onclick="saveproduct()" class="ui-btn-blue" />
	      <input type="button" value="取消"  class="ui-btn-grey"/ onclick="godown()">
	    </div>
	    </form>
   	 </div>
  	</div>
     <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">您编辑合作产品的请求已提交审核!!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="查看审核详情"/>
  </div>
  <div id="dlgm" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">编辑失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
  <div id="dlgmq" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">确定要下架该产品吗？</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="submitselect()" value="确定"/>
    <input type="button" class="ui-dlgCancel-btn" value="取消"/>
    <input  type="hidden" name="issueType"   id="issueType"/>
  </div>
  
   <div id="editsuss" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置成功!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn" onclick="tomain()"  value="确定"/>
  </div>
  <div id="editlos" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">设置失败！</h3>
    <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
    <div id="dlgnull" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">日期不能为空!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"  value="确定"/>
  </div>
   <div id="dlgtime" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true" style="width:360px;">
    <h3 class="ui-dlg-tit">下架时间要大于上架时间!</h3>
     <input type="button" class="ui-dlgOk-btn ui-dlgOkcancel-btn"   value="确定"/>
  </div>
	<script>
	  $(document).ready(function(){
	  validExtend();
	  $('#startTimestr').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
     $('#expTime1').datetimebox().datebox('calendar').calendar({
        validator: function(date){
             var now = new Date();
             var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            return d1 <= date;
        }
    });
    document.getElementById('ChildMenu2').style.display = "none";
 });
 
	function editpuduct(){
	  document.getElementById('ChildMenu1').style.display = "none";
	  document.getElementById('ChildMenu2').style.display = "block";
	  document.getElementById('doproducteidt').style.display = "";
	  document.getElementById('dosome').style.display = "none";
	
	}
	function godown(){
	   document.getElementById('ChildMenu1').style.display = "block";
	  document.getElementById('ChildMenu2').style.display = "none";
	  document.getElementById('doproducteidt').style.display = "none";
	  document.getElementById('dosome').style.display = "block";
	}
	<!--编辑产品信息-->
	function saveproduct(){
	  var f=$('#infoForm');
	      if(!f.form('validate')){
	       return false;
	      }
	 $.ajax({
                 url: '${base}/operate/updateDomainProduct',
                 type: 'post',
                 datatype: 'text',
                 data: $('#infoForm').serialize(),
                 success: function (result) {
                     if (result>0) {
                     showAlert("dlg");
                     }
                     else if(result==-2){
                     showAlert("dlgnull");
                     }
                      else if(result==-3){
                     showAlert("dlgtime");
                     }else{
                       showAlert("dlgm");
                     }
                 }
             });
	}
	 function tomain(){
          var value=$('#productIdvalue').val();
          var s=$('#domainIdvalue').val();
          window.location.href="${base}/operate/findProductDomainInfo?pId="+value+"&domainId="+s;
   }
   
   function downproduct(value){
    $("#issueType").val(value);
   showAlert("dlgmq");
   }
   function submitselect(){
	var ids = $("#issueType").val();
	 $.ajax({
	                 url: '${base}/operate/downProduct?ids='+ids,
	                 type: 'post',
	                 datatype: 'text',
	                 success: function (result) {
	                     if (result>0) {
	                     showAlert("editsuss");
	                     }else{
	                       showAlert("editlos");
	                     }
	                 }
	             });
	
	}
	</script>
</body>
</html>