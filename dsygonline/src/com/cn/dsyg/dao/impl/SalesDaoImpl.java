package com.cn.dsyg.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.dsyg.dao.SalesDao;
import com.cn.dsyg.dto.SalesDto;

/**
 * @name SalesDaoImpl.java
 * @author Frank
 * @time 2015-6-16下午9:53:31
 * @version 1.0
 */
public class SalesDaoImpl extends BaseDao implements SalesDao {

	@Override
	public SalesDto querySalesByTheme2(String customerid, String theme2, String res05) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerid", customerid);
		paramMap.put("theme2", theme2);
		paramMap.put("res05", res05);
		@SuppressWarnings("unchecked")
		List<SalesDto> list = getSqlMapClientTemplate().queryForList("querySalesByTheme2", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void deleteSales(String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		getSqlMapClientTemplate().delete("deleteSales", paramMap);
	}
}
