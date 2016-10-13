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
	$(document).ready(function(){
		$.getJSON('<%=request.getContextPath()%>/shoppingcart/getShoppingCartAmount.action' + "?date=" + new Date(),{},
			function(data, status) {
				$("#shoppingcartdetail").html("<p>商品:&nbsp"+data.count+"件</p><p>金额:&nbsp"+data.taxamount+"元</p>");
			}
		);
	});
	
	//查询数据
	function queryList() {
		document.mainform.action = '<%=request.getContextPath()%>/product/searchProductAction.action';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		$("#startIndex").attr("value", pageNum);
		document.mainform.action = '<%=request.getContextPath()%>/product/turnSearchProductAction.action';
		document.mainform.submit();
	}

	//页跳转
	function turnPage(id) {
		var totalPage = "${page.totalPage}";
		var turnPage = document.getElementById(id).value;
		//判断是否输入页码
		if ('' != turnPage) {
			//判断页码是否是大于0的数字
			if(!iscInteger(turnPage)){
				alert('<s:text name="pagenumbercheck"/>');
				return;
			}
			turnPage = parseInt(turnPage);
			if(turnPage < 1){
				alert('<s:text name="pagenumbercheck"/>');
				return;
			}
			//判断页码大小是否正确
			if(turnPage > parseInt(totalPage)){
				alert('<s:text name="pagemaxcheck"/>');
				return;
			}
			//换页
			changePage(turnPage - 1);
		} else {
			alert('<s:text name="pagecodecheck"/>');
			return;
		}	
	}
	
	function search(stockfalg) {
		$("#stockfalg").val(stockfalg);
		queryList();
	}
	
	function searchFieldno(fieldno) {
		$("#fieldno").val(fieldno);
		queryList();
	}
	
	function addToShoppingCart(id) {
		var amount = $("#buyNum_" + id).val();
		var price = $("#onlinePrice_" + id).val();
		var minnum = $("#minNum_" + id).val();
		var basetaxprice = $("#baseTaxPrice_" + id).val();
		var pricelist = $("#onlinePriceList_" + id).val();
		
		if(price == "") {
			alert("该产品单价为空！");
			return;
		}
		//验证数据
		if(amount == "") {
			alert("请输入购买数量！");
			$("#buyNum_" + id).focus();
			return;
		}
		if(!isReal(amount)){
			alert("购买数量必须是大于0的整数！");
			$("#buyNum_" + id).focus();
			return;
		}
		//验证公倍数
		if(parseFloat(amount) % parseFloat(minnum) != 0) {
			alert("购买数量必须是最小单位的整数倍！");
			$("#buyNum_" + id).focus();
			return;
		}
		//var productInfo = id + "##" + amount + "##" + basetaxprice + "##" + pricelist;
		var productInfo = id + "##" + amount
		$.getJSON('<%=request.getContextPath()%>/shoppingcart/addShoppingCart.action' + "?date=" + new Date(),{productInfo:productInfo},
			function(data, status) {
				$("#shoppingcartdetail").html("<p>商品:&nbsp"+data.count+"件</p><p>金额:&nbsp"+data.taxamount+"元</p>");
				$("#buyNum_" + id).val("");
				alert("添加购物车成功！");
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
					<s:hidden name="startIndex" id="startIndex"/>
					<s:hidden name="stockfalg" id="stockfalg"/>
					<s:hidden name="fieldno" id="fieldno"/>
					<div class="product_search">
						<s:if test='firstfalg == "1"'>
							<div style="margin-top: 60px;">
								<div class="pfont1">
								东升盈港的网上商店成立了。 仅用于中国国内大陆地区销售。 旨在做到全球富有竞争力的单价<br>
								(交易条件请参考使用说明)。 在确认付款情况后,安排发送货物。<br>
								</div>
								<img src="<%=request.getContextPath()%>/images/dsyg_online.png" style="width: 800px;" alt="" />
							</div>
								<div class="pfont2">
							1.交期确认: 请将所需产品加入购物车后提交给我司<br>
							2.交期回复: 我司会以电邮形式回复商品交期<br>
							3.订单,汇款: 请使用交期回复中的链接进行订单提交<br>
							4.自提,送货: 我司会在确认汇款信息后,安排送货或恭候自提<br>	
							</div>
						</s:if>
						<s:if test='firstfalg != "1"'>
							<div style="position:fixed; top:110px; right:50px; width: 130px; height: 150px; background:  url(<%=request.getContextPath()%>/images/cart1-1.jpg )  no-repeat;" onclick="javascript:window.location.href='<%=request.getContextPath()%>/shoppingcart/showShoppingCartAction.action'">
						</s:if>
						<s:else>
							<div style="position:fixed; top:110px; right:50px; width: 300px; height: 100px; background: #f30 url(<%=request.getContextPath()%>/images/cart1-1.jpg); display: none;" onclick="javascript:window.location.href='<%=request.getContextPath()%>/shoppingcart/showShoppingCartAction.action'">
						</s:else>
								<div class="product_h3">
								<a id="shoppingcartdetail" href="javascript:void(0);">
								</a>
								</div>
							</div>
						<div class="tittle" style="margin-top: 60px;">
						</div>
						<table width="30%" border="0" cellpadding="0" cellspacing="10" style="position: absolute; margin-top: -98px; margin-left: 350px;">
							<tr>
								<s:if test='stockfalg == "1"'>
									<td>
										<a href="javascript:void(0);">
											<div class="product product_cur" style="height: 30px;" onclick="search('1');">
												<p>现货查询</p>
											</div>
										</a>
									</td>
									<td>
										<a href="javascript:void(0);">
											<div class="product" style="height: 30px;" onclick="search('');">
												<p>全部查询</p>
											</div>
										</a>
									</td>
								</s:if>
								<s:else>
									<td>
										<a href="javascript:void(0);">
											<div class="product" style="height: 30px;" onclick="search('1');">
												<p>现货查询</p>
											</div>
										</a>
									</td>
									<td>
										<a href="javascript:void(0);">
											<div class="product product_cur" style="height: 30px;" onclick="search('');">
												<p>全部查询</p>
											</div>
										</a>
									</td>
								</s:else>
							</tr>
						</table>
						<table width="80%" border="0" cellpadding="0" cellspacing="5">
							<tr><s:iterator id="goodsBaseList" value="goodsBaseList" status="st1"><s:if test="#st1.index < 3">
								<s:if test="%{goodsBaseList[#st1.index].code == fieldno}">
									<td width="33.3%"><a href="javascript:void(0);">
										<div class="product product_cur">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div>	</a>
									</td>
								</s:if>
								<s:else>
									<td width="33.3%"><a href="javascript:void(0);" onclick="searchFieldno('<s:property value="code"/>');">
										<div class="product">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div>	</a>
									</td>
								</s:else>
							</s:if></s:iterator></tr>
							<tr><s:iterator id="goodsBaseList" value="goodsBaseList" status="st1"><s:if test="#st1.index >= 3">
								<s:if test="%{goodsBaseList[#st1.index].code == fieldno}">
									<td width="33.3%"><a href="javascript:void(0);">
										<div class="product product_cur">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div></a>
									</td>
								</s:if>
								<s:else>
									<td width="33.3%"><a href="javascript:void(0);" onclick="searchFieldno('<s:property value="code"/>');">
										<div class="product">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div></a>
									</td>
								</s:else>
							</s:if></s:iterator></tr>
						</table>
						<div class="buttons" style="float: left;">
							<s:text name="keywordsearch"/><s:textfield name="strKeyword" id="strKeyword" cssClass="keyword" maxlength="16" theme="simple"></s:textfield>
							<a href="javascript:void(0);">
								<input type="button" class="search_btn" value="<s:text name="search"/>" onclick="queryList();" />
							</a>
						</div>
						<s:if test='firstfalg != "1"'>
							<div class="page">
								<span><s:text name="page"/> ${page.startIndex + 1} <s:text name="pageunit"/>/<s:text name="pagesizetotal"/> ${page.totalPage==0?1:page.totalPage} <s:text name="pageunit"/>　<s:text name="total"/> ${page.totalCount} <s:text name="records"/></span>
								<span><s:text name="skiptopage"/><input class="num" id="pagenum1" type="text" maxlength="6" /><s:text name="pageunit"/></span><a href="javascript:void(0);" onclick="javascript:turnPage('pagenum1');"><s:text name="go"/></a>　　
								<a href="javascript:void(0);" onclick="changePage(0);"><s:text name="homepage"/></a>
								<s:if test="%{page.startIndex <= 0}">
									<a href="javascript:void(0);"><s:text name="previous"/></a>
								</s:if>
								<s:else>
									<a href="javascript:void(0);" onclick="changePage('${page.previousIndex}');"><s:text name="previous"/></a>
								</s:else>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a href="javascript:void(0);"><s:text name="next"/></a>
								</s:if>
								<s:else>
									<a href="javascript:void(0);" onclick="changePage('${page.nextIndex}');"><s:text name="next"/></a>
								</s:else>
								<a class="next" href="javascript:void(0);" onclick="changePage('${page.totalPage - 1}');"><s:text name="lastpage"/></a>
							</div>
							<table class="product_tab" width="100%" border="1" cellspacing="5" cellpadding="10">
								<tr class="tab_tittle">
									<td>&nbsp;</td>
									<td><s:text name="brand"/></td>
									<td><s:text name="producttype"/></td>
									<td><s:text name="productname"/></td>
									<td><s:text name="specifications"/></td>
									<td><s:text name="color"/></td>
									<td>产地</td>
									<td>单价</td>
									<td><s:text name="unit"/></td>
									<td>最小单位</td>
									<td>购买</td>
									<td></td>
								</tr>
								<s:iterator value="productList" id="productList" status="st2">
									<s:if test="#st2.odd==true">
										<tr>
									</s:if>
									<s:else>
										<tr class="bg2">
									</s:else>
										<td><s:property value="page.pageSize * (page.nextIndex - 1) + #st2.index + 1"/></td>
										<td><s:property value="brand"/></td>
										<td>
											<s:iterator id="goodsList" value="goodsList" status="st3">
												<s:if test="%{goodsList[#st3.index].code == productList[#st2.index].fieldno}">
													<s:property value="fieldname"/>
												</s:if>
											</s:iterator>
										</td>
										<td>
											<s:if test='pdfpath != null && pdfpath != ""'>
												<a href="<s:property value="pdfurl"/><s:property value="pdfpath"/>" target="_blank"><s:property value="tradename"/></a>
											</s:if>
											<s:else>
												<s:property value="tradename"/>
											</s:else>
										</td>
										<td><s:property value="typeno"/></td>
										<td>
											<s:iterator value="colorList" id="colorList" status="st1">
												<s:if test="%{colorList[#st1.index].code == productList[#st2.index].color}">
													<s:property value="fieldname"/>
												</s:if>
											</s:iterator>
										</td>
										<td>
											<s:iterator value="makeareaList" id="makeareaList" status="st1">
												<s:if test="%{makeareaList[#st1.index].code == productList[#st2.index].makearea}">
													<s:property value="fieldname"/>
												</s:if>
											</s:iterator>
										</td>
										<td>
											<!-- <s:property value="item13"/> -->
											<span title="${showOnlinePriceTip}"><s:property value="onlineprice"/></span>
										</td>
										<td>
											<s:iterator value="unitList" id="unitList" status="st3">
												<s:if test="%{unitList[#st3.index].code == productList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
											</s:iterator>
										</td>
										<td>
											<s:property value="item12"/>
											<input id="minNum_<s:property value="id"/>" type="hidden" value="<s:property value="item12"/>"/>
											<input id="onlinePriceList_<s:property value="id"/>" type="hidden" value="<s:property value="item13"/>"/>
											<input id="onlinePrice_<s:property value="id"/>" type="hidden" value="<s:property value="onlineprice"/>"/>
											<input id="baseTaxPrice_<s:property value="id"/>" type="hidden" value="<s:property value="basetaxprice"/>"/>
										</td>
										<td>
											<input id="buyNum_<s:property value="id"/>" type="text" style="width: 50px;"/>
										</td>
										<td>
											<input type="button" value="加入购物车" onclick="addToShoppingCart('<s:property value="id"/>');"/>
										</td>
									</tr>
								</s:iterator>
							</table>
							<div class="page">
								<span><s:text name="page"/> ${page.startIndex + 1} <s:text name="pageunit"/>/<s:text name="pagesizetotal"/> ${page.totalPage==0?1:page.totalPage} <s:text name="pageunit"/>　<s:text name="total"/> ${page.totalCount} <s:text name="records"/></span>
								<span><s:text name="skiptopage"/><input class="num" id="pagenum2" type="text" maxlength="6" /><s:text name="pageunit"/></span><a href="javascript:void(0);" onclick="javascript:turnPage('pagenum2');"><s:text name="go"/></a>　　
								<a href="javascript:void(0);" onclick="changePage(0);"><s:text name="homepage"/></a>
								<s:if test="%{page.startIndex <= 0}">
									<a href="javascript:void(0);"><s:text name="previous"/></a>
								</s:if>
								<s:else>
									<a href="javascript:void(0);" onclick="changePage('${page.previousIndex}');"><s:text name="previous"/></a>
								</s:else>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a href="javascript:void(0);"><s:text name="next"/></a>
								</s:if>
								<s:else>
									<a href="javascript:void(0);" onclick="changePage('${page.nextIndex}');"><s:text name="next"/></a>
								</s:else>
								<a class="next" href="javascript:void(0);" onclick="changePage('${page.totalPage - 1}');"><s:text name="lastpage"/></a>
							</div>
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
