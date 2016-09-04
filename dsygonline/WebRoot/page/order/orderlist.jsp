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
	//查询数据
	function queryList() {
		document.mainform.action = '<%=request.getContextPath()%>/order/queryOrderListAction.action';
		document.mainform.submit();
	}
	
	//翻页
	function changePage(pageNum) {
		$("#startIndex").attr("value", pageNum);
		document.mainform.action = '<%=request.getContextPath()%>/order/turnOrderListAction.action';
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
	
	function showDetail(id) {
		$("#strOrderDetailId").val(id);
		document.mainform.action = '<%=request.getContextPath()%>/order/showOrderDetailAction.action';
		document.mainform.submit();
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
					<s:hidden name="strOrderDetailId" id="strOrderDetailId"/>
					<div class="product_search">
						<table>
							<tr>
								<td>订单号：</td>
								<td><input type="text" name="strOrdercode" id="strOrdercode" maxlength="32"/></td>
								<td>状态：</td>
								<td><input type="text" name="strStatus" id="strStatus" maxlength="32"/></td>
								<td>
									<div class="buttons">
										<a href="#">
											<input type="button" class="search_btn" value="<s:text name="search"/>" onclick="queryList();" />
										</a>
									</div>
								</td>
							</tr>
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
						<table class="product_tab" width="100%" border="1" cellspacing="5" cellpadding="10">
							<tr class="tab_tittle">
								<td>&nbsp;</td>
								<td>订单号</td>
								<td>交期</td>
								<td>金额</td>
								<td>含税金额</td>
								<td>订单状态</td>
								<td>创建时间</td>
							</tr>
							<s:iterator value="orderList" id="orderList" status="st2">
								<s:if test="#st2.odd==true">
									<tr>
								</s:if>
								<s:else>
									<tr class="bg2">
								</s:else>
									<td><s:property value="page.pageSize * (page.nextIndex - 1) + #st2.index + 1"/></td>
									<td>
										<a href="#" onclick="showDetail('<s:property value="id"/>');"><s:property value="ordercode"/></a>
									</td>
									<td><s:date name="deliverydate" format="yyyy/MM/dd" /></td>
									<td><s:property value="amount"/></td>
									<td><s:property value="taxamount"/></td>
									<td><s:property value="status"/></td>
									<td><s:date name="createdate" format="yyyy/MM/dd" /></td>
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
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
