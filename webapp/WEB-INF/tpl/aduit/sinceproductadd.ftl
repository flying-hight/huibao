<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>标准产品新增-审核管理-系统管理</title>
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

    <div class="ui-info-main ui-standardadd-info">
            <ul class="ui-info-list ui-info-newlist">
              <li>
              	<h2 class="ui-info-tit">
              		操作内容
					运营-标准产品<#if product.sts == 1 || product.sts == 2>新增<#elseif  product.sts == 1 || product.sts == 2>修改</#if>请求
				</h2>
              </li>
              <li>
                <h2 class="ui-info-tit">产品基本信息</h2>
              </li>
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
                    <#if product.maxQuantity == -1>
	           				不限
           			<#else>
           				${product.maxQuantity - product.totalQuantity}份
           			</#if>
	           		<label class="ui-info-lbl ui-info-lblsmall">分配数量</label>
	           		0份
	           		<label class="ui-info-lbl ui-info-lblsmall">总库存</label>
	           		<span>
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
                <li class="ui-info-item ui-relative">
                    <label class="ui-info-lbl">产品标签</label>
                    <img src="${base}${product.productTagUrls}" width="120" height="120" data-leve='produce' id='productTagUrls'/>
                </li>
                <li class="ui-info-item ui-relative">
                    <label class="ui-info-lbl">产品优势</label>
                    <span class="ui-pictureshow">
                    <#list product.productAdvantage?split(";") as productAdvanUrls>
                        <img src="${base}${productAdvanUrls}" class="ui-page-fir ui-addimg" width="120" height="120"/>
                    </#list>
                    </span>
                </li>
                <li class="ui-info-item ui-relative">
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
                    <span class="ui-article-text prod-edit-item-bef" style="width:84%;" >
                      ${product.claimsGuide}
					</span>
                </li>
                <li class="ui-info-item ui-info-item-grey ui-rich-wrap" >
                    <label class="ui-info-lbl">温馨提示</label>
					<span class="ui-article-text prod-edit-item-bef" style="width:84%;" >
                      ${product.productPrompt}
					</span>
                </li>
                <li class="ui-info-item">
                <label class="ui-info-lbl ui-info-small">生效方式</label>
                <span>
                        <#if product.effectType==1>
                            即时生效
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
                  <#if product.policyType == 3>
                  	是
				  <#else>
				  	否
				  </#if>
                </span> 
              </li>
              <li class="ui-info-item electore-policy" <#if product.policyType == 2 >style="display:none"</#if> >
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
	                ${product.buyQuota} 份
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
              <li class="ui-info-item more-bendficiarie <#if product.beneficiaryNumStr == 0 || product.beneficiaryNumStr == "">fn-hide</#if>">
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
              <li class="ui-info-item fn-hide active-audit" <#if product.activation == 0 || product.activation == "">style="display: none;"</#if>>
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
              <li class="ui-info-item ui-info-item-grey ui-resureLimit-wrap fn-clear">
                  <label class="ui-info-lbl">请选择保障期限</label>
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
              <li class="ui-info-item ui-info-item-grey ui-guarant-item" id="guarantList">
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
										<tr class="fn-hide ui-resureLimit-inner" style="display: table-row;">
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
	              	<li class="ui-info-item ui-info-item-grey ui-guarant-item ui-resureLimit-wrap fn-clear">
					  <div class="ui-guarant-wrap" style="width:100%;overflow:auto;">
					  <div id="configBox">
					    <ul class="ui-guarant-list" style="width:100%;">
					      <li>
					          <span class="config-tit-one" style="margin:0 12px 0 0;">保障利益标题</span>
					          <span class="config-tit-two produce-detailshow">保障价格</span>
					          <span class="config-tit-three" style="width:120px;margin-right:180px;">保障次/天数</span>
					          <!--produce-newtit-midd-->
					          <#if perDateStr?if_exists>
	                      		<#list perDateStr as item>
	                          		<span class="config-tit-four produce-detailshow">
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
						          <div class="ui-resureLimit-inner ui-resureLimit-fir" data-index="0" style="text-align:center;">
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
				      						<span class="produce-detailshow" style="width:80px;margin-right:30px;line-height: 38px;">
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
									        <span class="produce-detailshow" style="width:120px;margin-right:80px;">
								            ${insuredUnitVal}<#if insuredUnitType=="次">次<#elseif insuredUnitType=="天">天</#if>
								            </span>
								            <label class="ui-info-lbl ui-info-lblw proconfig-premium">保费:</label>
								            <!--<a class="ui-guarant-reduce" href="javascript:;"></a>-->
						      				<#list item.benPriceList as price>
						      					<span class="fn-hide">0</span>
						      					<span class="produce-detailshow" style="width:120px;margin-right:1px;">
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
                    <ul class="ui-guarant-list newconfig3-wd100">
                        <li class="produce-newseleitem ui-borbottom">
                            <span class="newconfig3-tit-wd20 newconfig3-titpdl">${item.paramClass}信息</span>
                            <span class="newconfig3-tit-wd13 newconfig3-titpdl">是否显示</span>
                            <span class="newconfig3-tit-wd30 newconfig3-titpdl">若显示，请选择是否为必填项</span>
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
                             <#if item.paramClass == "投保人"> id="insureInfor" <#elseif item.paramClass == "标的"> id="guarantList2" </#if> >
                                <#if item.paramClass == "被保险人"> 
                                    <div id="otherinsureInfor"></div>
                                </#if>
                                
                                <table class="ui-guarant-tab produce-newteble" width="100%">
                                <#if item.paramList?if_exists>
                                <#list item.paramList as itemVal>
                                    <tr class="ui-tab-last ui-borbottom">
                                        <td width="15%" class="ui-td-fir">
                                            ${itemVal.paramName}
                                        </td>
                                        <td width="10%">
                                            <#-- 设置是否显示 -->
                                            <#list paramsList as item>
                                                <#if item.paramVar == itemVal.paramVar>
                                                    <#assign flg = 1 >
                                                    <#break>
                                                <#else>
                                                    <#assign flg = 0 >
                                                </#if>
                                            </#list>
                                            <#if flg == 1>
                                                	是
                                            <#else>
                                                	否
                                            </#if>
                                        </td>
                                        <td width="10%" >
                                        	<span <#if flg != 1>style="display:none"</#if>>
	                                            <#-- 设置是否必填 -->
	                                            <#list paramsList as item>
									            	<#if item.paramVar == itemVal.paramVar && item.isRequired == 1>
									            		<#assign type = 1 >
									            		<#break>
									            	<#else>
									            		<#assign type = 0 >
									            	</#if>
									            </#list>
	                                            <#if type == 1>必填<#elseif type == 0>选填</#if>
                                            </span>
                                        </td>
                                        <#if item.paramClass == "标的">
                                            <td width="30%" >
                                                <span <#if flg != 1>style="display:none"</#if>>
                                                    <#-- 判断是否是全选
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
                                                        <input type="checkbox" disabled="disabled" <#if allChooseFlag == 1>checked="checked"</#if> class="onerow-checked" name="paramMap[${itemVal.paramVar}].isChooseAll" value="1" >全选
                                                        -->
                                                    <#if itemVal.paramValue?if_exists>
                                                        <#assign json=itemVal.paramValue?eval />
														<#list json as jsonVal>
															${item.paramValue}
															<#list paramsList as item>
																<#if item.paramValue != null>
					                        						<#assign itemJsonVal=item.paramValue?eval />
					                        					</#if>
																<#list itemJsonVal as itemVal >
																	<#if itemVal.name == jsonVal.name >
																		<#assign jsonFlag = itemVal.name>
																	</#if>
																</#list>
															</#list>
		                                                    <span class="proinsure-item" <#if flg != 1>style="display:none"</#if>>
		                                                        <input type="checkbox" disabled <#if jsonFlag== jsonVal.name>checked="checked"</#if> class="proinsure-item-chb" name="paramMap[${itemVal.paramVar}].paramValue" value="${jsonVal.value}">
		                                                        <em>${jsonVal.name}</em>
		                                                    </span>
                                                            ${jsonVal_index?number&2 == 1}
                                                            <#if jsonVal_index?number&2==1></br></#if>
                                                        </#list>
                                                    </#if>
                                                </span>
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
        <div class="ui-info-main">
      	  <h2 class="ui-info-tit">审核信息</h2>
      	  	<div class="list-item fn-clear">
	      	  	<table id="dg-list" class="ebao-datagrid"  style="margin-right:10px;">	
				</table>
			</div>
      	</div>
        <form id="infoForm" method="post" action="">
        <div class="ui-info-main">
            <h2 class="ui-info-tit">审核意见</h2>
            <input type="hidden" name="auditId" value="${auditPo.auditId}" />
              <div>
                <ul class="ui-info-list">
	                <li class="ui-info-item ui-info-item-grey  ui-audit-rdo">
	                  <input type="radio" name="auditSts"  value="1" class="easyui-validatebox"  data-options="required:true,validType:{radio:['auditSts']}"/><label>审核通过</label>
	                  <input type="radio" name="auditSts" value="-1"/><label>审核不通过</label>
	              	</li>
	              	<li class="ui-info-item ui-audit-txta fn-hide">
	                  <textarea class="easyui-validatebox" placeholder="审核不通过理由"  name="auditComment"
	                          data-options="required:true"  missingMessage="请输入审核不通过理由" id="reason"></textarea>
	                </li>
              </div>
              <div class="ui-btn-double">
	                <#if auditPo.auditSts==0>
	                	<input type="button" onclick="saveproduct()" value="提交" class="ui-btn-blue"/>
	                </#if>
	                <input type="button" value="返回" class="ui-btn-grey ui-back"/>
              </div>
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
		var titlen = $(".config-tit-four").length;
		if(titlen>4){
		     var wd = (1+0.1*(titlen-4))*100;
		     $("#configBox").css('width',wd+'%');
		}
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
	
	<!-- 查询审核日志 -->
	$("#dg-list").datagrid({
			url: '${base}/product/findAuditLogs?productId='+${product.productId},
			method:'post',
			fitColumns:true,
			rownumbers:true,
			nowrap: true,
			idField:'logId',
			sortName:'reqTime',
			sortOrder:'desc',
			resizable:false,
			checkOnSelect:false,
			pagination:true,
			pageSize:10,
			columns:[[
				{field:'reqTime',align:'center',width:"15%",title:'提交时间',
					formatter:function(value,rec){
						return formatTimestamp(rec.reqTime,"yyyy-MM-dd HH:mm:ss");
					}
				},
				{field:'reqNickname',align:'center',width:"10%",title:'操作员'},
				{field:'auditSts',align:'center',width:"15%",title:'审核结果',
					formatter:function(value,rec){
			          	var str = "";
			          	if((Number)(value) == (Number)(-1)){
			          		str = "审核不通过";
			          	} else if((Number)(value) == (Number)(1)){
			          		str = "审核通过";
			          	} else if((Number)(value) == (Number)(0)){
			          		str = "待审核";
			          	} else {
			          		str = "未知状态";
			          	}
						return str;
					}
				},
				{field:'auditTime',align:'center',width:"15%",title:'审核时间',
					formatter:function(value,rec){
						return formatTimestamp(rec.auditTime,"yyyy-MM-dd HH:mm:ss");
					}
				},
				{field:'auditNickname',align:'center',width:"10%",title:'审核人',
					formatter:function(value,rec){
						var str = "";
						if(rec.auditSts != 0){
							str = value;
						}
						return str;
					}
				},
				{field:'auditComment',align:'center',width:"20%",title:'备注',
					formatter:function(value,rec){
						var str = "";
						if(value == "" || value == null){
							str = " / ";
						} else {
							str = value;
						}
						return str;
					}
				}
			]],
			queryParams: eb.form2Json("search-ff"),
	    loadFilter:function(data){
            return eb.loadFilter(data);    //自定义过滤方法
      	},
      	onLoadSuccess:function(data){
      		pageCls();
      	}
	 });
	//分页
	pageAction2();
	<!-- end-->
	
   function tomain(){
          window.location.href="${base}/aduit/aduitview";
   }
	</script>
</body>
</html>