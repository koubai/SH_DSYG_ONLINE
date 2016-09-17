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
					<div class="online_help">
						<div style="margin-top: 15px;">
							<div class="pfont0">
							<br>
							会员章程
							<br>
							<br>
							 成为东升盈港会员后
							 <br/>
							 登录后
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp申请订单时，不需要填写客户信息。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp订单履历及状况都可进行确认（设想）
							 <br/>
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />会员章程
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・本章程规定了在东升盈港（以下简称“本网站”）进行过会员注册的用户（以下简称“会员”）在使用本网站时，会员与本公司之间所适用的
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp各种条件。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・会员是指同意本章程及使用手册并按规定手续进行注册的用户。
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />会员注册</b>
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・希望注册会员的用户，请在充分理解本章程后，根据本网站上的会员注册表来进行会员申请。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・申请的同时登陆会员登录名，即视为以本章程为基准的会员合约已成立。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・会员需同意将登录名、密码、邮件地址、住址等提供给本公司的各事项作为会员情报登录到本公司数据库。
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />登录名管理</b>
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・会员需自行负责管理登录名，未经本公司许可，不得转让、借与第三方使用。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・如因不当管理会员登录名和密码、使用过失、第三方使用等引起的损失，本公司一概不负责任，由会员自行负责。
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />会员情报处理</b>
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・本公司在会员情报管理上，遵守相关法律规定的同时，也会采取安全管理措施。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・除国家机关要求提供的情况以外，在事先未取得会员的同意下，本公司不会将个人情报透露给第三方。
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />注册内容更改</b>
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・密码变更可在网站首页进行。住址可在下订单时直接进行覆盖修改。登录名不可更改。
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />注销步骤</b>
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・会员注销时，使用本网站上的会员注销表即可进行注销。
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・经本公司认定不符合会员条件的，将可能被取消会员资格。
							 <br/>
							 <img src="<%=request.getContextPath()%>/images/diamond.png" />针对会员的规定</b>
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp・会员在使用本网站时，禁止出现以下行为
							 <br/>
							  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp不正当地篡改本网站信息
							 <br/>
							 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 向本网站发送恶意的电脑程序
							 <br/>
							  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp妨碍本网站运营的行为
							 <br/>
							  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上述之外，本公司判定的不适当行为
							 <br/>		
							</div>
						</div>
					</div>
					<div class="buttons">
						<a href="#">
							<input type="button" class="search_btn" value="<s:text name="同意会员章程并注册"/>" onclick="showRegister();" />
						</a>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
