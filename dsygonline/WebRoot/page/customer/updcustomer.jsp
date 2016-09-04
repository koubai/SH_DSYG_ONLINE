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

	function upd() {
		var companycn = $("#companycn").val().trim();
		if(companycn == "") {
			alert("购买方公司名不能为空！");
			$("#companycn").focus();
			return;
		}
	
		var companyen = $("#companyen").val().trim();
		if(companyen == "") {
			alert("购买方英文公司名或拼音不能为空！");
			$("#companyen").focus();
			return;
		}
		
		var name = $("#name").val();
		if(name.trim() == "") {
			alert("购买方姓名不能为空！");
			$("#name").focus();
			return;
		}
		
		var postcode = $("#postcode").val();
		if(postcode.trim() == "") {
			alert("购买方邮编不能为空！");
			$("#postcode").focus();
			return;
		}
		
		var address = $("#address").val();
		if(address.trim() == "") {
			alert("购买方地址不能为空！");
			$("#address").focus();
			return;
		}
		
		var tell = $("#tell").val();
		if(tell.trim() == "") {
			alert("购买方电话号码不能为空！");
			$("#tell").focus();
			return;
		}
		
		//收件人信息同上
		if($("#tmpInfo").attr("checked")) {
			$("#infoflag").val(1);
		} else {
			$("#infoflag").val(0);
		}

		var companycn2 = $("#companycn2").val().trim();
		if(companycn2 == "") {
			alert("收件人公司名不能为空！");
			$("#companycn2").focus();
			return;
		}
	
		var companyen2 = $("#companyen2").val().trim();
		if(companyen2 == "") {
			alert("收件人英文公司名或拼音不能为空！");
			$("#companyen2").focus();
			return;
		}
		
		var name2 = $("#name2").val();
		if(name2.trim() == "") {
			alert("收件人姓名不能为空！");
			$("#name2").focus();
			return;
		}
		
		var postcode2 = $("#postcode2").val();
		if(postcode2.trim() == "") {
			alert("收件人邮编不能为空！");
			$("#postcode2").focus();
			return;
		}
		
		var address2 = $("#address2").val();
		if(address2.trim() == "") {
			alert("收件人地址不能为空！");
			$("#address2").focus();
			return;
		}
		
		var tell2 = $("#tell2").val();
		if(tell2.trim() == "") {
			alert("收件人电话号码不能为空！");
			$("#tell2").focus();
			return;
		}
		
		//交货方法
		var list = document.getElementsByName("tmpPaytype");
		var v = 0;
		for(var j = 0; j < list.length; j++) {
			if(list[j].checked) {
				v = list[j].value;
				break;
			}
		}
		$("#paytype").val(v);
		
		var paytype = $("#paytype").val().trim();
		if(paytype == "0") {
			alert("请选择交货方法！");
			$("#tmpPaytype").focus();
			return;
		}
		
		$("#companycn2").removeAttr("disabled"); 
		$("#companyen2").removeAttr("disabled"); 
		$("#department2").removeAttr("disabled"); 
		$("#name2").removeAttr("disabled"); 
		$("#postcode2").removeAttr("disabled"); 
		$("#address2").removeAttr("disabled"); 
		$("#tell2").removeAttr("disabled");
		
		document.mainform.action = '<c:url value="/customer/updateCustomerAction.action"></c:url>';
		document.mainform.submit();
	}
	
	function changeInfo(obj) {
		if(obj.checked) {
			$("#companycn2").attr("disabled", true);
			$("#companyen2").attr("disabled", true);
			$("#department2").attr("disabled", true);
			$("#name2").attr("disabled", true);
			$("#postcode2").attr("disabled", true);
			$("#address2").attr("disabled", true);
			$("#tell2").attr("disabled", true);
			var companycn = $("#companycn").val().trim();
			$("#companycn2").attr("value", companycn);
			var companyen = $("#companyen").val().trim();
			$("#companyen2").attr("value", companyen);
			var department = $("#department").val().trim();
			$("#department2").attr("value", department);
			var name = $("#name").val().trim();
			$("#name2").attr("value", name);
			var postcode = $("#postcode").val().trim();
			$("#postcode2").attr("value", postcode);
			var address = $("#address").val().trim();
			$("#address2").attr("value", address);
			var tell = $("#tell").val().trim();
			$("#tell2").attr("value", tell);
			
		} else {
			$("#companycn2").attr("disabled", false);
			$("#companyen2").attr("disabled", false);
			$("#department2").attr("disabled", false);
			$("#name2").attr("disabled", false);
			$("#postcode2").attr("disabled", false);
			$("#address2").attr("disabled", false);
			$("#tell2").attr("disabled", false);
		}
	}
