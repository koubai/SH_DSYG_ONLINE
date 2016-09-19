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
	function goOrderList() {
		document.mainform.action = '<%=request.getContextPath()%>/order/showOrderListAction.action';
		document.mainform.submit();
	}
	
	function cancelOrder() {
		if(confirm("确定关闭该订单吗？")) {
			document.mainform.action = '<%=request.getContextPath()%>/order/cancelOrderAction.action';
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
					<s:hidden name="strOrderDetailId" id="strOrderDetailId"></s:hidden>
					<table class="input_table" border="1" cellspacing="5" cellpadding="10" style="margin-top: 80px;">
						<tr class="tab_tittle">
							<td>&nbsp;</td>
							<td>商品</td>
							<td>单价</td>
							<td>订单数</td>
							<td>金额</td>
						</tr>
						<s:iterator value="showOrderDto.orderDetailList" id="orderDetailList" status="st2">
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
										<s:if test="%{colorList[#st1.index].code == showOrderDto.orderDetailList[#st2.index].color}">
											<s:property value="fieldname"/>
										</s:if>
									</s:iterator>　　
									<span style="font-weight: bold; font-size: 14px; color: black;">
										<s:iterator value="makeareaList" id="makeareaList" status="st1">
											<s:if test="%{makeareaList[#st1.index].code == showOrderDto.orderDetailList[#st2.index].makearea}">
												<s:property value="fieldname"/>
											</s:if>
										</s:iterator>
									</span>
									<br />
									<span style="font-weight: bold; font-size: 14px; color: black;">包装数：</span><s:property value="minnum"/>
									<s:iterator value="unitList" id="unitList" status="st3">
										<s:if test="%{unitList[#st3.index].code == showOrderDto.orderDetailList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
									</s:iterator>
								</td>
								<td>
									<span style="color: black;"><s:property value="taxprice"/></span>元
								</td>
								<td align="right">
									<span style="color: black;"><s:property value="num"/></span>
									<s:iterator value="unitList" id="unitList" status="st3">
										<s:if test="%{unitList[#st3.index].code == showOrderDto.orderDetailList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
									</s:iterator>
								</td>
								<td align="right">
									<s:property value="amount"/>元<br />
									（含增值税）<s:property value="taxamount"/>元
								</td>
							</tr>
						</s:iterator>
						<tr style="height: 40px;">
							<td align="right" colspan="4" style="font-size: 20px;font-weight: bold;">合计</td>
							<td align="right" colspan="2" style="font-size: 20px;font-weight: bold;">
								<s:property value="showOrderDto.amount"/>元<br />
								（含增值税）<s:property value="showOrderDto.taxamount"/>元
							</td>
						</tr>
					</table>
					<table class="input_table" border="0" cellspacing="0" cellpadding="10" style="margin-top: 5px;">
						<tr>
							<td class="td_tittle" width="200">订单状态：</td>
							<td>
								<s:if test="showOrderDto.status == 10">询货中</s:if>
								<s:elseif test="showOrderDto.status == 20">交期确认，待回复</s:elseif>
								<s:elseif test="showOrderDto.status == 30">已回复，受理中</s:elseif>
								<s:elseif test="showOrderDto.status == 40">下单成功，待付款</s:elseif>
								<s:elseif test="showOrderDto.status == 50">已付款，待确认</s:elseif>
								<s:elseif test="showOrderDto.status == 60">已收款，待发货</s:elseif>
								<s:elseif test="showOrderDto.status == 70">已发货，待收货</s:elseif>
								<s:elseif test="showOrderDto.status == 80">已收货，订单完成</s:elseif>
								<s:elseif test="showOrderDto.status == 99">订单已关闭</s:elseif>
							</td>
						</tr>
						<s:if test="showOrderDto.status >= 20 && showOrderDto.status != 99">
							<tr>
								<td class="td_tittle" width="200">交期：</td>
								<td>
									<s:date name="showOrderDto.deliverydate" format="yyyy/MM/dd"/>
								</td>
							</tr>
						</s:if>
						<s:if test="showOrderDto.status >= 50 && showOrderDto.status != 99">
							<tr>
								<td class="td_tittle" width="200">付款日：</td>
								<td>
									<s:date name="showOrderDto.cashdate" format="yyyy/MM/dd"/>
								</td>
							</tr>
						</s:if>
					</table>
					<table class="input_table" border="0" cellspacing="0" cellpadding="10" style="margin-top: 5px;">
						<tr>
							<td colspan="2"><p style="font-size: 16px; font-weight: bold;">购买方信息</p></td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">公司名：</td>
							<td>
								<s:property value="showOrderDto.companycn" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">英文公司名或拼音：</td>
							<td>
								<s:property value="showOrderDto.companyen" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span></span>所属部门：</td>
							<td>
								<s:property value="showOrderDto.department" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">姓名：</td>
							<td>
								<s:property value="showOrderDto.name" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">邮编：</td>
							<td>
								<s:property value="showOrderDto.postcode" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">地址：</td>
							<td>
								<s:property value="showOrderDto.address" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">电话号码：</td>
							<td>
								<s:property value="showOrderDto.tell" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">E-mail地址：</td>
							<td>
								<s:property value="showOrderDto.customeremail" />
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
								<s:property value="showOrderDto.companycn2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">英文公司名或拼音：</td>
							<td>
								<s:property value="showOrderDto.companyen2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span></span>所属部门：</td>
							<td>
								<s:property value="showOrderDto.department2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">姓名：</td>
							<td>
								<s:property value="showOrderDto.name2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">邮编：</td>
							<td>
								<s:property value="showOrderDto.postcode2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">地址：</td>
							<td>
								<s:property value="showOrderDto.address2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">电话号码：</td>
							<td>
								<s:property value="showOrderDto.tell2" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">E-mail地址：</td>
							<td>
								<s:property value="showOrderDto.customeremail" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200">交货方法 ：</td>
							<td>
								<s:if test='showOrderDto.paytype == "2"'>
									自提
								</s:if>
								<s:else>
									配送
								</s:else>
							</td>
						</tr>
					</table>
					<div align="center" style="margin-top: 40px;">
						<input type="button" value="返回" onclick="goOrderList();"/>
						<s:if test="showOrderDto.status < 50">
							<input type="button" value="取消" onclick="cancelOrder();"/>
						</s:if>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
