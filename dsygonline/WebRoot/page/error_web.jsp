<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>东升盈港-错误页面</title>
<script type="text/javascript">
</script>
</head>
<body bgcolor="#ffffff">
<jsp:include page="./head_web.jsp" flush="true" />
<div id="main">
	<div class="content">
		<div class="error">
			<img src="<%=request.getContextPath()%>/images/error.png" />
			<p style="padding-top:40px;"><span class="gray">ERROR</span><span class="red chins">错误</span></p>
			<p>您访问的页面出错了，<a class="return1" href="<%=request.getContextPath()%>/home.shtml">返回首页</a></p>
		</div>
	</div>
</div>
</body>
</html>