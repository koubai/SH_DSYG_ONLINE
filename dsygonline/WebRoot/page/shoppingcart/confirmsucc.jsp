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
	function goProductList() {
		document.mainform.action = '<%=request.getContextPath()%>/product/searchProductAction.action';
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
					<s:hidden value="customerInfoDto.thesame" id="thesame"></s:hidden>
					<table border="0" cellspacing="0" cellpadding="10" style="margin-top: 80px; margin-left: 95px;">
						<tr>
							<td><p style="font-size: 16px; font-weight: bold;">询货请求已受理</p></td>
						</tr>
						<tr>
							<td>
								<p style="font-size: 12px;">
									感谢您发来询货请求。<br />
									单号：<s:property value="strOrderCode"/>，我们会尽快处理！
									<input type="button" onclick="goProductList();" value="继续购物"/>
								</p>
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
