package com.cn.dsyg.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.PropertiesConfig;
import com.cn.dsyg.dto.Dict01Dto;
import com.cn.dsyg.dto.FeatureDto;
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
	
	//大分类（非多语言）
	private List<Dict01Dto> goodsBaseList;
	private List<Dict01Dto> goodsList;
	//小分类列表
	private List<FeatureDto> featureList;

	//单位
	private List<Dict01Dto> unitList;
	//产地
	private List<Dict01Dto> makeareaList;
	//颜色
	private List<Dict01Dto> colorList;

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
			initData();
			//查询订单明细
			showOrderDto = orderService.queryOrderByID(strOrderDetailId);
		} catch(Exception e) {
			log.error("showOrderDetailAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 交期回复
	 * @return
	 */
	public String refDeliveryAction() {
		try {
			this.clearMessages();
			initData();
			
			//验证数据状态
			OrderDto order = orderService.queryOrderByID(strOrderDetailId);
			if(order.getStatus() == Constants.ONLINE_ORDER_STATUS_DELIVERY) {
				//客户ID
				String customerid = (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
				showOrderDto.setUpdateip(getIP());
				showOrderDto.setUpdateuid(customerid);
				orderService.refOrderDelivery(showOrderDto);
				
				showOrderDto = orderService.queryOrderByID(strOrderDetailId);
			} else {
				showOrderDto = orderService.queryOrderByID(strOrderDetailId);
				return "checkerror";
			}
		} catch(Exception e) {
			log.error("refDeliveryAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 付款提交
	 * @return
	 */
	public String payMoneyAction() {
		try {
			this.clearMessages();
			initData();
			
			//验证数据状态
			OrderDto order = orderService.queryOrderByID(strOrderDetailId);
			if(order.getStatus() == Constants.ONLINE_ORDER_STATUS_ORDER) {
				//客户ID
				String customerid = (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
				order.setUpdateip(getIP());
				order.setUpdateuid(customerid);
				//状态=已付款
				order.setStatus(Constants.ONLINE_ORDER_STATUS_PAY);
				order.setCashdate(new Date());
				orderService.updateOrder(order);
				
				showOrderDto = orderService.queryOrderByID(strOrderDetailId);
			} else {
				showOrderDto = orderService.queryOrderByID(strOrderDetailId);
				return "checkerror";
			}
		} catch(Exception e) {
			log.error("payMoneyAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 已收货
	 * @return
	 */
	public String receiveProductAction() {
		try {
			this.clearMessages();
			initData();
			
			//验证数据状态
			OrderDto order = orderService.queryOrderByID(strOrderDetailId);
			if(order.getStatus() == Constants.ONLINE_ORDER_STATUS_SEND) {
				//客户ID
				String customerid = (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
				order.setUpdateip(getIP());
				order.setUpdateuid(customerid);
				//状态=已收货
				order.setStatus(Constants.ONLINE_ORDER_STATUS_RECEIVE);
				orderService.updateOrder(order);
				
				showOrderDto = orderService.queryOrderByID(strOrderDetailId);
			} else {
				showOrderDto = orderService.queryOrderByID(strOrderDetailId);
				return "checkerror";
			}
		} catch(Exception e) {
			log.error("receiveProductAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 订单取消
	 * @return
	 */
	public String cancelOrderAction() {
		try {
			this.clearMessages();
			initData();
			
			//客户ID
			String customerid = (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
			//查询订单明细
			OrderDto order = orderService.queryOrderByID(strOrderDetailId);
			//状态=取消
			order.setStatus(Constants.ONLINE_ORDER_STATUS_CLOSE);
			order.setUpdateip(this.getIP());
			order.setUpdateuid(customerid);
			orderService.updateOrder(order);
			
			//刷新页面数据
			showOrderDto = orderService.queryOrderByID(strOrderDetailId);
		} catch(Exception e) {
			log.error("cancelOrderAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	private void initData() {
		String language = (String) ActionContext.getContext().getSession().get(Constants.SYSTEM_LANGUAGE);
		goodsBaseList = dict01Service.queryGoodsNoOther(PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		
		//税率
		List<Dict01Dto> listRate = dict01Service.queryDict01ByFieldcode(Constants.DICT_RATE, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		if(listRate != null && listRate.size() > 0) {
			common_rate = listRate.get(0).getCode();
		}
		//大分类列表
		if("en".equals(language)) {
			//英文系统
			//产品类型
			goodsList = dict01Service.queryGoodsNoOther(Constants.SYSTEM_LANGUAGE_ENGLISH);
			//单位
			unitList = dict01Service.queryDict01ByFieldcode(Constants.DICT_UNIT_TYPE, Constants.SYSTEM_LANGUAGE_ENGLISH);
			//产地
			makeareaList = dict01Service.queryDict01ByFieldcode(Constants.DICT_MAKEAREA, Constants.SYSTEM_LANGUAGE_ENGLISH);
			//颜色
			colorList = dict01Service.queryDict01ByFieldcode(Constants.DICT_COLOR_TYPE, Constants.SYSTEM_LANGUAGE_ENGLISH);
		} else {
			//默认读取配置文件
			//产品类型
			goodsList = dict01Service.queryGoodsNoOther(PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
			//单位
			unitList = dict01Service.queryDict01ByFieldcode(Constants.DICT_UNIT_TYPE, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
			//产地
			makeareaList = dict01Service.queryDict01ByFieldcode(Constants.DICT_MAKEAREA, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
			//颜色
			colorList = dict01Service.queryDict01ByFieldcode(Constants.DICT_COLOR_TYPE, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		}
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

	public List<Dict01Dto> getGoodsBaseList() {
		return goodsBaseList;
	}

	public void setGoodsBaseList(List<Dict01Dto> goodsBaseList) {
		this.goodsBaseList = goodsBaseList;
	}

	public List<Dict01Dto> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Dict01Dto> goodsList) {
		this.goodsList = goodsList;
	}

	public List<FeatureDto> getFeatureList() {
		return featureList;
	}

	public void setFeatureList(List<FeatureDto> featureList) {
		this.featureList = featureList;
	}

	public List<Dict01Dto> getUnitList() {
		return unitList;
	}

	public void setUnitList(List<Dict01Dto> unitList) {
		this.unitList = unitList;
	}

	public List<Dict01Dto> getMakeareaList() {
		return makeareaList;
	}

	public void setMakeareaList(List<Dict01Dto> makeareaList) {
		this.makeareaList = makeareaList;
	}

	public List<Dict01Dto> getColorList() {
		return colorList;
	}

	public void setColorList(List<Dict01Dto> colorList) {
		this.colorList = colorList;
	}
}
