package com.cn.dsyg.dao.impl;

import java.util.HashMap;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.dsyg.dao.SalesItemDao;

/**
 * @name SalesItemDaoImpl.java
 * @author Frank
 * @time 2015-6-17下午9:42:32
 * @version 1.0
 */
public class SalesItemDaoImpl extends BaseDao implements SalesItemDao {
	
	@Override
	public void deleteAllSalesItemBySalesno(String salesno) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("salesno", salesno);
		getSqlMapClientTemplate().update("deleteAllSalesItemBySalesno", paramMap);
	}
}
