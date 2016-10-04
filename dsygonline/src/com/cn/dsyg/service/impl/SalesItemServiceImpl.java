package com.cn.dsyg.service.impl;

import com.cn.dsyg.dao.SalesItemDao;
import com.cn.dsyg.service.SalesItemService;

/**
 * @name SalesItemServiceImpl.java
 * @author Frank
 * @time 2016-10-4下午10:54:04
 * @version 1.0
 */
public class SalesItemServiceImpl implements SalesItemService {
	
	private SalesItemDao salesItemDao;

	@Override
	public void deleteAllSalesItemBySalesno(String salesno) {
		salesItemDao.deleteAllSalesItemBySalesno(salesno);
	}

	public SalesItemDao getSalesItemDao() {
		return salesItemDao;
	}

	public void setSalesItemDao(SalesItemDao salesItemDao) {
		this.salesItemDao = salesItemDao;
	}
}
