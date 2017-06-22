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
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td>
	<p>上海東升盈港企業发展有限公司 <span style=" margin-left:40px; font-weight:normal; font-family:times; font-size:10px; color:#959595;">Copyright＠ D.S.Y.G Trade LTD. ALL Rights Reserved.</span></p>
	<div class="contactus">
		<ul>
			<li><a href="<c:url value="../../dsyg/companyinfo.shtml"></c:url>">联系我们</a><span><img src="<%=request.getContextPath()%>/images/line.jpg" /></span></li>
			<li><a href="#">网站地图</a><span><img src="<%=request.getContextPath()%>/images/line.jpg" /></span></li>
			<li><a href="#">隐私条款</a></li>
		</ul>
		<ul>
			<li style="padding-left:40px;"><a href="http://www.miitbeian.gov.cn/">沪ICP备16052635号</a></li>
		</ul>
		<ul>
		 	<li style="padding-left:40px;"><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011002002038" style="display:inline-block;text-decoration:none;"><img src="<%=request.getContextPath()%>/images/beian.png" style="float:left;"/>沪公网安备 31011002002038号</a></li>
		</ul>
	</div>
	</td>
	<td>
		<a href="<%=request.getContextPath()%>/images/qrcode.jpg"><img alt="qrcode" src="<%=request.getContextPath()%>/images/qrcode_big.jpg" width="100" height="100"></a>	
	</td>
	</tr>
	</table>
</div>