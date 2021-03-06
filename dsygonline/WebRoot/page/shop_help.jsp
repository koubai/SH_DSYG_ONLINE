<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" /> 
<script type="text/javascript">
function windowClose() {
	window.close();
}


</script>
<title><s:text name="dsyg"/>-OnlineReadMe</title>
<head>
</head>
<body>
<div id="main">
	<div class="main">
		<div class="header_bg">
			<div class="content">
				<s:form id="mainform" name="mainform" method="POST">
					<div class="online_help">
							<div class="pfont0">
							网上订购使用说明
							</div>
							<div style="margin-top: 5px;">
								<div class="pfont1">
								东升盈港的网上商店成立了。 仅用于中国国内大陆地区销售。 旨在做到国内富有竞争力的现货供应及单价。<br>
								</div>
								<div class="pfont2">
								<br>
								<img src="<%=request.getContextPath()%>/images/diamond.png" />交易对象<br>
								&nbsp&nbsp中国国内大陆地区<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />交易币种<br>
								&nbsp&nbsp元(RMB) <br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />交易单位<br>
								&nbsp&nbsp最小包装数<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />从下单到交货<br>
								&nbsp&nbsp①交期确认：请将所需商品和数量检索出来后加入购物车，填写上客户姓名、住所地址等情报，且注明送货或者自提后发送给我司。<br>
								&nbsp&nbsp※这一步是交期确认。（并不是下订单。）<br>
								<br>
								&nbsp&nbsp②交期回复：我司会以邮件方式进行联络。邮件内会贴附记录了商品交期的URL链接，点击此链接便可确认到交期。<br>
								&nbsp&nbsp※所回答的交期为我司工作日且从到款日开始计算的天数。（并不是从下单日开始计算）<br>
								&nbsp&nbsp※所回答的交期可能会随着在库的变动而发生变化。如有较大的变化时，我司将另行通知。<br>
								<br>
								&nbsp&nbsp③下订单：使用交期回复邮件中的URL链接便可进行下单。<br>
								&nbsp&nbsp※只能购买经交期确认过的所需商品。<br>
								&nbsp&nbsp※多种类商品的订单还请在集齐所有商品后再发送给我司。在交期回复页面上可以进行订单分割，如有需要将交期较前的商品先安排送货的情况，请在交期回复页面上进行订单分割。<br>
								<br>
								&nbsp&nbsp④汇款：请将货款汇入下单后收到的回复邮件中所标明的银行账户。<br>
								&nbsp&nbsp※汇款所产生的手续费请客户自行承担。<br>
								<br>
								&nbsp&nbsp⑤自提、送货<br>
								&nbsp&nbsp・指定是自提的情况下，本公司会发送可以自提的邮件给您。还请来本公司指定仓库进行自提。自提时请带好本公司发送给您的邮件。<br>
								&nbsp&nbsp・指定是送货的情况下，本公司将以“快递/物流”形式发送货物给您。<br>
								<br>
								&nbsp&nbsp⑥发票<br>
								&nbsp&nbsp事后邮递寄送。<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />关于运费<br>
								&nbsp&nbsp我司承担运费(特殊情况除外)<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />付款方式<br>
								&nbsp&nbsp银行汇款<br>
								&nbsp&nbsp※请在下单后7个工作日（含下单日）内银行汇款。超过7日还未到款的情况下，订单会自动取消。<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />关于取消订单<br>
								&nbsp&nbsp因客户自身原因引起的订单取消我司一概不予以接受。请在下单时注意不要发生错误。<br>
								&nbsp&nbsp我司不会予以退货及退款。<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />关于产品品质<br>
								&nbsp&nbsp产品的生产实行最高的品质管理体制。<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />关于售价<br>
								&nbsp&nbsp售价会有浮动(例如铜价,汇率等因素变化)，我司网上商城系统会自行调整,且不会提前告知。<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />关于产品售后服务<br>
								&nbsp&nbsp完成交货后,超过1个月没有任何联系的,视为合格品,<br>
								&nbsp&nbsp我司不再提供任何售后服务。<br>
								<br>
								 <img src="<%=request.getContextPath()%>/images/diamond.png" />咨询联系方式<br>
								&nbsp&nbsp上海東升盈港企业发展有限公司<br>
								&nbsp&nbspShanghai DSYG Enterprise Development Co.<br>
								&nbsp&nbsp上海市杨浦区控江路760号<br>
								&nbsp&nbspNo.760 Kongjiang Road Yangpu District, Shanghai<br>																								
								&nbsp&nbsp电话号码: 021－65388038－0（总机）<br>
								&nbsp&nbsp传真：021－65387551<br><br>
								&nbsp&nbsp深圳東升盈港科技有限公司<br>
								&nbsp&nbspShenzhen DSYG Enterprise Development Co., Ltd.<br>
								&nbsp&nbsp广东省深圳市宝安区松岗街道华美路8号声宝佳信工业区 后二栋底楼<br>
								&nbsp&nbspNo 2 BackBuilding First ground, ShengBao Jiaxin industrial estate, NO. 8 Huamei Road SongGang Lane, Baoan distinct, Shenzhen City, Guangdong Province<br>
								&nbsp&nbsp电话号码: 0755－23576731（总机）<br>
								&nbsp&nbsp传真：0755－23576732<br><br>
								&nbsp&nbsp受理时间: 09:00～17:00 (工作日)<br>
								&nbsp&nbspE-mail地址: sales@shdsyg.com<br>			
								</div>
							</div>
							<br><br><br>
							<div align="middle">
								<input type="button" class="search_btn" value="<s:text name="关闭"/>" onclick="windowClose();" />
							</div>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./foot_web.jsp" flush="true" />
</body>
</html>