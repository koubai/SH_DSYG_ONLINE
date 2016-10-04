package com.cn.dsyg.service.impl;

import com.cn.dsyg.dao.WarehouseDao;
import com.cn.dsyg.service.WarehouseService;

/**
 * @name WarehouseServiceImpl.java
 * @author Frank
 * @time 2016-10-4下午10:54:50
 * @version 1.0
 */
public class WarehouseServiceImpl implements WarehouseService {
	
	private WarehouseDao warehouseDao;

	@Override
	public void deleteWarehouseByParentid(String parentid, String productid,
			String status) {
		warehouseDao.deleteWarehouseByParentid(parentid, productid, status);
	}

	public WarehouseDao getWarehouseDao() {
		return warehouseDao;
	}

	public void setWarehouseDao(WarehouseDao warehouseDao) {
		this.warehouseDao = warehouseDao;
	}
}
