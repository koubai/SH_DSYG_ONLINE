<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<meta name="keywords" content="东升盈港" />
<meta name="description" content="东升盈港" />
<meta name="author" content="javascript:" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css<s:if test='#session.language == "en"'>/style_en.css</s:if><s:else>/style.css</s:else>" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title><s:text name="dsyg"/>-Online</title>
<script type="text/javascript">
	function showCustomerInfo() {
		document.mainform.action = '<%=request.getContextPath()%>/shoppingcart/showOrderCustomerInfo.action';
		document.mainform.submit();
	}
	
	function orderConfirm() {
		if(confirm("确定提交吗？")) {
			document.mainform.action = '<%=request.getContextPath()%>/shoppingcart/submitOrder.action';
			document.mainform.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="../head_web.jsp" flush="true" />
<div id="main">
	<div class="main">
		<div class="header_bg">
			<div class="content">
				<jsp:include page="../userinfo.jsp" flush="true" />
				<s:form id="mainform" name="mainform" method="POST">
					<s:hidden value="customerInfoDto.thesame" id="thesame"></s:hidden>
					<table border="0" cellspacing="0" cellpadding="10" style="margin-top: 80px; margin-left: 95px;">
						<tr>
							<td><p style="font-size: 16px; font-weight: bold;">确认</p></td>
						</tr>
						<tr>
							<td><p style="font-size: 12px;">下记内容确认无误的话，请点击“确认”按钮</p></td>
						</tr>
					</table>
					<table class="input_table" border="1" cellspacing="5" cellpadding="10">
						<tr class="tab_tittle">
							<td>&nbsp;</td>
							<td>商品</td>
							<td>单价</td>
							<td>订单数</td>
							<td>金额</td>
						</tr>
						<s:iterator value="shoppingCartList" id="shoppingCartList" status="st2">
							<s:if test="#st2.odd==true">
								<tr>
							</s:if>
							<s:else>
								<tr class="bg2">
							</s:else>
								<td><s:property value="#st2.index + 1"/></td>
								<td>
									<span style="font-weight: bold; font-size: 14px; color: black;">产品名称：</span><s:property value="tradename"/><br />
									<span style="font-weight: bold; font-size: 14px; color: black;">产品规格：</span><s:property value="typeno"/>　
									<s:iterator value="colorList" id="colorList" status="st1">
										<s:if test="%{colorList[#st1.index].code == shoppingCartList[#st2.index].color}">
											<s:property value="fieldname"/>
										</s:if>
									</s:iterator>　　
									<span style="font-weight: bold; font-size: 14px; color: black;">
										<s:iterator value="makeareaList" id="makeareaList" status="st1">
											<s:if test="%{makeareaList[#st1.index].code == shoppingCartList[#st2.index].makearea}">
												<s:property value="fieldname"/>
											</s:if>
										</s:iterator>
									</span>
									<br />
									<span style="font-weight: bold; font-size: 14px; color: black;">包装数：</span><s:property value="minnum"/>
									<s:iterator value="unitList" id="unitList" status="st3">
										<s:if test="%{unitList[#st3.index].code == shoppingCartList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
									</s:iterator>
								</td>
								<td>
									<s:property value="price"/>元
								</td>
								<td align="right">
									<span id="showbuyNum_<s:property value="productid"/>" style="color: black;"><s:property value="productNum"/></span>
									<s:iterator value="unitList" id="unitList" status="st3">
										<s:if test="%{unitList[#st3.index].code == shoppingCartList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
									</s:iterator>
								</td>
								<td align="right" id="moneyinfo_<s:property value="productid"/>">
									<s:property value="money"/>元<br />
									（含增值税）<s:property value="taxmoney"/>元
								</td>
							</tr>
						</s:iterator>
						<tr style="height: 40px;">
							<td align="right" colspan="4" style="font-size: 20px;font-weight: bold;">合计</td>
							<td align="right" colspan="2" style="font-size: 20px;font-weight: bold;" id="totalmoney">
								<s:property value="totalMoney"/>元<br />
								（含增值税）<s:property value="totalTaxMoney"/>元
							</td>
						</tr>
					</table>
					<table class="input_table" border="0" cellspacing="0" cellpadding="10" style="margin-top: 5px;">
						<tr>
							<td colspan="2"><p style="font-size: 16px; font-weight: bold;">购买方信息</p></td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">公司名：</td>
							<td>
								<s:property value="customerInfoDto.companycn" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">英文公司名或拼音：</td>
							<td>
								<s:property value="customerInfoDto.companyen" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span></span>所属部门：</td>
							<td>
								<s:property value="customerInfoDto.department" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">姓名：</td>
							<td>
								<s:property value="customerInfoDto.name" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">邮编：</td>
							<td>
								<s:property value="customerInfoDto.postcode" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">地址：</td>
							<td>
								<s:property value="customerInfoDto.address" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">电话号码：</td>
							<td>
								<s:property value="customerInfoDto.tell" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">E-mail地址：</td>
							<td>
								<s:property value="customerInfoDto.customeremail" />
							</td>
						</tr>
					</table>
					<table class="input_table" border="0" cellspacing="0" cellpadding="10" style="margin-top: 40px;">
						<tr>
							<td colspan="2">
								<p style="font-size: 16px; font-weight: bold;">收件人信息</p>
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">公司名：</td>
							<td>
								<s:property value="customerInfoDto.companycn2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">英文公司名或拼音：</td>
							<td>
								<s:property value="customerInfoDto.companyen2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span></span>所属部门：</td>
							<td>
								<s:property value="customerInfoDto.department2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">姓名：</td>
							<td>
								<s:property value="customerInfoDto.name2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">邮编：</td>
							<td>
								<s:property value="customerInfoDto.postcode2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">地址：</td>
							<td>
								<s:property value="customerInfoDto.address2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">电话号码：</td>
							<td>
								<s:property value="customerInfoDto.tell2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">E-mail地址：</td>
							<td>
								<s:property value="customerInfoDto.customeremail" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">交货方法 ：</td>
							<td>
								<s:if test='customerInfoDto.paytype == "2"'>
									自提
								</s:if>
								<s:else>
									配送
								</s:else>
							</td>
						</tr>
					</table>
					<div align="center" style="margin-top: 40px;">
						<input type="button" value="返回" onclick="showCustomerInfo();"/>
						<input type="button" value="确认" onclick="orderConfirm();"/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
