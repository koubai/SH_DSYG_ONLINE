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
	
	function logout() {
		document.mainform.action = '<c:url value="/customer/logoutAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
<jsp:include page="../head_web.jsp" flush="true" />
<s:form id="mainform" name="mainform" method="POST">
<div id="main" class="">
	<div class="main">
		<div class="content">
			会员账户已注销。 感谢您使用本网站。<br />
			<a href="#" name="logout" onclick="logout();">返回线上购买页面 </a>
		</div>
	</div>
</div>
</s:form>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
