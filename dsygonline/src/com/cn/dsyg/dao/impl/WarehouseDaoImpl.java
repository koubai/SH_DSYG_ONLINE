package com.cn.dsyg.dao.impl;

import java.util.HashMap;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.dsyg.dao.WarehouseDao;

/**
 * @name WarehouseDaoImpl.java
 * @author Frank
 * @time 2015-6-7下午8:42:12
 * @version 1.0
 */
public class WarehouseDaoImpl extends BaseDao implements WarehouseDao {

	@Override
	public void deleteWarehouseByParentid(String parentid, String productid, String status) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("parentid", parentid);
		paramMap.put("productid", productid);
		paramMap.put("status", status);
		getSqlMapClientTemplate().update("deleteWarehouseByParentid", paramMap);
	}
}
