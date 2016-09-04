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
<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/loopedslider.min.js" type="text/javascript"></script>
<title><s:text name="dsyg"/>-<s:text name="home"/></title>
<script type="text/javascript">
	$(function(){
		$('#newsSlider').loopedSlider({
			autoStart: 5000
		});
		$('.validate_Slider').loopedSlider({
			autoStart: 5000
		});
		$("#enter_lab").click(function(){
			window.location=$(this).find("a").attr("href"); return false;
		});
	});
	
	function showShop() {
		document.mainform.action = '<c:url value="/product/showSearchProductAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
<jsp:include page="../head_web.jsp" flush="true" />
<s:form id="mainform" name="mainform" method="POST">
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<span id="content">
			感谢您发来询货请求。<br />
			已向您的邮件地址发送了确认邮件。<br />
			如果30分钟还未收到确认邮件，请与下记邮件地址联系确认。<br /><br />
			</span>
		</div>
		<div class="content" style="margin-top: 0px;">
			<span id="content">
				<a href="#" name="showShop" onclick="showShop();">返回线上购买页面 </a>
			</span>
		</div>
	</div>
</s:form>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
