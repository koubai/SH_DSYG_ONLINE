<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login2.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>新会员注册</title>
<style type="text/css">  
body{ font-size:28px; background: #75D2FF url(<%=request.getContextPath()%>/images/bg7.jpg) no-repeat fixed bottom;  
}  
a { color:#FFF}  
.classname { margin-left: 50px; margin-right: 50px; border:solid 1px #2d2d2d;  text-align:center; background:#0080C0; padding:50px 50px 50px 50px;  -moz-border-radius: 5px;  -webkit-border-radius: 5px; border-radius: 5px;}  
.classname{text-shadow:5px  5px 5px #000000;}  
.classname{-moz-box-shadow:10px  10px 5px #000000;-webkit-box-shadow:10px  10px 5px #000000;box-shadow:10px  10px 5px #000000;}   
</style> 
<script type="text/javascript">

	function showRegister() {
		document.mainform.action = '../customer/showAddCustomerAction.action';
		document.mainform.submit();
	}

</script>
</head>
<body>
	<div class="content">
		<s:form id="mainform" name="mainform" method="POST">
			<table class="login_tab" border="0" cellpadding="0" cellspacing="15">
				<tr>
					<td colspan="2">
						<div style="font-size: 15px; text-align: left;">
							 <b>1.会员章程</b>
							 <br/>
							 ・本章程规定了在东升盈港（以下简称“本网站”）进行过会员注册的用户（以下简称“会员”）在使用本网站时，会员与本公司之间所适用的各种条件。
							 <br/>
							 ・会员是指同意本章程及使用手册并按规定手续进行注册的用户。
							 <br/>
							 <b>2.会员注册</b>
							 <br/>
							 ・希望注册会员的用户，请在充分理解本章程后，根据本网站上的会员注册表来进行会员申请。
							 <br/>
							 ・申请的同时登陆会员登录名，即视为以本章程为基准的会员合约已成立。
							 <br/>
							 ・会员需同意将登录名、密码、邮件地址、住址等提供给本公司的各事项作为会员情报登录到本公司数据库。
							 <br/>
							 <b>3.登录名管理</b>
							 <br/>
							 ・会员需自行负责管理登录名，未经本公司许可，不得转让、借与第三方使用。
							 <br/>
							 ・如因不当管理会员登录名和密码、使用过失、第三方使用等引起的损失，本公司一概不负责任，由会员自行负责。
							 <br/>
							 <b>4.会员情报处理</b>
							 <br/>
							 ・本公司在会员情报管理上，遵守相关法律规定的同时，也会采取安全管理措施。
							 <br/>
							 ・除国家机关要求提供的情况以外，在事先未取得会员的同意下，本公司不会将个人情报透露给第三方。
							 <br/>
							 <b>5.注册内容更改</b>
							 <br/>
							 ・密码变更可在网站首页进行。住址可在下订单时直接进行覆盖修改。登录名不可更改。
							 <br/>
							 <b>6.注销步骤</b>
							 <br/>
							 ・会员注销时，使用本网站上的会员注销表即可进行注销。
							 <br/>
							 ・经本公司认定不符合会员条件的，将可能被取消会员资格。
							 <br/>
							 <b>7.针对会员的规定</b>
							 <br/>
							 ・会员在使用本网站时，禁止出现以下行为
							 <br/>
							  不正当地篡改本网站信息
							 <br/>
							  向本网站发送恶意的电脑程序
							 <br/>
							  妨碍本网站运营的行为
							 <br/>
							  上述之外，本公司判定的不适当行为
							 <br/>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">&nbsp;</td>
					<td>
						<div class="btn" style="margin-left:0;">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="同意会员章程并注册" type="submit" class="input150" value="同意会员章程并注册" onclick="showRegister();" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
			</table>	
		</s:form>
	</div>
</body>
</html>