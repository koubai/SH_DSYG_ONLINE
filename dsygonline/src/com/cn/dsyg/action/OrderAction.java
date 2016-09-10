package com.cn.dsyg.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.dsyg.dto.OrderDto;
import com.cn.dsyg.service.Dict01Service;
import com.cn.dsyg.service.OrderService;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name OrderAction.java
 * @author Frank
 * @time 2016-9-4下午3:06:08
 * @version 1.0
 */
public class OrderAction extends BaseAction {

	private static final long serialVersionUID = -2987610703607959959L;

	private static final Logger log = LogManager.getLogger(OrderAction.class);
	
	private Dict01Service dict01Service;
	private OrderService orderService;
	
	//页码
	private int startIndex;
	//翻页page
	private Page page;
	
	private List<OrderDto> orderList;
	//订单号
	private String strOrdercode;
	//订单状态
	private String strStatus;
	
	//订单明细
	private OrderDto showOrderDto;
	private String strOrderDetailId;

	/**
	 * 订单列表页面
	 * @return
	 */
	public String showOrderListAction() {
		try {
			this.clearMessages();
			strOrdercode = "";
			//查询所有订单
			strStatus = "";
			startIndex = 0;
			//查询订单
			queryData();
		} catch(Exception e) {
			log.error("showOrderListAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 查询订单列表
	 * @return
	 */
	public String queryOrderListAction() {
		try {
			this.clearMessages();
			startIndex = 0;
			//查询订单
			queryData();
		} catch(Exception e) {
			log.error("queryOrderListAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页订单列表
	 * @return
	 */
	public String turnOrderListAction() {
		try {
			this.clearMessages();
			//查询订单
			queryData();
		} catch(Exception e) {
			log.error("turnOrderListAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 订单详情页面
	 * @return
	 */
	public String showOrderDetailAction() {
		try {
			this.clearMessages();
			//查询订单明细
			showOrderDto = orderService.queryOrderByID(strOrderDetailId);
		} catch(Exception e) {
			log.error("showOrderDetailAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private void queryData() {
		orderList = new ArrayList<OrderDto>();
		if(page == null) {
			page = new Page();
		}
		//翻页查询所有用户
		this.page.setStartIndex(startIndex);
		//客户ID
		String customerid = (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
		page = orderService.queryOrderByPage(strOrdercode, customerid, strStatus, page);
		orderList = (List<OrderDto>) page.getItems();
		
		this.setStartIndex(page.getStartIndex());
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getStrOrdercode() {
		return strOrdercode;
	}

	public void setStrOrdercode(String strOrdercode) {
		this.strOrdercode = strOrdercode;
	}

	public List<OrderDto> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<OrderDto> orderList) {
		this.orderList = orderList;
	}

	public String getStrStatus() {
		return strStatus;
	}

	public void setStrStatus(String strStatus) {
		this.strStatus = strStatus;
	}

	public String getStrOrderDetailId() {
		return strOrderDetailId;
	}

	public void setStrOrderDetailId(String strOrderDetailId) {
		this.strOrderDetailId = strOrderDetailId;
	}

	public OrderDto getShowOrderDto() {
		return showOrderDto;
	}

	public void setShowOrderDto(OrderDto showOrderDto) {
		this.showOrderDto = showOrderDto;
	}

	public Dict01Service getDict01Service() {
		return dict01Service;
	}

	public void setDict01Service(Dict01Service dict01Service) {
		this.dict01Service = dict01Service;
	}
}
