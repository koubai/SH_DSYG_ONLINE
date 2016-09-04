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
body{ font-size:28px; color:#FFF; background: #75D2FF url(<%=request.getContextPath()%>/images/bg7.jpg) no-repeat fixed bottom;  
}  
a { color:#FFF}  
.classname { margin-left: 50px; margin-right: 50px; border:solid 1px #2d2d2d;  text-align:center; background:#0080C0; padding:50px 50px 50px 50px;  -moz-border-radius: 5px;  -webkit-border-radius: 5px; border-radius: 5px;}  
.classname{text-shadow:5px  5px 5px #000000;}  
.classname{-moz-box-shadow:10px  10px 5px #000000;-webkit-box-shadow:10px  10px 5px #000000;box-shadow:10px  10px 5px #000000;}   
</style> 
<script type="text/javascript">
	$(function() {
	});
	
	function sendPreMail() {
		var customeremail = $("#customeremail").val();
		if(customeremail.trim() == "") {
			alert("请输入邮件地址！");
			$("#customeremail").focus();
			return;
		}
		if(customeremail != "" && !isMail(customeremail)) {
			alert("请确认邮件地址！");
			$("#customeremail").focus();
			return;
		}
		var password = $("#password").val();
		if(password.trim() == "") {
			alert("请输入密码！");
			$("#password").focus();
			return;
		}
		var repassword = $("#repassword").val();
		if(repassword.trim() == "") {
			alert("请输入确认密码！");
			$("#repassword").focus();
			return;
		}
		if(password != repassword){
			alert("两次密码不一致！");
			$("#repassword").focus();
			return;
		}
		document.mainform.action = '../customer/addCustomerAction.action';
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
						<div style="font-size: 15px; ; position:absolute; margin-left: 20px; margin-top: -40px; text-align: center; color: red;">
							<span id="message"><s:actionmessage /></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="font-size: 15px; text-align: left;">
							 会员注册方法
							 <br/>
							 1.请输入邮件地址
							 <br/>
							 2.临时登录的确认邮件已送达，请在1小时内使用
							 <br/>
							   邮件内记载的步骤进行正式登录。
							 <br/>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">E-mail地址</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="addCustomerDto.customeremail" type="text" style="width:200px;" maxlength="20" id="customeremail" value="<s:property value="addCustomerDto.customeremail"/>"/>
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">密码</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="addCustomerDto.password" style="width:200px;" maxlength="16" type="password" id="password" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">密码(确认)</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="addCustomerDto.repassword" style="width:200px;" maxlength="16" type="password" id="repassword" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">&nbsp;</td>
					<td>
						<div class="btn" style="margin-left:0;">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="发送邮件" type="submit" class="input80" value="发送邮件" onclick="sendPreMail();" />
							</div>
							<div class="box1_right"></div>
						</div>
						<div class="btn">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="取消" type="button" class="input80" value="取消" onclick="window.close();" />
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