</script>
</head>
<body>
<jsp:include page="../head_web.jsp" flush="true" />
	<div id="containermain">
		<s:form id="mainform" name="mainform" method="POST">
			<s:hidden name="updCustomerDto.customerid" id="customerid"></s:hidden>
				<s:hidden name="updCustomerDto.paytype" id="paytype"></s:hidden>
				<s:hidden name="updCustomerDto.infoflag" id="infoflag"></s:hidden>
				<s:hidden name="updCustomerDto.accounttype" id="accounttype"></s:hidden>
				<s:hidden name="updCustomerDto.receipttype" id="receipttype"></s:hidden>
		<div style="position:absolute; margin-left: 150px; margin-top: 10px; text-align: center; color: red;">
			<s:actionmessage />
		</div>
		<table style="margin-left: 50px; margin-top: 30px;" border="0" cellspacing="15" cellpadding="0">
			<tr>
				<td>
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>购买方信息</strong></td>
								<td><font color="red">*</font>公司名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.companycn" id="companycn" onblur="changeAccount(this, '1');" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>英文公司名或拼音</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.companyen" id="companyen" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;所属部门</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updCustomerDto.department" id="department" cssStyle="width:250px;" maxlength="64" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.name" id="name" onblur="changeAccount(this, '2');" cssStyle="width:250px;" maxlength="32" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>邮编</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.postcode" id="postcode" cssStyle="width:250px;" maxlength="32" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.address" id="address" onblur="changeAccount(this, '3');" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>电话号码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.tell" id="tell" onblur="changeAccount(this, '4');" cssStyle="width:250px;" maxlength="32" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="trade">
						<table class="trade_tab" width="80%" border="0">
							<tr>
								<td align="left" width="15%"><strong>收件人信息</strong></td>
								<td colspan="2">
									<%-- <s:if test='updCustomerDto.infoflag == "1"'>
										<input id="tmpInfo" type="checkbox" style="width:5px;" onclick="changeInfo(this);" checked="checked" value="1"/>
									</s:if>
									<s:else>
										<input id="tmpInfo" type="checkbox" style="width:5px;" onclick="changeInfo(this);" value="1"/>
									</s:else> --%>
									<input id="tmpInfo" type="checkbox" style="width:5px;" onclick="changeInfo(this);" value="0"/>收件人信息同上
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>公司名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.companycn2" id="companycn2" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>英文公司名或拼音</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.companyen2" id="companyen2" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;所属部门</td>
								<td>
									<div class="box1">
										<div class="box1_left"></div>
										<div class="box1_center">
											<s:textfield name="updCustomerDto.department2" id="department2" cssStyle="width:250px;" maxlength="64" theme="simple"></s:textfield>
										</div>
										<div class="box1_right"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>姓名</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.name2" id="name2" cssStyle="width:250px;" maxlength="32" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>邮编</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.postcode2" id="postcode2" cssStyle="width:250px;" maxlength="32" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>地址</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.address2" id="address2" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>电话号码</td>
								<td>
									<div class="box1_left"></div>
									<div class="box1_center">
										<s:textfield name="updCustomerDto.tell2" id="tell2" cssStyle="width:250px;" maxlength="32" theme="simple"></s:textfield>
									</div>
									<div class="box1_right"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><font color="red">*</font>交货方法</td>
								<td>
									<s:if test='%{updCustomerDto.paytype == "2"}'>
										<input type="radio" name="tmpPaytype" style="width:40px;" value="1"/>配送(运费到付)
										<input type="radio" name="tmpPaytype" style="width:30px;" value="2" checked="checked"/>自提
									</s:if>
									<s:elseif test='%{updCustomerDto.paytype == "1"}'>
										<input type="radio" name="tmpPaytype" style="width:40px;" value="1" checked="checked"/>配送(运费到付)
										<input type="radio" name="tmpPaytype" style="width:30px;" value="2"/>自提
									</s:elseif>
									<s:else>
										<input type="radio" name="tmpPaytype" style="width:40px;" value="1" checked="checked"/>配送(运费到付)
										<input type="radio" name="tmpPaytype" style="width:30px;" value="2"/>自提
									</s:else>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="返回购物车" onclick=""/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="前往确认画面" onclick="upd();"/>
						</div>
						<div class="box1_right"></div>
					</div>
				</td>
			</tr>
		</table>
	</s:form>
	</div>
<jsp:include page="../foot_web.jsp" flush="true" />
</body>
</html>
