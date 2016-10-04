package com.cn.dsyg.service.impl;

import com.cn.dsyg.dao.SalesDao;
import com.cn.dsyg.dto.SalesDto;
import com.cn.dsyg.service.SalesService;

/**
 * @name SalesServiceImpl.java
 * @author Frank
 * @time 2016-10-4下午10:53:01
 * @version 1.0
 */
public class SalesServiceImpl implements SalesService {
	
	private SalesDao salesDao;

	@Override
	public SalesDto querySalesByTheme2(String customerid, String theme2, String res05) {
		return salesDao.querySalesByTheme2(customerid, theme2, res05);
	}

	@Override
	public void deleteSales(String id) {
		salesDao.deleteSales(id);
	}

	public SalesDao getSalesDao() {
		return salesDao;
	}

	public void setSalesDao(SalesDao salesDao) {
		this.salesDao = salesDao;
	}
}
