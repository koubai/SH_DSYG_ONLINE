<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript">
	function manageLogout() {
		//window.location.href = '<c:url value="/manage/manageLogoutAction.action"></c:url>';
	}
</script>
<div class="yzk_bottom">
	<p>上海東升盈港企業发展有限公司 <span style=" margin-left:40px; font-weight:normal; font-family:times; font-size:10px; color:#959595;">Copyright＠ D.S.Y.G Trade LTD. ALL Rights Reserved.</span></p>
	<div class="contactus">
		<ul>
			<li><a href="<c:url value="/home/showCompanyInfoAction.action"></c:url>">联系我们</a><span><img src="images/line.jpg" /></span></li>
			<li><a href="#">网站地图</a><span><img src="images/line.jpg" /></span></li>
			<li><a href="#">隐私条款</a></li>
		</ul>
		<ul>
			<li style="padding-left:40px;"><a href="http://www.miitbeian.gov.cn/">沪ICP备14019193号</a></li>
		</ul>
	</div>
</div>