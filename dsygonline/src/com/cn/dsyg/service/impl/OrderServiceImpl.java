package com.cn.dsyg.service.impl;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.dsyg.dao.OrderDao;
import com.cn.dsyg.dao.OrderDetailDao;
import com.cn.dsyg.dto.OrderDetailDto;
import com.cn.dsyg.dto.OrderDto;
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
				order.setOrderDetailList(orderDetailList);
			}
		}
		page.setItems(list);
		return page;
	}

	@Override
	public OrderDto queryOrderByID(String id) {
		OrderDto order = orderDao.queryOrderByID(id);
		//查询明细数据
		if(order != null) {
			List<OrderDetailDto> orderDetailList = orderDetailDao.queryOrderDetailByOrderid("" + order.getId());
			order.setOrderDetailList(orderDetailList);
		}
		return order;
	}

	@Override
	public OrderDto queryOrderByOrdercode(String ordercode) {
		return orderDao.queryOrderByOrdercode(ordercode);
	}

	@Override
	public void insertOrder(OrderDto order) {
		orderDao.insertOrder(order);
	}

	@Override
	public void updateOrder(OrderDto order) {
		orderDao.updateOrder(order);
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
}
