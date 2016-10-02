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
	function deleteProduct(id) {
		if(confirm("确定删除该产品吗？")) {
			$("#delProductID").val(id);
			document.mainform.action = '<%=request.getContextPath()%>/shoppingcart/delShoppingCart.action?date=' + new Date();
			document.mainform.submit();
		}
	}
	
	function goProductlist() {
		document.mainform.action = '<%=request.getContextPath()%>/product/searchProductAction.action';
		document.mainform.submit();
	}
	
	function nextStep() {
		//验证购物车是否有内容
		var ll = $("input[name^='buyNum']");
		if(ll.length == 0) {
			alert("购物车中没有产品！");
			return;
		}
		document.mainform.action = '<%=request.getContextPath()%>/shoppingcart/showOrderCustomerInfo.action?date=' + new Date();
		document.mainform.submit();
	}
	
	function showChangeInput(id) {
		$("#buyNum_" + id).show();
		$("#showbuyNum_" + id).hide();
		$("#changebtn_" + id).hide();
		$("#okbtn_" + id).show();
	}
	
	function confirmChange(id) {
		var amount = $("#buyNum_" + id).val();
		var price = $("#onlinePrice_" + id).val();
		var minnum = $("#minnum_" + id).val();
		//验证数据
		if(amount == "") {
			alert("请输入购买数量！");
			$("#buyNum_" + id).focus();
			return;
		}
		if(!iscInteger(amount)){
			alert("购买数量必须是大于0的整数！");
			$("#buyNum_" + id).focus();
			return;
		}
		//验证公倍数
		if(parseInt(amount) % parseInt(minnum) != 0) {
			alert("购买数量必须是最小单位的整数倍！");
			$("#buyNum_" + id).focus();
			return;
		}
		var productInfo = id + "##" + amount + "##" + price;
		$.getJSON('<%=request.getContextPath()%>/shoppingcart/changeProductAmount.action' + "?date=" + new Date(),{productInfo:productInfo},
			function(data, status) {
				$("#moneyinfo_" + id).html("" + data.curramount + "元<br />（含增值税）" + data.currtaxamount + "元");
				$("#totalmoney").html("" + data.amount + "元<br />（含增值税）" + data.taxamount + "元");
				
				$("#showbuyNum_" + id).html(amount);
				$("#buyNum_" + id).val(amount);
				
				$("#buyNum_" + id).hide();
				$("#showbuyNum_" + id).show();
				$("#changebtn_" + id).show();
				$("#okbtn_" + id).hide();
		
				//$("#shoppingcartdetail").html("<p>商品:&nbsp"+data.count+"件</p><p>金额:&nbsp"+data.amount+"元</p>");
				//$("#buyNum_" + id).val("");
				//alert("添加购物车成功！");
			}
		);
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
					<s:hidden name="delProductID" id="delProductID"></s:hidden>
					<s:if test="shoppingCartList == null || shoppingCartList.size() == 0">
						<div class="product_search">
							<div style="margin-top: 60px; font-size: 18px;">
								购物车为空
							</div>
							<div>
								<input type="button" value="添加商品" onclick="goProductlist();"/>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="product_search">
							<div style="margin-top: 60px; font-size: 18px;">
								商品<br />
								稍后会发送“交期说明”的邮件<br />
								如果对交期说明邮件中所记录的交期没有疑问的话，请使用同一份邮件的订单手续进行下单。
							</div>
							<table class="product_tab" width="100%" border="1" cellspacing="5" cellpadding="10">
								<tr class="tab_tittle">
									<td>&nbsp;</td>
									<td>商品</td>
									<td>单价</td>
									<td>订单数</td>
									<td>金额</td>
									<td></td>
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
											<span style="font-weight: bold; font-size: 14px;">产品名称：</span><s:property value="tradename"/><br />
											<span style="font-weight: bold; font-size: 14px;">产品规格：</span><s:property value="typeno"/>　
											<s:iterator value="colorList" id="colorList" status="st1">
												<s:if test="%{colorList[#st1.index].code == shoppingCartList[#st2.index].color}">
													<s:property value="fieldname"/>
												</s:if>
											</s:iterator>　　
											<span style="font-weight: bold; font-size: 14px;">
												<s:iterator value="makeareaList" id="makeareaList" status="st1">
													<s:if test="%{makeareaList[#st1.index].code == shoppingCartList[#st2.index].makearea}">
														<s:property value="fieldname"/>
													</s:if>
												</s:iterator>
											</span>
											<br />
											<span style="font-weight: bold; font-size: 14px;">包装数：</span><s:property value="minnum"/>
											<s:iterator value="unitList" id="unitList" status="st3">
												<s:if test="%{unitList[#st3.index].code == shoppingCartList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
											</s:iterator>
										</td>
										<td>
											<span title="${showOnlinePriceTip}"><s:property value="saleprice"/></span>元
										</td>
										<td align="right">
											<span id="showbuyNum_<s:property value="productid"/>"><s:property value="productNum"/></span>
											<input id="minnum_<s:property value="productid"/>" style="display: none;" value="<s:property value="minnum"/>"/>
											<input id="onlinePrice_<s:property value="productid"/>" style="display: none;" value="<s:property value="price"/>"/>
											<input name="buyNum" id="buyNum_<s:property value="productid"/>" type="text" style="width: 55px; display: none;" value="<s:property value="productNum"/>"/>
											<s:iterator value="unitList" id="unitList" status="st3">
												<s:if test="%{unitList[#st3.index].code == shoppingCartList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
											</s:iterator>
											<br />
											<input type="button" id="changebtn_<s:property value="productid"/>" value="变更数量" onclick="showChangeInput('<s:property value="productid"/>');"/>
											<input type="button" id="okbtn_<s:property value="productid"/>" style="display: none;" value="确定变更" onclick="confirmChange('<s:property value="productid"/>');"/>
										</td>
										<td align="right" id="moneyinfo_<s:property value="productid"/>">
											<s:property value="money"/>元<br />
											（含增值税）<s:property value="taxmoney"/>元
										</td>
										<td>
											<input type="button" value="删除" onclick="deleteProduct('<s:property value="productid"/>');"/>
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
							<div>
								<input type="button" class="search_btn" value="继续购买" onclick="goProductlist();"/>
								<s:if test='#session.user_id != null && #session.user_id != ""'>
									<input type="button" class="search_btn" value="下一步" onclick="nextStep();"/>
								</s:if>
								<s:else>
									<input type="button" class="search_btn" value="新会员注册" onclick="register();"/>
									<input type="button" class="search_btn" value="登录后进入" onclick="showDiv();"/>
								</s:else>
							</div>
						</div>
					</s:else>
				</s:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
