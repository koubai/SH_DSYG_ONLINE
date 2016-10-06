package com.cn.dsyg.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.util.Constants;
import com.cn.common.util.DateUtil;
import com.cn.dsyg.dto.MailAuthDto;
import com.cn.dsyg.dto.OrderDto;
import com.cn.dsyg.service.CustomerService;
import com.cn.dsyg.service.MailAuthService;
import com.cn.dsyg.service.OrderDetailService;
import com.cn.dsyg.service.OrderService;
import com.cn.dsyg.service.ScheduleService;

/**
 * @name ScheduleServiceImpl.java
 * @author Frank
 * @time 2016-10-1上午9:36:34
 * @version 1.0
 */
public class ScheduleServiceImpl implements ScheduleService {
	
	private OrderService orderService;
	private OrderDetailService orderDetailService;
	private MailAuthService mailAuthService;
	private CustomerService customerService;
	
	private static final Logger log = LogManager.getLogger(ScheduleServiceImpl.class);

	@Override
	public void scheduleJob() {
		try {
			//交期订单处理
			deliveryOrder();
			//未付款记录处理
			noPayOrder();
			//邮件确认数据处理
			mailAuth();
		} catch(Exception e) {
			log.error("==============scheduleJob error================" + e);
		}
	}
	
	/**
	 * 交期订单处理
	 */
	private void deliveryOrder() {
		try {
			//交期订单处理，处理3天未处理数据
			Date date = new Date();
			String deliverydate = DateUtil.dateToLongStr(DateUtil.addDays(date, -3));
			List<OrderDto> list = orderService.queryOrderBySchedule("" + Constants.ONLINE_ORDER_STATUS_REF_DELIVERY, deliverydate, "");
			if(list != null && list.size() > 0) {
				log.info("deliveryOrder list.size()=" + list.size());
				for(OrderDto order : list) {
					//关闭订单
					order.setStatus(Constants.ONLINE_ORDER_STATUS_CLOSE);
					order.setNote("订单过期未处理。");
					order.setUpdateuid("system");
					orderService.updateOrder(order);
				}
			}
		} catch(Exception e) {
			log.error("==============deliveryOrder error================" + e);
		}
	}
	
	/**
	 * 未付款记录处理
	 */
	private void noPayOrder() {
		try {
			//交期订单处理，处理7天未处理数据
			Date date = new Date();
			String updatedate = DateUtil.dateToLongStr(DateUtil.addDays(date, -7));
			List<OrderDto> list = orderService.queryOrderBySchedule("" + Constants.ONLINE_ORDER_STATUS_ORDER, "", updatedate);
			if(list != null && list.size() > 0) {
				log.info("deliveryOrder list.size()=" + list.size());
				for(OrderDto order : list) {
					//关闭订单
					order.setStatus(Constants.ONLINE_ORDER_STATUS_CLOSE);
					order.setNote("付款日已过。");
					order.setUpdateuid("system");
					orderService.cancelOrder("", order);
				}
			}
		} catch(Exception e) {
			log.error("==============noPayOrder error================" + e);
		}
	}
	
	/**
	 * 邮件确认数据处理
	 */
	private void mailAuth() {
		try {
			//3天未处理数据
			Date date = new Date();
			String createdate = DateUtil.dateToLongStr(DateUtil.addDays(date, -3));
			List<MailAuthDto> list = mailAuthService.queryMailAuthBySchedule("" + Constants.STATUS_NORMAL, createdate);
			if(list != null && list.size() > 0) {
				log.info("mailAuth list.size()=" + list.size());
				for(MailAuthDto mailAuth : list) {
					//关闭订单
					mailAuth.setStatus(Constants.STATUS_DEL);
					mailAuth.setNote("过期未确认。");
					mailAuth.setUpdateuid("system");
					mailAuthService.updateMailAuth(mailAuth);
				}
			}
		} catch(Exception e) {
			log.error("==============mailAuth error================" + e);
		}
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public MailAuthService getMailAuthService() {
		return mailAuthService;
	}

	public void setMailAuthService(MailAuthService mailAuthService) {
		this.mailAuthService = mailAuthService;
	}

	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}
}
