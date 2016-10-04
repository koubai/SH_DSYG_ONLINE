package com.cn.dsyg.service;

/**
 * @name SalesItemDao.java
 * @author Frank
 * @time 2015-5-17下午10:34:54
 * @version 1.0
 */
public interface SalesItemService {
	
	/**
	 * 根据销售单编号，物理删除item数据
	 * @param salesno
	 */
	public void deleteAllSalesItemBySalesno(String salesno);
}
