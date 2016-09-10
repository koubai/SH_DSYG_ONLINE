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
				$("#shoppingcartdetail").html(data.count + "件商品，价值" + data.amount + "元");
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
	function turnPage() {
		var totalPage = "${page.totalPage}";
		var turnPage = document.getElementById("pagenum").value;
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
		$.getJSON('<%=request.getContextPath()%>/shoppingcart/addShoppingCart.action' + "?date=" + new Date(),{productInfo:productInfo},
			function(data, status) {
				$("#shoppingcartdetail").html(data.count + "件商品，价值" + data.amount + "元");
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
								<img src="<%=request.getContextPath()%>/images/dsyg_online.png" alt="" />
							</div>
						</s:if>
						<s:if test='firstfalg != "1"'>
							<div style="position:fixed; top:120px; right:140px; width: 160px; height: 30px; background: #f30;">
						</s:if>
						<s:else>
							<div style="position:fixed; top:120px; right:140px; width: 160px; height: 30px; background: #f30; display: none;">
						</s:else>
								<s:if test="#session.shopping_cart == null">
									<a id="shoppingcartdetail" href="<%=request.getContextPath()%>/shoppingcart/showShoppingCartAction.action">0件商品，价值0元</a>
								</s:if>
								<s:else>
									<a id="shoppingcartdetail" href="<%=request.getContextPath()%>/shoppingcart/showShoppingCartAction.action"><s:property value="#session.shopping_cart.size()"/>件商品</a>
								</s:else>
							</div>
						<div class="tittle" style="margin-top: 60px;">
						</div>
						<table width="30%" border="0" cellpadding="0" cellspacing="10" style="position: absolute; margin-top: -98px; margin-left: 350px;">
							<tr>
								<s:if test='stockfalg == "1"'>
									<td>
										<a href="#">
											<div class="product product_cur" style="height: 30px;" onclick="search('1');">
												<p>现货查询</p>
											</div>
										</a>
									</td>
									<td>
										<a href="#">
											<div class="product" style="height: 30px;" onclick="search('');">
												<p>全部查询</p>
											</div>
										</a>
									</td>
								</s:if>
								<s:else>
									<td>
										<a href="#">
											<div class="product" style="height: 30px;" onclick="search('1');">
												<p>现货查询</p>
											</div>
										</a>
									</td>
									<td>
										<a href="#">
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
									<td width="33.3%"><a href="#">
										<div class="product product_cur">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div>	</a>
									</td>
								</s:if>
								<s:else>
									<td width="33.3%"><a href="#" onclick="searchFieldno('<s:property value="code"/>');">
										<div class="product">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div>	</a>
									</td>
								</s:else>
							</s:if></s:iterator></tr>
							<tr><s:iterator id="goodsBaseList" value="goodsBaseList" status="st1"><s:if test="#st1.index >= 3">
								<s:if test="%{goodsBaseList[#st1.index].code == fieldno}">
									<td width="33.3%"><a href="#">
										<div class="product product_cur">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div></a>
									</td>
								</s:if>
								<s:else>
									<td width="33.3%"><a href="#" onclick="searchFieldno('<s:property value="code"/>');">
										<div class="product">
											<p><s:property value="fieldname"/></p>
											<p class="arial"><s:property value="mean"/></p>
										</div></a>
									</td>
								</s:else>
							</s:if></s:iterator></tr>
						</table>
						<div class="buttons"><a href="#">
							<input type="button" class="search_btn" value="<s:text name="search"/>" onclick="queryList();" /></a>
						</div>
						<s:if test='firstfalg != "1"'>
							<div class="page">
								<span><s:text name="page"/> ${page.startIndex + 1} <s:text name="pageunit"/>/<s:text name="pagesizetotal"/> ${page.totalPage==0?1:page.totalPage} <s:text name="pageunit"/>　<s:text name="total"/> ${page.totalCount} <s:text name="records"/></span>
								<span><s:text name="skiptopage"/><input class="num" id="pagenum1" type="text" maxlength="6" /><s:text name="pageunit"/></span><a href="javascript:void(0);" onclick="javascript:turnPage();"><s:text name="go"/></a>　　
								<a href="#" onclick="changePage(0);"><s:text name="homepage"/></a>
								<s:if test="%{page.startIndex <= 0}">
									<a href="javascript:void(0);"><s:text name="previous"/></a>
								</s:if>
								<s:else>
									<a href="#" onclick="changePage('${page.previousIndex}');"><s:text name="previous"/></a>
								</s:else>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a href="javascript:void(0);"><s:text name="next"/></a>
								</s:if>
								<s:else>
									<a href="#" onclick="changePage('${page.nextIndex}');"><s:text name="next"/></a>
								</s:else>
								<a class="next" href="#" onclick="changePage('${page.totalPage - 1}');"><s:text name="lastpage"/></a>
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
											<s:property value="item13"/>
										</td>
										<td>
											<s:iterator value="unitList" id="unitList" status="st3">
												<s:if test="%{unitList[#st3.index].code == productList[#st2.index].unit}"><s:property value="fieldname"/></s:if>
											</s:iterator>
										</td>
										<td>
											<s:property value="item12"/>
											<input id="minNum_<s:property value="id"/>" type="hidden" value="<s:property value="item12"/>"/>
											<input id="onlinePrice_<s:property value="id"/>" type="hidden" value="<s:property value="item13"/>"/>
										</td>
										<td>
											<input id="buyNum_<s:property value="id"/>" type="text" style="width: 50px;"/>
										</td>
										<td>
											<input type="button" value="Add" onclick="addToShoppingCart('<s:property value="id"/>');"/>
										</td>
									</tr>
								</s:iterator>
							</table>
							<div class="page">
								<span><s:text name="page"/> ${page.startIndex + 1} <s:text name="pageunit"/>/<s:text name="pagesizetotal"/> ${page.totalPage==0?1:page.totalPage} <s:text name="pageunit"/>　<s:text name="total"/> ${page.totalCount} <s:text name="records"/></span>
								<span><s:text name="skiptopage"/><input class="num" id="pagenum1" type="text" maxlength="6" /><s:text name="pageunit"/></span><a href="javascript:void(0);" onclick="javascript:turnPage();"><s:text name="go"/></a>　　
								<a href="#" onclick="changePage(0);"><s:text name="homepage"/></a>
								<s:if test="%{page.startIndex <= 0}">
									<a href="javascript:void(0);"><s:text name="previous"/></a>
								</s:if>
								<s:else>
									<a href="#" onclick="changePage('${page.previousIndex}');"><s:text name="previous"/></a>
								</s:else>
								<s:if test="%{page.nextIndex > page.totalPage - 1}">
									<a href="javascript:void(0);"><s:text name="next"/></a>
								</s:if>
								<s:else>
									<a href="#" onclick="changePage('${page.nextIndex}');"><s:text name="next"/></a>
								</s:else>
								<a class="next" href="#" onclick="changePage('${page.totalPage - 1}');"><s:text name="lastpage"/></a>
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