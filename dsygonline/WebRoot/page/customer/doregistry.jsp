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
<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/loopedslider.min.js" type="text/javascript"></script>
<title><s:text name="dsyg"/>-<s:text name="home"/></title>
<script type="text/javascript">
	$(function(){
		$('#newsSlider').loopedSlider({
			autoStart: 5000
		});
		$('.validate_Slider').loopedSlider({
			autoStart: 5000
		});
		$("#enter_lab").click(function(){
			window.location=$(this).find("a").attr("href"); return false;
		});
	});
	
	function showShop() {
		document.mainform.action = '<c:url value="/product/showSearchProductAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function updCustomer() {
		var companycn = $("#companycn").val().trim();
		var companyen = $("#companyen").val().trim();
		var department = $("#department").val().trim();
		var name = $("#name").val().trim();
		var postcode = $("#postcode").val().trim();
		var address = $("#address").val().trim();
		var tell = $("#tell").val().trim();
		
		if(companycn.length > 128) {
			alert("公司名不能超过128个字！");
			$("#companycn").focus();
			return;
		}
		document.mainform.action = '<c:url value="/customer/updCustomerAction.action"></c:url>';
		document.mainform.submit();
	}
</script>
</head>
<body>
<jsp:include page="../head_web.jsp" flush="true" />
<s:form id="mainform" name="mainform" method="POST">
	<div id="container" style="width: 100%; height: 100%;">
		<div class="content" style="margin-top: 0px;">
			<span id="content">
			已完成正式会员的登录。<br />
			感谢您成为东升盈港正式会员<br /><br />
			用户登录EMAIL:[ <font color="red"><s:property value="updCustomerDto.customeremail"/></font> ]<br />
			登录密码是新会员在注册时所输入的密码。<br /><br />
			已向您的邮件地址发送了确认邮件。<br />
			如果30分钟还未收到确认邮件，请与下记邮件地址联系确认。<br /><br />
			请进一步完善用户信息。
			</span>
		</div>
		<div class="content" style="margin-top: 0px;">
			<div style="position:absolute; margin-left: 150px; margin-top: 10px; text-align: center; color: red;">
				<s:actionmessage />
			</div>
			<table style="margin-left: 300px; margin-top: 30px;" border="0" cellspacing="15" cellpadding="0">
				<tr>
					<td width="100">公司名</td>
					<td width="500">
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.companycn" id="companycn" cssStyle="width:400px;" maxlength="128" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>英文公司名或拼音</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.companyen" id="companyen" cssStyle="width:400px;" maxlength="128" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>所属部门</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.department" id="department" cssStyle="width:400px;" maxlength="128" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>姓名</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.name" id="name" cssStyle="width:200px;" maxlength="32" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>邮编</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.postcode" id="postcode" cssStyle="width:200px;" maxlength="32" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>地址</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.address" id="address" cssStyle="width:400px;" maxlength="128" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
				<tr>
					<td>电话号码</td>
					<td>
						<div class="box1_left"></div>
						<div class="box1_center">
							<s:textfield name="updCustomerDto.tell" id="tell" cssStyle="width:200px;" maxlength="32" theme="simple"></s:textfield>
						</div>
						<div class="box1_right"></div>
					</td>
				</tr>
			</table>
		</div>
		<div class="content" style="margin-top: 0px;">
			<span id="content">
				<!-- <a href="#" name="updCustomer" onclick="updCustomer();">确认并返回线上购买页面 </a> -->
				<input type="button" class="search_btn2" value="确认并返回线上购买页面" onclick="updCustomer();"/>
			</span>
		</div>
	</div>
</s:form>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
