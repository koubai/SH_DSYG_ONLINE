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
	function goShoppingCart() {
		document.mainform.action = '<%=request.getContextPath()%>/shoppingcart/showShoppingCartAction.action';
		document.mainform.submit();
	}
	
	function confirmPage() {
		var companycn = $("#companycn").val();
		var companyen = $("#companyen").val();
		var department = $("#department").val();
		var name = $("#name").val();
		var postcode = $("#postcode").val();
		var address = $("#address").val();
		var tell = $("#tell").val();
		var msg = "";
		if(companycn == "") {
			msg += "（购买方）公司名不能为空！\n";
		}
		if(companyen == "") {
			msg += "（购买方）英文公司名不能为空！\n";
		}
		if(name == "") {
			msg += "（购买方）姓名不能为空！\n";
		}
		if(postcode == "") {
			msg += "（购买方）邮编不能为空！\n";
		}
		if(address == "") {
			msg += "（购买方）地址不能为空！\n";
		}
		if(tell == "") {
			msg += "（购买方）电话号码不能为空！\n";
		}
		//收件人
		if(!$("#thesamechk").attr("checked")) {
			var companycn2 = $("#companycn2").val();
			var companyen2 = $("#companyen2").val();
			var department2 = $("#department2").val();
			var name2 = $("#name2").val();
			var postcode2 = $("#postcode2").val();
			var address2 = $("#address2").val();
			var tell2 = $("#tell2").val();
			if(companycn2 == "") {
				msg += "（收件人）公司名不能为空！\n";
			}
			if(companyen2 == "") {
				msg += "（收件人）英文公司名不能为空！\n";
			}
			if(name2 == "") {
				msg += "（收件人）姓名不能为空！\n";
			}
			if(postcode2 == "") {
				msg += "（收件人）邮编不能为空！\n";
			}
			if(address2 == "") {
				msg += "（收件人）地址不能为空！\n";
			}
			if(tell2 == "") {
				msg += "（收件人）电话号码不能为空！\n";
			}
			$("#thesame").val("0");
		} else {
			$("#thesame").val("1");
		}
		if(msg != "") {
			alert(msg);
			return;
		}
		
		var ll = $("input[name^='tmppaytype']");
		var paytype = "";
		for(var i = 0; i < ll.length; i++) {
			if(ll[i].checked) {
				paytype = ll[i].value;
				break;
			}
		}
		$("#paytype").val(paytype);
		
		if(confirm("确定提交吗？")) {
			document.mainform.action = '<%=request.getContextPath()%>/shoppingcart/showOrderConfirm.action';
			document.mainform.submit();
		}
	}
	
	function thesameinfo(obj) {
		var b = "";
		if(obj.checked) {
			b = "disabled";
		}
		$("#companycn2").attr("disabled", b);
		$("#companyen2").attr("disabled", b);
		$("#department2").attr("disabled", b);
		$("#name2").attr("disabled", b);
		$("#postcode2").attr("disabled", b);
		$("#address2").attr("disabled", b);
		$("#tell2").attr("disabled", b);
	}
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
					<s:hidden name="customerInfoDto.thesame" id="thesame"></s:hidden>
					<s:hidden name="customerInfoDto.paytype" id="paytype"></s:hidden>
					<table border="0" cellspacing="0" cellpadding="10" style="margin-top: 80px; margin-left: 95px;">
						<tr>
							<td><p style="font-size: 16px; font-weight: bold;">购买方、收件人</p></td>
						</tr>
					</table>
					<table class="input_table" border="0" cellspacing="0" cellpadding="10" style="margin-top: 5px;">
						<tr>
							<td colspan="2"><p style="font-size: 16px; font-weight: bold;">购买方信息</p></td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>公司名：</td>
							<td>
								<s:textfield name="customerInfoDto.companycn" id="companycn" cssStyle="width:360px;" maxlength="100" theme="simple"></s:textfield>
								[半角100/全角50文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>英文公司名或拼音：</td>
							<td>
								<s:textfield name="customerInfoDto.companyen" id="companyen" cssStyle="width:360px;" maxlength="100" theme="simple"></s:textfield>
								[半角100文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span></span>所属部门：</td>
							<td>
								<s:textfield name="customerInfoDto.department" id="department" cssStyle="width:360px;" maxlength="50" theme="simple"></s:textfield>
								[半角50/全角25文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>姓名：</td>
							<td>
								<s:textfield name="customerInfoDto.name" id="name" cssStyle="width:200px;" maxlength="50" theme="simple"></s:textfield>
								[半角50/全角25文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>邮编：</td>
							<td>
								<s:textfield name="customerInfoDto.postcode" id="postcode" cssStyle="width:100px;" maxlength="20" theme="simple"></s:textfield>
								[半角20文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>地址：</td>
							<td>
								<s:textfield name="customerInfoDto.address" id="address" cssStyle="width:360px;" maxlength="60" theme="simple"></s:textfield>
								[半角60/全角30文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>电话号码：</td>
							<td>
								<s:textfield name="customerInfoDto.tell" id="tell" cssStyle="width:200px;" maxlength="20" theme="simple"></s:textfield>
								[半角20文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>E-mail地址：</td>
							<td>
								<s:property value="customerInfoDto.customeremail" />
							</td>
						</tr>
					</table>
					<table class="input_table" border="0" cellspacing="0" cellpadding="10" style="margin-top: 40px;">
						<tr>
							<td colspan="2">
								<p style="font-size: 16px; font-weight: bold;">收件人信息　　　<span style="font-size: 12px; font-weight: normal; color: black;"><input id="thesamechk" type="checkbox" onclick="thesameinfo(this);"/>收件人信息同上</span></p>
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>公司名：</td>
							<td>
								<s:textfield name="customerInfoDto.companycn2" id="companycn2" cssStyle="width:360px;" maxlength="100" theme="simple"></s:textfield>
								[半角100/全角50文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>英文公司名或拼音：</td>
							<td>
								<s:textfield name="customerInfoDto.companyen2" id="companyen2" cssStyle="width:360px;" maxlength="100" theme="simple"></s:textfield>
								[半角100文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span></span>所属部门：</td>
							<td>
								<s:textfield name="customerInfoDto.department2" id="department2" cssStyle="width:360px;" maxlength="50" theme="simple"></s:textfield>
								[半角50/全角25文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>姓名：</td>
							<td>
								<s:textfield name="customerInfoDto.name2" id="name2" cssStyle="width:200px;" maxlength="50" theme="simple"></s:textfield>
								[半角50/全角25文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>邮编：</td>
							<td>
								<s:textfield name="customerInfoDto.postcode2" id="postcode2" cssStyle="width:100px;" maxlength="20" theme="simple"></s:textfield>
								[半角20文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>地址：</td>
							<td>
								<s:textfield name="customerInfoDto.address2" id="address2" cssStyle="width:360px;" maxlength="60" theme="simple"></s:textfield>
								[半角60/全角30文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>电话号码：</td>
							<td>
								<s:textfield name="customerInfoDto.tell2" id="tell2" cssStyle="width:200px;" maxlength="20" theme="simple"></s:textfield>
								[半角20文字以内]
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>E-mail地址：</td>
							<td>
								<s:property value="customerInfoDto.customeremail" />
							</td>
						</tr>
						<tr>
							<td class="td_tittle" width="200"><span>*</span>交货方法 ：</td>
							<td>
								<s:if test='customerInfoDto.paytype == "2"'>
									<input name="tmppaytype" type="radio" value="1"/>配送
									<input name="tmppaytype" type="radio" value="2" checked="checked"/>自提
								</s:if>
								<s:else>
									<input name="tmppaytype" type="radio" value="1" checked="checked"/>配送
									<input name="tmppaytype" type="radio" value="2"/>自提
								</s:else>
							</td>
						</tr>
					</table>
					<div align="center" style="margin-top: 40px;">
						<input type="button" class="search_btn" value="返回购物车" onclick="goShoppingCart();"/>
						<input type="button" class="search_btn" value="前往确认画面" onclick="confirmPage();"/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
