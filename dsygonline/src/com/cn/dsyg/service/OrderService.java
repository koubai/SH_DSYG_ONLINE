package com.cn.dsyg.service;

import com.cn.common.util.Page;
import com.cn.dsyg.dto.OrderDto;

/**
 * OrderService
 * @author Frank
 * @version 1.0
 * @create 2016-8-5下午4:05:17
 */
public interface OrderService {
	
	/**
	 * 翻页查询数据
	 * @param ordercode
	 * @param customerid
	 * @param status
	 * @param page
	 * @return
	 */
	public Page queryOrderByPage(String ordercode, String customerid, String status, Page page);
	
	/**
	 * 根据ID查询数据
	 * @param id
	 * @return
	 */
	public OrderDto queryOrderByID(String id);
	
	/**
	 * 根据逻辑主键查询数据
	 * @param ordercode
	 * @return
	 */
	public OrderDto queryOrderByOrdercode(String ordercode);
	
	/**
	 * 新增数据
	 * @param order
	 */
	public void insertOrder(OrderDto order);
	
	/**
	 * 修改数据
	 * @param order
	 */
	public void updateOrder(OrderDto order);
}
