<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/login2.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<title>登录</title>
<style type="text/css">  
body{ font-size:28px; background: #75D2FF url(<%=request.getContextPath()%>/images/bg7.jpg) no-repeat fixed bottom;  
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

	function login() {
		$(document).ready(function() {
			//使用jQuery异步提交表单
			$('#mainform').submit(function() {
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/customer/loginAction.action",
					async:false,
		            dataType: "json",
		            data: { 
						"customeremail":$("#customeremail").val(),
						"customerpsd":$("#password").val()
					},
					success:function(data) {
		                if (data.msg != ""){
							alert(data.msg);
		                } else {
							//刷新父窗口的网页
							window.dialogArguments.refresh();   
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
	
	/**
	 * 获取验证码
	 * @param obj
	 * @return
	 */
	function changeValidateCode(obj) {
		//获取当前的时间作为参数，无具体意义
	    var timenow = new Date().getTime();
	    //每次请求需要一个不同的参数，否则可能会返回同样的验证码
	    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
	    obj.src='<%=request.getContextPath()%>/index/rand.action?d='+timenow;
	    return false;
	}

	/**
	 * 获取验证码
	 * @param obj
	 * @return
	 */
	function changeValidate(id) {
		var timenow = new Date().getTime();
		if(document.getElementById(id) != null) {
			document.getElementById(id).src='<%=request.getContextPath()%>/index/rand.action?d='+timenow;
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
<!--				<select name="userDto.belongto" id="belongto" style="width: 100px;">
					<td align="right">登录地</td>
					<td>
					<div class="box1">
							<div>
									<option value="0" >上海</option>
									<option value="1" >深圳</option>
								</select>
 							</div>
						</div>
					</div>
					<td>
-->
				<input name="customerDto.belongto" type="hidden" style="width:200px;" maxlength="20" id="belongto" value="0"/>
				</tr>
				<tr>
					<td align="right">登录邮件名</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="customerDto.customeremail" type="text" style="width:200px;" maxlength="60" id="customeremail" value="<s:property value="customerDto.customeremail"/>"/>
							</div>
							<div class="box1_right"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">登录密码</td>
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
				<%-- <tr>
					<td align="right">验证码</td>
					<td>
						<div class="box1">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input type="text" name="userDto.verificationcode" style="width:130px;" id="verificationcode" maxlength="4" value="<s:property value="userDto.verificationcode"/>"/>
							</div>
							<div class="box1_right"></div>
						</div>
						<img title="看不清点我" id="randomImg" name="random" src="<%=request.getContextPath()%>/index/rand.action" onclick="changeValidateCode(this)" class="yzhm" />
					</td>
				</tr> --%>
				<tr>
					<td align="right">&nbsp;</td>
					<td>
						<div class="btn" style="margin-left:0;">
							<div class="box1_left"></div>
							<div class="box1_center">
								<input name="提交" type="submit" class="input80" value="登录" onclick="login();" />
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
