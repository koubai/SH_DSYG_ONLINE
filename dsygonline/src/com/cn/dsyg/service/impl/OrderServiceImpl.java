package com.cn.dsyg.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.dsyg.dao.CustomerDao;
import com.cn.dsyg.dao.Dict01Dao;
import com.cn.dsyg.dao.OrderDao;
import com.cn.dsyg.dao.OrderDetailDao;
import com.cn.dsyg.dao.ProductDao;
import com.cn.dsyg.dto.CustomerDto;
import com.cn.dsyg.dto.Dict01Dto;
import com.cn.dsyg.dto.OrderDetailDto;
import com.cn.dsyg.dto.OrderDto;
import com.cn.dsyg.dto.ProductDto;
import com.cn.dsyg.dto.ShoppingCartDto;
import com.cn.dsyg.service.OrderService;

/**
 * @name OrderServiceImpl.java
 * @author Frank
 * @time 2016-9-4下午2:48:32
 * @version 1.0
 */
public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	private OrderDetailDao orderDetailDao;
	private Dict01Dao dict01Dao;
	private CustomerDao customerDao;
	private ProductDao productDao;

	@Override
	public Page queryOrderByPage(String ordercode, String customerid,
			String status, Page page) {
		//查询总记录数
		int totalCount = orderDao.queryOrderCountByPage(ordercode, customerid, status);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<OrderDto> list = orderDao.queryOrderByPage(ordercode, customerid, status,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		//查询明细数据
		if(list != null && list.size() > 0) {
			List<OrderDetailDto> orderDetailList = null;
			for(OrderDto order : list) {
				orderDetailList = orderDetailDao.queryOrderDetailByOrderid("" + order.getId());
				if(orderDetailList != null && orderDetailList.size() > 0) {
					ProductDto product = null;
					for(OrderDetailDto detail : orderDetailList) {
						product = productDao.queryProductByID("" + detail.getProductid());
						detail.setFieldno(product.getFieldno());
						detail.setTypeno(product.getTypeno());
						detail.setColor(product.getColor());
						detail.setBrand(product.getBrand());
						detail.setMakearea(product.getMakearea());
						detail.setPackaging(product.getPackaging());
						detail.setUnit(product.getUnit());
						detail.setTradename(product.getTradename());
					}
				}
				order.setOrderDetailList(orderDetailList);
			}
		}
		page.setItems(list);
		return page;
	}

	@Override
	public OrderDto queryOrderByID(String id) {
		OrderDto order = orderDao.queryOrderByID(id);
		if(order != null) {
			//邮件地址
			CustomerDto customer = customerDao.queryCustomerByID(order.getCustomerid());
			order.setCustomeremail(customer.getCustomeremail());
			//查询明细数据
			List<OrderDetailDto> orderDetailList = orderDetailDao.queryOrderDetailByOrderid("" + order.getId());
			if(orderDetailList != null && orderDetailList.size() > 0) {
				ProductDto product = null;
				for(OrderDetailDto detail : orderDetailList) {
					product = productDao.queryProductByID("" + detail.getProductid());
					detail.setFieldno(product.getFieldno());
					detail.setTypeno(product.getTypeno());
					detail.setColor(product.getColor());
					detail.setBrand(product.getBrand());
					detail.setMakearea(product.getMakearea());
					detail.setPackaging(product.getPackaging());
					detail.setUnit(product.getUnit());
					detail.setTradename(product.getTradename());
					detail.setMinnum(product.getItem12());
				}
			}
			order.setOrderDetailList(orderDetailList);
		}
		return order;
	}

	@Override
	public OrderDto queryOrderByOrdercode(String ordercode) {
		return orderDao.queryOrderByOrdercode(ordercode);
	}
	
	@Override
	public OrderDto createOrder(CustomerDto customer, List<ShoppingCartDto> shoppingcartlist, String ip) throws Exception {
		//计算金额
		BigDecimal totalMoney = new BigDecimal(0);
		BigDecimal totalTaxMoney = new BigDecimal(0);
		if(shoppingcartlist != null && shoppingcartlist.size() > 0) {
			for(ShoppingCartDto shoppingCart : shoppingcartlist) {
				totalMoney = totalMoney.add(shoppingCart.getMoney()).setScale(2, BigDecimal.ROUND_HALF_UP);
				totalTaxMoney = totalTaxMoney.add(shoppingCart.getTaxmoney()).setScale(2, BigDecimal.ROUND_HALF_UP);
			}
		}
		
		//订单
		OrderDto order = new OrderDto();
		//生成订单号
		String ordercode = orderSequence();
		order.setOrdercode(ordercode);
		order.setAmount(totalMoney);
		order.setTaxamount(totalTaxMoney);
		//状态=新增
		order.setStatus(Constants.ONLINE_ORDER_STATUS_NEW);
		order.setUpdateip(ip);
		//客户信息
		if(customer != null) {
			order.setCustomerid(customer.getCustomerid());
			//账户类型，1为企业，2为个人
			order.setAccounttype(customer.getAccounttype());
//			//公司税号
//			order.setCompanytax(customer.getCompanytax());
//			//公司开户行
//			order.setAccountbank(customer.getAccountbank());
//			//开户行账号
//			order.setAccountid(customer.getAccountid());
			order.setCompanycn(customer.getCompanycn());
			order.setCompanyen(customer.getCompanyen());
			order.setDepartment(customer.getDepartment());
			order.setName(customer.getName());
			order.setPostcode(customer.getPostcode());
			order.setAddress(customer.getAddress());
			order.setTell(customer.getTell());
			order.setCompanycn2(customer.getCompanycn2());
			order.setCompanyen2(customer.getCompanyen2());
			order.setDepartment2(customer.getDepartment2());
			order.setName2(customer.getName2());
			order.setPostcode2(customer.getPostcode2());
			order.setAddress2(customer.getAddress2());
			order.setTell2(customer.getTell2());
			//交货方法2：自提，1：配送
			order.setPaytype(customer.getPaytype());
			order.setCreateuid("" + customer.getCustomerid());
			order.setUpdateuid("" + customer.getCustomerid());
		}
		orderDao.insertOrder(order);
		
		//新增订单产品明细
		if(shoppingcartlist != null && shoppingcartlist.size() > 0) {
			for(ShoppingCartDto shoppingCart : shoppingcartlist) {
				OrderDetailDto detail = new OrderDetailDto();
				detail.setOrderid(order.getId());
				detail.setProductid(Integer.valueOf(shoppingCart.getProductid()));
				detail.setBatchno(shoppingCart.getBatchno());
				//数量
				detail.setNum(shoppingCart.getProductNum());
				//销售基础含税单价
				detail.setPrice(shoppingCart.getPrice());
				//实际销售含税单价
				detail.setTaxprice(shoppingCart.getSaleprice());
				//金额
				detail.setAmount(shoppingCart.getMoney());
				//含税金额
				detail.setTaxamount(shoppingCart.getTaxmoney());
				detail.setStatus(Constants.STATUS_NORMAL);
				detail.setCreateuid("" + customer.getCustomerid());
				detail.setUpdateuid("" + customer.getCustomerid());
				orderDetailDao.insertOrderDetail(detail);
			}
		}
		
		/*/邮件发送人，MailSender有默认发送人。
		String from = "";
		//收件人姓名，若不填则使用MailSender的默认收件人。
		String to = customer.getCustomeremail();
		//发件人名
		String username = "DSYG";
		//附件，格式：filename1,filename2,filename3...（这里需要在global.properties配置文件中指定附件目录）
		String attachfile = "";
		//邮件标题
		String subject = "【DSYG】受理交期确认（" + order.getOrdercode() + "）";
		//邮件内容
		String body = "";
		body += "非常感谢本次与DSYG-Online确认交期。<br/>";
		body += "在确认在库状况后，会尽快答复您的。但是，根据产品不同，答复所需的时间也会不同，这一点还请理解。<br/>";
		body += "<br/>";
		body += "受理日期        : " + DateUtil.dateToShortStr(order.getDeliverydate()) + "<br/>";
		body += "受理编号        : " + order.getOrdercode() + "<br/>";
		body += "<br/>";
		body += "■购买方<br/>";
		body += "--------------------------------------------------------------------<br/>";
		body += "公司名          : " + order.getCompanycn() + "<br/>";
		body += "英文公司名      : " + order.getCompanyen() + "<br/>";
		body += "所属部门        :" + order.getDepartment() + "<br/>";
		body += "姓名            : " + order.getName() + "<br/>";
		body += "邮编            : " + order.getPostcode() + "<br/>";
		body += "地址            : " + order.getAddress() + "<br/>";
		body += "电话号码        : " + order.getTell() + "<br/>";
		body += "E-mail地址      : " + customer.getCustomeremail() + "<br/>";
		body += "<br/>";
		body += "■收件人<br/>";
		body += "--------------------------------------------------------------------<br/>";
		body += "公司名          : " + order.getCompanycn2() + "<br/>";
		body += "英文公司名      : " + order.getCompanyen2() + "<br/>";
		body += "所属部门        :" + order.getDepartment2() + "<br/>";
		body += "姓名            : " + order.getName2() + "<br/>";
		body += "邮编            : " + order.getPostcode2() + "<br/>";
		body += "地址            : " + order.getAddress2() + "<br/>";
		body += "电话号码        : " + order.getTell2() + "<br/>";
		if("2".equals(order.getPaytype())) {
			body += "交货方法        : 自提<br/>";
		} else {
			body += "交货方法        : 配送<br/>";
		}
		body += "<br/>";
		for(int i = 0; i < shoppingcartlist.size(); i++) {
			ShoppingCartDto shoppingCart = shoppingcartlist.get(i);
			body += "■商品 No." + (i + 1) + "<br/>";
			body += "--------------------------------------------------------------------<br/>";
			body += "商品            : " + shoppingCart.getTradename() + "<br/>";
			body += "单价            : " + shoppingCart.getPrice() + "元<br/>";
			body += "变更数量        : " + shoppingCart.getProductNum() + "个<br/>";
			body += "合计            : " + shoppingCart.getMoney() + "元<br/>";
			body += "<br/>";
		}
		body += "<br/>";
		body += "--------------------------------------------------------------------<br/>";
		body += "合计            : " + totalMoney + "元<br/>";
		body += "含增值税        : " + totalTaxMoney + "元<br/>";
		body += "--------------------------------------------------------------------<br/>";
		body += "<br/>";
		body += "<br/>";
		body += "===================================================<br/>";
		body += "DSYG-Online<br/>";
		body += "东升营港<br/>";
		body += "手机号码: 13333333333<br/>";
		body += "受理时间: 08:30～12:00、12:45～17:15 (工作日)<br/>";
		body += "E-mail地址: dsyg@dsyg.com.cn<br/>";
		body += "https://www.dsyg.com.cn/dsygonline/<br/>";
		body += "===================================================<br/>";
		MailSender.send(from, to, subject, body, username, attachfile);
		//*/
		return order;
	}

	@Override
	public void insertOrder(OrderDto order) {
		orderDao.insertOrder(order);
	}

	@Override
	public void updateOrder(OrderDto order) {
		orderDao.updateOrder(order);
	}
	
	/**
	 * 订单CODE
	 * @return
	 */
	private String orderSequence() {
		String ordercode = "";
		List<Dict01Dto> listDict = dict01Dao.queryDict01ByFieldcode(Constants.DICT_ONLINE_ORDER, "c");
		if(listDict != null && listDict.size() > 0) {
			Dict01Dto dict = listDict.get(0);
			ordercode = "DSYG" + dict.getCode();
			//更新序号
			dict.setCode("" + (Integer.valueOf(dict.getCode()) + 1));
			dict01Dao.updateDict01(dict);
		} else {
			//没有数据，则新增一条数据
			Dict01Dto dict = new Dict01Dto();
			dict.setFieldcode(Constants.DICT_ONLINE_ORDER);
			dict.setFieldname("online单号序号");
			//默认10001开始
			int num = 10001;
			ordercode = "DSYG" + num;
			dict.setCode("" + (num + 1));
			dict.setLang("c");
			dict.setMean("online单号序号");
			dict.setNote("online单号序号");
			dict.setStatus(Constants.STATUS_NORMAL);
			dict.setCreateuid("system");
			dict.setUpdateuid("system");
			dict01Dao.insertDict01(dict);
		}
		return ordercode;
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public OrderDetailDao getOrderDetailDao() {
		return orderDetailDao;
	}

	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}

	public Dict01Dao getDict01Dao() {
		return dict01Dao;
	}

	public void setDict01Dao(Dict01Dao dict01Dao) {
		this.dict01Dao = dict01Dao;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
}
