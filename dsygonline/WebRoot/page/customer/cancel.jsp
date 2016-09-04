<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login2.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>注销会员</title>
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
	
	function cancel() {
		var delCustomerid = "<%=session.getAttribute("user_id")%>";
		window.dialogArguments.location.href = '../customer/delCustomerAction.action?delCustomerid=' + delCustomerid;
		window.close();
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
						<div>
							 将进行会员注销，是否同意？
							 <br />
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">&nbsp;</td>
					<td>
						<div class="btn" style="margin-left:0;">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="同意" type="submit" class="input80" value="同意" onclick="cancel();" />
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
