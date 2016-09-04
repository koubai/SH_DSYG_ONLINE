package com.cn.dsyg.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.dsyg.dao.ProductDao;
import com.cn.dsyg.dto.ProductDto;

/**
 * ProductDaoImpl
 * @Company 
 * @author chenguangquan.frank
 * @version 1.0
 * @create 2015-5-19下午1:47:37
 */
public class ProductDaoImpl extends BaseDao implements ProductDao {
	
	@Override
	public List<ProductDto> queryOnlineProductByPage(String fieldno, String stockfalg, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fieldno", fieldno);
		paramMap.put("stockfalg", stockfalg);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<ProductDto> list = getSqlMapClientTemplate().queryForList("queryOnlineProductByPage", paramMap);
		return list;
	}

	@Override
	public int queryOnlineProductCountByPage(String fieldno, String stockfalg) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fieldno", fieldno);
		paramMap.put("stockfalg", stockfalg);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryOnlineProductCountByPage", paramMap);
	}

	@Override
	public ProductDto queryProductByID(String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		@SuppressWarnings("unchecked")
		List<ProductDto> list = getSqlMapClientTemplate().queryForList("queryProductByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
