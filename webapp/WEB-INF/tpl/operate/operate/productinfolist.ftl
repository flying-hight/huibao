<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>详情-自研产品管理-产品信息管理-产品管理</title>
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/base.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${base}/resource/style/style.css">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${base}/resource/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${base}/resource/js/base.js"></script>
</head>
<body>
	<div class="ui-info-box">
	    <div class="ui-crumbs" id="crumbs">
	    	 <#include "/common/include/power.ftl">
	    </div>
    <form id="infoForm" method="post" action="">
    <div class="ui-info-main">
    	<h2 class="ui-info-tit">产品信息</h2>
        <div id="frm1">
      <#--用于产品详情显示-->
        <div class="ui-info-main">
            <h2 class="ui-info-tit">产品基本信息</h2>
            <ul class="ui-info-list ui-info-newlist">
                <li class="ui-info-item">
                    <label class="ui-info-lbl">保险名称</label>
                    ${product.productName}
                </li>
                <li class="ui-info-item ui-info-item-grey">
                    <label class="ui-info-lbl">保险类别</label>
                    <#list parentClassList as item>
                        <#if product.classId == item.classId>
                            ${item.className}
                        </#if>
                    </#list>
                    <#--
                    <select class="ui-info-sel" id="childSel" name="classId" onchange="findVal(this);">
                        <option>请选择</option>
                    </select>
                    -->
                </li>
                <li class="ui-info-item">
                    <label class="ui-info-lbl">承保公司</label>
                    <!--必填的样式<select class="easyui-combobox ui-info-sel" required="true" validtype="selectRequired">-->
                    <#list iList as item>
                        <#if product.insurerId == item.insurerId>
                            ${item.insurerName}
                        </#if>
                    </#list>
                      <!--<select class="easyui-combobox ui-info-sel" name="insurerId" validtype="selectRequired" id="insureVal">
                            <option>请选择</option>
                            <#list iList as item>
                                  <option value="${item.insurerId}">${item.insurerName}</option>
                            </#list>
                      </select>
                      <input type="hidden" name="insurerName" />-->
                </li>
                <li class="ui-info-item ui-relative">
                    <label class="ui-info-lbl">产品配图</label>
                    <img src="${base}${product.productLogo}" width="120" height="120" data-leve='produce' id='produceImg1'/>
                </li>
                <li class="ui-info-item ui-info-item-grey" id="aa" >
                    <label class="ui-info-lbl">当前库存</label>
	           		${product.maxQuantity - product.totalQuantity}份
	           		<#--
	           		<label class="ui-info-lbl ui-info-lblsmall">分配数量</label>
	           		<#if product.maxQuantity lte -1>
	           			不限
	           		<#else>
	           			${product.totalQuantity}份
	           		</#if>
	           		-->
	           		<label class="ui-info-lbl ui-info-lblsmall">总库存</label>
	           		<span id="totalNum">
	           			<#if product.maxQuantity == -1>
	           				不限
	           			<#elseif product.maxQuantity gte 0>
	           				${product.maxQuantity}份
	           			<#else>
	           				0份
	           			</#if>
	           		</span>
                </li>
                <li class="ui-info-item">
                  <label class="ui-info-lbl ui-info-small">产品有效期</label>
                  <span data-qb="qb">
                        <#if product.longTime == 1>
                            长期
                        <#else>
                            ${product.effTimeStr} 至 ${product.expTimeStr}
                        </#if>
                  </span>
                </li>
                <li class="ui-info-item">
                        <label class="ui-info-lbl">承保年龄</label>
                        <#if product.ageStr == 1>
                            不限
                        <#else>
                            <#if product.minAge == product.maxAge>
                                ${product.maxAge} 岁
                            <#else>
                                ${product.minAge} - ${product.maxAge} 岁
                            </#if>
                        </#if>
                    <#--
                    <label class="ui-info-lbl ui-info-lblw">保险经纪人</label>
                    <input name="productAgent" type="text" value="" class="easyui-validatebox ui-info-input" 
                    data-options="required:true,validType:['letchi','length[1,10]']" missingMessage="请输入保险经纪人"/>
                    -->
                </li>
                <li class="ui-info-item ui-info-item-grey">
                    <label class="ui-info-lbl">最高职业类别</label>
                     <#if product.occupationClass == 9>
                        不限
                     <#elseif product.occupationClass == 7>
                        特别费率
                     <#else>
                        ${product.occupationClass}
                     </#if>
                </li>
                <li class="ui-info-item">
                    <label class="ui-info-lbl">适用人群</label>
                    ${product.suitablePeople}
                </li>
                <li class="ui-info-item">
                    <label class="ui-info-lbl">产品亮点</label>
                    ${product.perferWords}
                </li>
                <li class="ui-info-item ui-relative ui-rich-wrap">
                    <label class="ui-info-lbl">保险条款</label>
                    <span class="ui-article-text prod-edit-item-bef" style="width:84%;" >
                    <#if product.productsMap?if_exists>
                        <#list product.productsMap?values as item>
                            <a href="${item.insuranceTerms3}"><span class="ui-channel-phonemargin">${item.insuranceTerms}</span></a>
                        </#list>
                    </#if>
                    </span>
                </li>
                <li class="ui-info-item ui-info-item-grey ui-rich-wrap">
                    <label class="ui-info-lbl">投保须知</label>
                    <span class="ui-article-text prod-edit-item-bef" style="width:84%;" >
                     ${product.productStatement}
                    </span>
                </li>
                <li class="ui-info-item ui-rich-wrap">
                    <label class="ui-info-lbl">理赔指南</label>
                    <span class="ui-article-text prod-edit-item-bef" style="width:84%;">
                      ${product.claimsGuide}
                    </span>
                </li>
                <li class="ui-info-item ui-info-item-grey ui-rich-wrap" >
                    <label class="ui-info-lbl">温馨提示</label>
                    <span class="ui-article-text prod-edit-item-bef" style="width:84%;">
                      ${product.productPrompt}
                    </span>
                </li>
                <li class="ui-info-item">
                <label class="ui-info-lbl ui-info-small">生效方式</label>
                <span>
                        <#if product.effectType==1>
                            及时生效
                        <#elseif product.effectType==2>
                            次日生效
                        <#elseif product.effectType==3>
                            延迟生效 &nbsp; ${product.effectDay}天
                        </#if>
                </span> 
              </li>
                <li class="ui-info-item  ui-info-item-grey">
                <label class="ui-info-lbl ui-info-small">支持电子保单</label>
                <span>
                  <#if product.policyType == 1 || product.policyType == "">
                    是
                  <#else>
                    否
                  </#if>
                </span> 
              </li>
              <li class="ui-info-item electore-policy" <#if product.policyType == 0 >style="display:none"</#if> >
                    <label class="ui-info-lbl ui-info-small">请选择保单样式</label>
                    <span>
                      <#if product.policyTemplate?if_exists>
                            <#list epolicyList?if_exists as item>
                                <#if product.policyTemplate == item.value>${item.key}</#if>
                            </#list>
                      <#else>
                        无
                      </#if>
                    </span> 
              </li>
              <li class="ui-info-item  ui-info-item-grey electore-policy" <#if product.policyType == 0 >style="display:none"</#if> >
                <label class="ui-info-lbl ui-info-small">是否平台生成电子保单</label>
                <span>
                  <#if product.supportPolicy == 1>
                    是
                  <#elseif  product.supportPolicy == 0 || product.supportPolicy == "">
                    否
                  </#if>
                </span> 
              </li>
              <li class="ui-info-item">
                <label class="ui-info-lbl ui-info-small">是否支持退保</label>
                <span>
                    <#if product.refundFlag == 2>
                        支持
                    <#elseif product.refundFlag == 0>
                        不支持
                    <#elseif product.refundFlag == 1>
                        仅支持生效前退保
                    </#if>
                </span> 
              </li>
              <li class="ui-info-item  ui-info-item-grey">
                <label class="ui-info-lbl ui-info-small">最多投保份数</label>
                <#if product.buyQuota == 0>
                    不限
                <#else>
                    ${product.buyQuota}
                </#if>
              </li>
              <li class="ui-info-item">
                <label class="ui-info-lbl ui-info-small">受益人自定义</label>
                <span>
                  <#if product.beneficiaryNumStr == 1>
                    是
                  <#elseif product.beneficiaryNumStr == 0 || product.beneficiaryNumStr == "">
                    否
                  </#if>
                </span> 
              </li> 
              <li class="ui-info-item <#if product.beneficiaryNumStr == 0 || product.beneficiaryNumStr == "">fn-hide</#if> more-bendficiarie">
               <label class="ui-info-lbl ui-info-small">最多受益人数</label>
                <span>
                  ${product.beneficiaryNum} 人
                </span> 
              </li>
              <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl ui-info-small">是否需要激活</label>
                <span>
                  <#if product.activation == 1>
                    是
                  <#elseif product.activation == 0 || product.activation == "">
                    否
                  </#if>
                </span> 
              </li>
              <li class="ui-info-item <#if product.activation == 0 || product.activation == "">fn-hide</#if> active-audit" >
                <label class="ui-info-lbl ui-info-small">激活后是否需要审核</label>
                <span>
                  <#if product.auditFlag == 1>
                    是
                  <#elseif product.auditFlag == 0 || product.auditFlag == "">
                    否
                  </#if>
                </span>
              </li>
              <li class="ui-info-item ui-info-item-grey">
                <label class="ui-info-lbl ui-info-small">是否支持在线理赔</label>
                <span>
                  <#if product.claimOnline == 1>
                    是
                  <#elseif product.claimOnline == 0 || product.claimOnline == "">
                    否
                  </#if>
                </span> 
              </li>
              <li class="ui-info-item">
                <label class="ui-info-lbl ui-info-small">是否为统保产品</label>
                <span>
                  <#if product.isTotalProduct == 1>
                    是
                  <#elseif product.isTotalProduct == 0 || product.isTotalProduct == "">
                    否
                  </#if>
                </span> 
              </li>
              <li class="ui-info-item ui-info-item-grey cmu-produce" <#if product.isTotalProduct == 0 || product.isTotalProduct == "">style="display: none;"</#if> >
                <label class="ui-info-lbl">投保人姓名</label>
                ${user.realName}
              </li>
              <li class="ui-info-item cmu-produce" <#if product.isTotalProduct == 0 || product.isTotalProduct == "">style="display: none;"</#if> >
                <label class="ui-info-lbl">投保人电话</label>
                ${user.mobile}
              </li>
            </ul>
       </div>
       <div class="ui-info-main">
          <h2 class="ui-info-tit">产品保障信息</h2>
          <ul class="ui-info-list">
              <!--保障期限start-->
              <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear" style="padding-left:36px;">
                  <label class="ui-info-lbl">保障期限</label>
              </li>
              <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear" id="addItemDates">
                <#if perDateStr?if_exists>
                    <div class="produce-newdates">
                        <#list perDateStr as item>
                            <span class="ui-menuoptmargin">
                                ${item}
                            </span>
                        </#list>
                    </div>
                </#if>
              </li>
          </ul>
          <!--保障期限end-->
          <!--保障利益start-->
          <ul class="ui-info-list">
              <li class="ui-info-item ui-info-item-grey ui-guarant-item" id="guarantList" style="padding-left:36px;">
                    <label class="ui-info-lbl">保障利益</label>
                    
                    <div class="ui-guarant-wrap" <#if !benPoList?if_exists> style="display:none;" </#if> id="guarantInfor">
                        <ul class="ui-guarant-list" id="configBoxList">
                          <li>
                            <span class="ui-gone">保障利益标题</span>
                            <span class="ui-gtwo">是否必选</span>
                            <span class="ui-gthree">是否有前置条件</span>
                          </li>
                      <#if benPoList?if_exists>
                      <#list benPoList as item>
                           <li>
                                <div class="ui-guarant-tit">
                                    <a href="javascript:;" onclick="toggleSub(this);" class="ui-gone">
                                        <strong>${item.benefitName}</strong>
                                        <i class="ui-icon-arrow"></i>
                                    </a>
                                    <span class="ui-gtwo"></span>
                                    <span class="ui-gthree"></span>
                                </div>
                                <#list item.benefitsPoList as benItem>
                                    <table class="ui-guarant-tab" width="100%">
                                    <tbody>
                                    <tr class="ui-tab-last">
                                        <td width="30%" class="ui-td-fir">
                                            <span class="interest-nameitem">${benItem.benefitName1}</span>
                                        </td>
                                        <td width="35%">
                                            <#if benItem.isRequired == 1>
                                            是
                                            <#elseif benItem.isRequired == 0>
                                            否
                                            </#if>
                                        </td>
                                        <td width="30%">
                                            <#if benItem.condition == 1>
                                            是
                                            <#elseif benItem.condition == 0>
                                            否
                                            </#if>
                                        </td>
                                    </tr>
                                    <#if benItem.condition == 1>
                                        <tr class="ui-resureLimit-inner" style="display: table-row;">
                                            <td colspan="3" style="padding:10px 0;">
                                                <ul class="preadd-conditelist">
                                                    <#list benItem.benefitList as fitItem>
                                                    <li>
                                                        <label for="" style="margin:0 22px;">购买</label>
                                                            <#list benPoList as benPoItem>
                                                            <#list benPoItem.benefitsPoList as fitsList>
                                                                <#if fitsList.benefitId1 != benItem.benefitId1>
                                                                    <#if fitItem.preCondition == fitsList.benefitId1 >
                                                                        <strong>${fitsList.benefitName1}</strong>
                                                                    <#elseif fitItem.preCondition == 0>
                                                                        <strong>任意保障项目</strong>
                                                                    </#if>
                                                                </#if>
                                                            </#list>
                                                            </#list>
                                                        </select>
                                                            ${fitItem.minCondition}份
                                                    </li>
                                                    </#list>
                                                    <li>
                                                        <label for="" style="margin:0 22px;">可购买</label>
                                                        ${benItem.conditionQuota}份
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </#if>
                                    </tbody>
                                    </table>
                              </#list>
                            </li>
                      </#list>
                      </#if>
                        </ul>
                    </div>
              </li>
          </ul>
          <!--保障利益end-->
          <div>
              <ul class="ui-info-list" id="produceConfigBox" >
                  <#if benfitPoList?if_exists>
                    <li class="ui-info-item ui-info-item-grey ui-guarant-item ui-resureLimit-wrap fn-clear" style="padding-left:36px;">
                      <div class="ui-guarant-wrap" style="width:100%;overflow:auto;">
                      <div id="configBoxDetail">
                        <ul class="ui-guarant-list" style="width:100%;">
                          <li>
                              <span class="config-tit-one" style="margin:0 12px 0 0;">保障利益标题</span>
                              <span class="config-tit-two" style="width:120px;margin-right:0;">保障价格</span>
                              <span class="config-tit-three" style="width:120px;margin-right:180px;">保障次/天数</span>
                              <#if perDateStr?if_exists>
                                <#list perDateStr as item>
                                    <span class="config-tit-four" style="width:120px;margin-right:0;">
                                        ${item}
                                    </span>
                                </#list>
                            </#if>
                          </li>
                        </ul>
                        <!--start-->
                        <ul>
                            <#list benfitPoList as item>
                                <#list item.priceList as priceItem>
                              <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap produce-newconfig fn-clear">
                                  <label class="ui-info-lbl produece-align proconfig-txt">${item.benefitName}</label>
                                  <div class="ui-resureLimit-inner ui-resureLimit-fir" data-index="0">
                                            <#if priceItem.insuredAmount?number/1000000 gte 1>
                                                <#assign proPrice = (priceItem.insuredAmount/1000000)?string('0.##')>
                                                <#assign proPriceType = 3>
                                            <#elseif priceItem.insuredAmount?number/100000 gte 1>
                                                <#assign proPrice = (priceItem.insuredAmount/100000)?string('0.##')>
                                                <#assign proPriceType = 2>
                                            <#else>
                                                <#assign proPrice = (priceItem.insuredAmount/100)?string('0.##')>
                                                <#assign proPriceType = 1>
                                            </#if>
                                            
                                            <#assign inputKey = priceItem.priceId>
                                            <span class="produce-newtit">
                                                ${proPrice}<#if proPriceType == 1>元<#elseif proPriceType == 2>千元<#elseif proPriceType == 3>万元</#if>
                                            </span>
                                            <#if priceItem.insuredUnit?if_exists>
                                                <#list priceItem.insuredUnit?split(" ") as unitItem>
                                                    <#if unitItem_index == 0>
                                                        <#assign insuredUnitVal = unitItem> 
                                                    </#if>
                                                    <#if unitItem_index == 1>
                                                        <#assign insuredUnitType = unitItem>    
                                                    </#if>
                                                </#list>
                                            </#if>
                                            <span class="produce-newtit produce-newtit-midd">
                                            ${insuredUnitVal}<#if insuredUnitType=="次">次<#elseif insuredUnitType=="天">天</#if>
                                            </span>
                                            <label class="ui-info-lbl ui-info-lblw proconfig-premium">保费:</label>
                                            <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
                                            <#list item.benPriceList as price>
                                                <span class="fn-hide">0</span>
                                                <span class="produce-newtit">
                                                ${(price.productPremium/100)?string('0.##')} 元
                                                </span>
                                            </#list>
                                  </div>
                              </li>
                                </#list>
                              </#list>
                        </ul>
                        <!--end-->
                        </div>
                      </div>
                    </li>
                  </#if>
                  </ul>
        </div>
        </div>
        <div class="ui-info-main">
        <h2 class="ui-info-tit">产品投保信息</h2>
        <!--产品投保信息0start-->
        <#if paramsPo?if_exists>
        <#list paramsPo as item>
        <ul class="ui-info-list">
            <li class="ui-info-item ui-info-item-grey ui-guarant-item fn-clear">
                <div class="ui-guarant-wrap newconfig3-wd80">
                    <ul class="ui-guarant-list newconfig3-wd100" style="width:100%;">
                        <li class="produce-newseleitem">
                            <span class="newconfig3-tit-wd13 newconfig3-titpdl">${item.paramClass}信息</span>
                            <span class="newconfig3-tit-wd13">是否显示</span>
                            <span class="newconfig3-tit-wd22 newconfig3-titpdl">若显示，请选择是否为必填项</span>
                            <#--
                            <#if item.paramClass == "被保险人">
                                <span class="ui-gthree newconfig3-tit-wd30">
                                    <input type="checkbox" name="" value="" id="insuredSame">与投保人相同
                                </span>
                            </#if>
                            <#if item.paramClass == "标的">
                                <span class="ui-gthree newconfig3-tit-wd30">请在支持用户投保的参数前打√</span>
                            </#if>
                            -->
                        </li>
                        <li class="produce-newseleitem">
                            <div class="ui-guarant-tit" style="height:auto;border:0;"
                             <#if item.paramClass == "投保人"> id="insureInfor" <#elseif item.paramClass == "标的"> id="guarantList" </#if> >
                                <#if item.paramClass == "被保险人"> 
                                    <div id="otherinsureInfor"></div>
                                </#if>
                                
                                <table class="ui-guarant-tab produce-newteble" width="100%">
                                <#if item.paramList?if_exists>
                                <#list item.paramList as itemVal>
                                    <tr class="ui-tab-last">
                                        <td width="10%" class="ui-td-fir">
                                            ${itemVal.paramName}
                                        </td>
                                        <td width="10%">
                                            <#-- 设置是否显示 -->
                                            <#list paramsList as item>
                                                <#if item.paramVar == itemVal.paramVar>
                                                    <#assign flag = 1 >
                                                    <#break>
                                                <#else>
                                                    <#assign flag = 0 >
                                                </#if>
                                            </#list>
                                            <#if flag == 1>
                                                是
                                            <#elseif flag == 0>
                                                否
                                            </#if>
                                        </td>
                                        <td width="14%" style="display: <#if flag == 1>inline-block;<#else>none</#if>" >
                                            <#-- 设置是否必填 -->
                                            <#list paramsList as item>
                                                <#if item.isRequired != null && item.isRequired == itemVal.paramVar>
                                                    <#assign type = 1 >
                                                    <#break>
                                                <#else>
                                                    <#assign type = 0 >
                                                </#if>
                                            </#list>
                                            <#if type == 1>
                                                必填
                                            <#elseif type == 0>
                                                选填
                                            </#if>
                                        </td>
                                        <#if item.paramClass == "标的">
                                            <td width="30%">
                                                <div style="display: <#if flag == 1>inline-block;<#else>none</#if>">
                                                <span>
                                                    
                                                    <#-- 判断是否是全选 -->
                                                    <#if itemVal.paramValue != null>
                                                        <#assign jsonVal=itemVal.paramValue?eval />
                                                    </#if>
                                                    <#list paramsList as item>
                                                        <#if item.paramValue != null && itemVal.paramValue != null>
                                                            <#assign itemJsonVal=item.paramValue?eval />
                                                            <#if jsonVal?size==itemJsonVal?size >
                                                                <#assign allChooseFlag = 1 />   
                                                            </#if>
                                                        </#if>      
                                                    </#list>                                            
                                                    <#if itemVal.paramValue?if_exists>
                                                        <input type="checkbox" disabled="disabled" <#if allChooseFlag == 1>checked="checked"</#if> class="onerow-checked" name="paramMap[${itemVal.paramVar}].isChooseAll" value="1" >全选
                                                        <input type="hidden" name="paramMap[${itemVal.paramVar}].classId" value="${itemVal.classId}" >
                                                        </span>
                                                        <#assign json=itemVal.paramValue?eval />
                                                        <#list json as jsonVal>
                                                            ${item.paramValue}
                                                            <#list paramsList as item>
                                                                <#if item.paramValue != null>
                                                                    <#assign itemJsonVal=item.paramValue?eval />
                                                                </#if>
                                                                <#list itemJsonVal as itemVal >
                                                                    <#if itemVal.name == jsonVal.name >
                                                                        <#assign jsonFlag = 1>
                                                                    </#if>
                                                                </#list>
                                                            </#list>
                                                            <span class="proinsure-item">
                                                                <input type="checkbox" disabled="disabled" <#if jsonFlag==1>checked="checked"</#if> class="proinsure-item-chb" name="paramMap[${itemVal.paramVar}].paramValue" value="${jsonVal.value}">
                                                                <em>${jsonVal.name}</em>
                                                            </span>
                                                            ${jsonVal_index?number&2 == 1}
                                                            <#if jsonVal_index?number&2==1></br></#if>
                                                        </#list>
                                                    </#if>
                                                </span>
                                                </div>
                                            </td>
                                        <#else>
                                            <td width="30%"></td>
                                        </#if>
                                    </tr>
                                </#list>
                                </#if>
                                </table>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            </#list>
            </#if>
        </div>
     </div>    
     </div>
      <div class="ui-btn-double ui-detail-btnposition">
        <a href="javascript:history.back();" class="ui-a-return">返回</a>
      </div>
     </form>
  </div>
  
	<!---保障利益的弹框-->
	<iframe id="dlg-box" class="dlg-box" scrolling="auto" frameborder="0"  style="width:600px;height:500px;"></iframe>
	<!--提交成功-->  
	  <div id="dlg" class="easyui-dialog ui-dlg-alert"  data-options="iconCls:'icon-save',modal:true,closed: true">
	    <h3 class="ui-dlg-tit">您编辑产品请求已提交审核！</h3>
	    <input type="button" class="ui-dlgOk-btn" onclick="location.href='#'" value="查看审核详情"/>
	  </div>
	  
	 <script>
	 $(function(){
	    validExtend();
	   	richEdit();
	    prodProfit(); 
	    $('.ui-submit').click(function(){
	      var f=$(this).parents('form');
	      if(!f.form('validate')){
	      	alert("请将产品信息补充完整！");
	      	return false;
	      }
	      f.submit();
	    });
	    
	     $('input[name="beneficiaryNum"]').click(function(){//受益人自定义
	       if($(this).val()=='1'){
	         $('#maxBenef').show();
	       }else{
	         $('#maxBenef').hide();
	       }
	    });
	    
	});
	<!-- 查询下级分类 -->
	function getChildClass(obj){
   		var parentId = obj.value;
   		var childSel = document.getElementById("childSel");
	   	if(parentId != null){
	   		$.ajax({
		         url: '${base}/product/findChildClass?parentId='+parentId,
		         type: 'get',
		         datatype: 'text',
		         success: function(result) {
					<!--//根据id查找对象，-->
					var obj=document.getElementById("childSel");
					<!--删除所有节点 -->
					obj.options.length=0;
					obj.add(new Option("请选择",""));
					for(var i=0;i<result.length;i++){
						obj.add(new Option(result[i].className,result[i].classId));
					}
		         }
	       });
		}else{
	  		$.messager.alert('提示消息', '无下属分类！', 'warn');
		}
  	};
  	function prodEdit(obj){
  	   if($(obj).attr('data-type')=='info'){
  	     $(obj).val('完成并提交审核');
  	     $(obj).attr('data-type','edit');
  	     $('.prod-edit-item').show();
  	     $('.prod-edit-item-bef').hide();
  	   }else{
  	      var f=$(obj).parents('form');
	      if(f.form('validate')){
	  	     $.ajax({
				url : "${base}/product/updProduct",
				type : "post",
				data:$(obj).parents('form').serialize(),
				<#-- 成功后调用 -->
				success : function(data) {
					if(data.succ){
						alert("您编辑产品的请求已提交审核!");
						window.location.reload();
						window.location.href = "${base}/product/since/findListView";
					}else{
						alert(data.entity);
					}
				}
			});
		 }
  	   }
  	}
	</script>
</body>
</html>