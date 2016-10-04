package com.cn.dsyg.dao;

import com.cn.dsyg.dto.SalesDto;

/**
 * @name SalesDao.java
 * @author Frank
 * @time 2015-6-28下午9:29:38
 * @version 1.0
 */
public interface SalesDao {

	/**
	 * 根据THEME2编号查询销售单数据
	 * @param customerid
	 * @param theme2
	 * @param res05
	 * @return
	 */
	public SalesDto querySalesByTheme2(String customerid, String theme2, String res05);

	/**
	 * 物理删除销售单
	 * @param id
	 */
	public void deleteSales(String id);
}
