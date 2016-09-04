<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login2.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>修改密码</title>
<style type="text/css">  
body{ font-size:28px; color:#FFF; background: #75D2FF url(<%=request.getContextPath()%>/images/bg7.jpg) no-repeat fixed bottom;  
}  
a { color:#FFF}  
.classname { margin-left: 50px; margin-right: 50px; border:solid 1px #2d2d2d;  text-align:center; background:#0080C0; padding:50px 50px 50px 50px;  -moz-border-radius: 5px;  -webkit-border-radius: 5px; border-radius: 5px;}  
.classname{text-shadow:5px  5px 5px #000000;}  
.classname{-moz-box-shadow:10px  10px 5px #000000;-webkit-box-shadow:10px  10px 5px #000000;box-shadow:10px  10px 5px #000000;}   
</style>  

<script type="text/javascript">
	$(document).ready(function(){
		var h = document.documentElement.clientHeight;
		$("#container").css("height", h);
	});

	function upd() {
		$(document).ready(function() {
			//使用jQuery异步提交表单
			$('#mainform').submit(function() {
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/customer/updCustomerPsdAction.action",
					async:false,
		            dataType: "json",
		            data: { 
						"oldpassword":$("#oldpassword").val(),
						"password":$("#password").val(),
						"repassword":$("#repassword").val()
					},
					success:function(data) {
		                if (data.msg != ""){
							alert(data.msg);
		                } else {
							//修改成功提示窗口
							alert("已完成密码变更");
							//关闭子窗口
							window.close();
		                }
					},
					error:function(data) {
		                alert("系统出现错误，请联系管理员");
					}
		        });
				return false;
			});
		});
	}

	function showMsg() {
		var msg = document.getElementById("message").innerText;
		alert(msg);
		if(msg == ""){
			//初始登录页面
		} else if(msg == " "){
			alert("eeeee");
			//刷新父窗口的网页
			window.dialogArguments.refresh();   
			//关闭子窗口
			window.close();
		} else {
			//alert(msg);
		}
	}
</script>
</head>
<body onload="">
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
				<input name="customerDto.belongto" type="hidden" style="width:200px;" maxlength="20" id="belongto" value="0"/>
				</tr>
				<tr>
					<td align="right">现有密码</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="customerDto.oldpassword" type="password" style="width:200px;" maxlength="15" id="oldpassword" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">新密码</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="customerDto.password" style="width:200px;" maxlength="16" type="password" id="password" />
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">新密码（确认）</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="customerDto.repassword" style="width:200px;" maxlength="16" type="password" id="repassword" />
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
								<input name="修改" type="submit" class="input80" value="修改" onclick="upd();" />
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
