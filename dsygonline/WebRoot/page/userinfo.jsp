<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript">
	function login() {
		var url = '<%=request.getContextPath()%>/customer/showLoginAction.action';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:350px;dialogwidth:500px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function logout() {
		window.location.href = '<c:url value="/customer/logoutAction.action"></c:url>';
	}
	
	function refresh() {
		window.location.href = '<c:url value="/product/showSearchProductAction.action"></c:url>';
	}
	
	function register() {
		var url = '<%=request.getContextPath()%>/customer/showClause.action';
		url += "?date=" + new Date();
		
		window.showModalDialog(url, window, "dialogheight:550px;dialogwidth:550px;dialogLeft:500px;dialogTop:200px;center:yes;status:0;resizable=no;Minimize=no;Maximize=no");
	}
	
	function cancel() {
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
</script>
<div style="font-size: 18px;">
	<span style="float: left;">
		东升盈港线上购物网站（DSYG online store）
	</span>
	<span style="float: right;">
		<s:if test="#session.user_id == null">
			<a href="#" name="login" onclick="login();">登录 </a> /
			<a href="#" name="register" onclick="register();">注册</a>
		</s:if>
		<s:else>
			<span>欢迎 <%=session.getAttribute("user_name")%></span> 
			<a href="#" name="logout" onclick="logout();">退出 </a> 
			<a href="#" name="chgpsd" onclick="chgpsd();">修改密码 </a> 
			<a href="#" name="cancel" onclick="cancel();">注销用户 </a>
			<a href="#" name="updcustomer" onclick="updcustomer();">客户信息 </a>
			<a href="#" name="orderlist" onclick="orderlist();">订单信息 </a>
		</s:else>
	</span>
</div>