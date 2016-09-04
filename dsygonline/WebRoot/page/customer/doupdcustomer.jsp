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

	function doupd() {
		document.mainform.action = '<c:url value="/customer/sendConfirmMailAction.action"></c:url>';
		document.mainform.submit();
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
										<s:textfield name="updCustomerDto.companycn" disabled="true" id="companycn" onblur="changeAccount(this, '1');" cssStyle="width:250px;" maxlength="128" theme="simple"></s:textfield>
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
							<input class="input80" type="button" value="返回" onclick=""/>
						</div>
						<div class="box1_right"></div>
					</div>
					<div class="btn">
						<div class="box1_left"></div>
						<div class="box1_center">
							<input class="input80" type="button" value="确认" onclick="doupd();"/>
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
