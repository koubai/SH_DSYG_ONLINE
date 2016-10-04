package com.cn.dsyg.service;


/**
 * @name WarehouseDao.java
 * @author Frank
 * @time 2015-6-3下午9:44:07
 * @version 1.0
 */
public interface WarehouseService {
	
	/**
	 * 根据采购单OR订单号删除库存记录
	 * @param parentid
	 * @param productid
	 * @param status
	 */
	public void deleteWarehouseByParentid(String parentid, String productid, String status);
}
