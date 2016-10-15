<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.1.js"></script>
<script type="text/javascript">
	$("#divlogin").draggable();
	function login_old() {		
		var url = '<%=request.getContextPath()%>/customer/showLoginAction.action';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:350px;dialogwidth:500px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}

	function login() {
		$(document).ready(function() {
			//使用jQuery异步提交表单
			$('#loginform').submit(function() {
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
		                	hideDiv();
		                	refresh();
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
	
	function logout() {
		window.location.href = '<c:url value="/customer/logoutAction.action"></c:url>';
	}
	
	function refresh() {
		window.location.href = '<c:url value="/product/showSearchProductAction.action"></c:url>';
	}
	
	function register() {
		//var url = '<%=request.getContextPath()%>/customer/showClause.action';
		//url += "?date=" + new Date();
		
		//window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:550px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
		window.location.href = '<c:url value="/customer/showClause.action"></c:url>';
	}
	
	function cancel_old() {
		var userid = <%=session.getAttribute("user_id")%>;
		if(userid == null){
			alert("已超时，请重新登录！");
			window.location.href = '<c:url value="/product/showSearchProductAction.action"></c:url>';
		}
		var url = '<%=request.getContextPath()%>/customer/showDelCustomerAction.action';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:300px;dialogwidth:500px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function chgpsd() {
		var userid = <%=session.getAttribute("user_id")%>;
		if(userid == null){
			alert("已超时，请重新登录！");
			window.location.href = '<c:url value="/product/showSearchProductAction.action"></c:url>';
		}
		var url = '<%=request.getContextPath()%>/customer/showUpdCustomerPsdAction.action';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:400px;dialogwidth:500px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function updcustomer() {
		var userid = <%=session.getAttribute("user_id")%>;
		if(userid == null){
			alert("已超时，请重新登录！");
			window.location.href = '<c:url value="/product/showSearchProductAction.action"></c:url>';
		}
		window.location.href = '../customer/showUpdCustomerAction.action?updCustomerid=' + userid;
	}
	
	function orderlist() {
		window.location.href = '../order/queryOrderListAction.action';
	}

	function shop_help() {
		var url = '<%=request.getContextPath()%>/customer/showShopHelpAction.action';
		url += "?date=" + new Date();
		window.showModalDialog(url, window, "dialogheight:1000px;dialogwidth:1200px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function hideDiv() {
		$("#overlay").hide();
		$("#divlogin").hide();
	}
	
	function showDiv() {
		$("#overlay").show();
		$("#divlogin").show();
		$("#password").attr("value", "");
	}
	
	function hideRegister() {
		$("#overlay").hide();
		$("#divregister").hide();
	}
	
	function showRegister() {
		$("#overlay").show();
		$("#divregister").show();
		$("#passwordR").attr("value", "");
		$("#repassword").attr("value", "");
	}
	
	function hidePreRegister() {
		$("#overlay").hide();
		$("#divpreregister").hide();
	}
	
	function showPreRegister() {
		hideRegister();
		$("#overlay").show();
		$("#divpreregister").show();
	}
	
	function hideUpdpsd() {
		$("#overlay").hide();
		$("#divupdpsd").hide();
	}
	
	function showUpdpsd() {
		$("#overlay").show();
		$("#divupdpsd").show();
		$("#oldpassword").attr("value", "");
		$("#passwordU").attr("value", "");
		$("#repasswordU").attr("value", "");
	}
	
	function hideCancel() {
		$("#overlay").hide();
		$("#divcancel").hide();
	}
	
	function showCancel() {
		$("#overlay").show();
		$("#divcancel").show();
	}

	function sendPreMail() {
		$(document).ready(function() {
			//使用jQuery异步提交表单
			$('#registerform').submit(function() {
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/customer/addCustomerAction.action",
					async:false,
		            dataType: "json",
		            data: { 
						"customeremailR":$("#customeremailR").val(),
						"customerpsdR":$("#passwordR").val(),
						"customerrepsdR":$("#repassword").val()
					},
					success:function(data) {
		                if (data.msg != ""){
							alert(data.msg);
		                } else {
		                	showPreRegister();
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

	function upd() {
		$(document).ready(function() {
			//使用jQuery异步提交表单
			$('#updpsdform').submit(function() {
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/customer/updCustomerPsdAction.action",
					async:false,
		            dataType: "json",
		            data: { 
						"oldpassword":$("#oldpassword").val(),
						"password":$("#passwordU").val(),
						"repassword":$("#repasswordU").val()
					},
					success:function(data) {
		                if (data.msg != ""){
							alert(data.msg);
		                } else {
							//修改成功提示窗口
							alert("已完成密码变更");
							hideUpdpsd();
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
	
	function cancel() {
		$(document).ready(function() {
			//使用jQuery异步提交表单
			$('#cancelform').submit(function() {
				$.ajax({
		            type: "post",
		            url: "<%=request.getContextPath()%>/customer/delCustomerAction.action",
					async:false,
		            dataType: "json",
		            data: { 
					},
					success:function(data) {
		                if (data.msg != ""){
							alert(data.msg);
		                } else {
		                	window.location.href = '../customer/showDocancel.action';
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
	
</script>
<div style="font-size: 18px; font-family:"微软雅黑"">
	<span style="float: left; margin-top: 10px;">
		<a href="../product/searchProductAction.action">东升盈港产品线上购买（DSYG online store）</a>
	</span>
	<span style="float: right; margin-top: 10px;">
		<a href="#" name="shop_help" onclick="shop_help();">使用说明 </a> /
		<s:if test="#session.user_id == null">
			<a href="#" name="login" onclick="showDiv();">登录 </a> /
			<a href="#" name="register" onclick="register();">注册</a>
		</s:if>
		<s:else>
			<span>欢迎 <%=session.getAttribute("user_name")%></span> 
			<a href="#" name="logout" onclick="logout();">退出 </a> 
			<a href="#" name="chgpsd" onclick="showUpdpsd();">修改密码 </a> 
			<a href="#" name="cancel" onclick="showCancel();">注销用户 </a>
			<!-- <a href="#" name="updcustomer" onclick="updcustomer();">客户信息 </a> -->
			<a href="#" name="orderlist" onclick="orderlist();">订单信息 </a>
		</s:else>
	</span>
</div>
<div id="overlay" class="ui-widget-overlay" style="display:none; z-index: 1000;"></div>
<div id="divlogin" class="login_div">
	<div class="login_header">
		<span>登录</span>
		<input type="button" class="delete_icon" onclick="hideDiv();">
	</div>
	<div class="login_dialog" style="margin-top:20px;">
	<s:form id="loginform" name="loginform" method="POST">
		<table cellspacing="10">
			<tr>
				<td>邮件名</td>
				<td>
					<input name="" type="text" style="width:200px;" maxlength="60" id="customeremail" value="<s:property value="customeremail"/>"/>
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td>
					<input name="" style="width:200px;" maxlength="16" type="password" id="password" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="buttons" style="margin-top:30px;">
							<input type="submit" class="search_btn" value="登录" onclick="login();" />
							<input type="button" class="search_btn" value="取消" onclick="hideDiv();" />
					</div>
				</td>
			</tr>
		</table>
	</s:form>	
	</div>
</div>
<div id="divregister" class="login_div">
	<div class="login_header">
		<span>新会员注册</span>
		<input type="button" class="delete_icon" onclick="hideRegister();">
	</div>
	<div class="login_dialog" style="margin-top:1px;">
	<s:form id="registerform" name="registerform" method="POST">
		<table cellspacing="10">
			<tr>
				<td colspan="2">
					<div style="font-size: 15px; text-align: left;">
						 <img src="<%=request.getContextPath()%>/images/diamond.png" />会员注册方法
						 <br/>
						 &nbsp&nbsp&nbsp&nbsp1.请输入邮件地址
						 <br/>
						 &nbsp&nbsp&nbsp&nbsp2.临时登录的确认邮件已送达，请在1小时内使用
						 <br/>
						 &nbsp&nbsp&nbsp&nbsp邮件内记载的步骤进行正式登录。
						 <br/>
					</div>
				</td>
			</tr>
			<tr>
				<td>邮件名</td>
				<td>
					<input name="" type="text" style="width:200px;" maxlength="60" id="customeremailR" value="<s:property value="customeremailR"/>"/>
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td>
					<input name="" style="width:200px;" maxlength="16" type="password" id="passwordR" />
				</td>
			</tr>
			<tr>
				<td>密码(确认)</td>
				<td>
					<input name="" style="width:200px;" maxlength="16" type="password" id="repassword" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="buttons" style="margin-top:30px;">
							<input type="submit" class="search_btn" value="发送邮件" onclick="sendPreMail();" />
							<input type="button" class="search_btn" value="取消" onclick="hideRegister();" />
					</div>
				</td>
			</tr>
		</table>
	</s:form>	
	</div>
</div>
<div id="divpreregister" class="login_div">
	<div class="login_header">
		<span>新会员注册</span>
		<input type="button" class="delete_icon" onclick="hidePreRegister();">
	</div>
	<div class="login_dialog" style="margin-top:1px;">
	<s:form id="registerform" name="registerform" method="POST">
		<table cellspacing="10">
			<tr>
				<td colspan="2">
					<div style="font-size: 15px; text-align: left;">
						<br>
						已向您的邮件地址发送了确认邮件。
						<br>
						 烦请在1小时内进行正式登录
						 <br/>
						如果30分钟还未收到确认邮件，请与下记邮件地址联系确认。
						 <br/>
						 <br/>
						 sales@shdsyg.com	
						 <br/>
						 <br/>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="buttons" style="margin-top:30px;">
						<input type="button" class="search_btn" value="OK" onclick="hidePreRegister();" />
					</div>
				</td>
			</tr>
		</table>
	</s:form>	
	</div>
</div>
<div id="divupdpsd" class="login_div">
	<div class="login_header">
		<span>修改密码</span>
		<input type="button" class="delete_icon" onclick="hideUpdpsd();">
	</div>
	<div class="login_dialog" style="margin-top:1px;">
	<s:form id="updpsdform" name="updpsdform" method="POST">
		<table cellspacing="10">
			<tr>
				<td>现有密码</td>
				<td>
					<input name="" type="password" style="width:200px;" maxlength="15" id="oldpassword" />
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td>
					<input name="" style="width:200px;" maxlength="16" type="password" id="passwordU" />
				</td>
			</tr>
			<tr>
				<td>密码(确认)</td>
				<td>
					<input name="" style="width:200px;" maxlength="16" type="password" id="repasswordU" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="buttons" style="margin-top:30px;">
							<input type="submit" class="search_btn" value="修改" onclick="upd();" />
							<input type="button" class="search_btn" value="取消" onclick="hideUpdpsd();" />
					</div>
				</td>
			</tr>
		</table>
	</s:form>	
	</div>
</div>
<div id="divcancel" class="login_div">
	<div class="login_header">
		<span>注销用户</span>
		<input type="button" class="delete_icon" onclick="hideCancel();">
	</div>
	<div class="login_dialog" style="margin-top:1px;">
	<s:form id="cancelform" name="cancelform" method="POST">
		<table cellspacing="10">
			<tr>
				<td colspan="2">
					<div style="font-size: 15px; text-align: left;">
						<br>
						将进行会员注销，是否同意？
						<br>
						<br>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="buttons" style="margin-top:30px;">
							<input type="submit" class="search_btn" value="同意" onclick="cancel();" />
							<input type="button" class="search_btn" value="取消" onclick="hideCancel();" />
					</div>
				</td>
			</tr>
		</table>
	</s:form>	
	</div>
</div>