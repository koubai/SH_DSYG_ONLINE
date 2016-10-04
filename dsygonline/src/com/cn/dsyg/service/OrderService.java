package com.cn.dsyg.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.dsyg.dto.CustomerDto;
import com.cn.dsyg.dto.OrderDto;
import com.cn.dsyg.dto.ShoppingCartDto;

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
	 * 定时任务查询
	 * @param status
	 * @param deliverydate
	 * @param updatedate
	 * @return
	 */
	public List<OrderDto> queryOrderBySchedule(String status, String deliverydate, String updatedate);
	
	/**
	 * 根据ID查询数据
	 * @param id
	 * @return
	 */
	public OrderDto queryOrderByID(String id);
	
	/**
	 * 交期回复
	 * @param order
	 * @return
	 */
	public void refOrderDelivery(OrderDto order);
	
	/**
	 * 订单取消
	 * @param customerid
	 * @param order
	 */
	public void cancelOrder(String customerid, OrderDto order);
	
	/**
	 * 根据逻辑主键查询数据
	 * @param ordercode
	 * @return
	 */
	public OrderDto queryOrderByOrdercode(String ordercode);
	
	/**
	 * 生成订单数据
	 * @param customer
	 * @param shoppingcartlist
	 * @param ip
	 * @return
	 * @throws Exception
	 */
	public OrderDto createOrder(CustomerDto customer, List<ShoppingCartDto> shoppingcartlist, String ip) throws Exception;
	
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
