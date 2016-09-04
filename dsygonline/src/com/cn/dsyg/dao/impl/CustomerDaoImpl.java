package com.cn.dsyg.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cn.common.dao.BaseDao;
import com.cn.dsyg.dao.CustomerDao;
import com.cn.dsyg.dto.CustomerDto;

/**
 * @name CustomerDaoImpl.java
 * @author lql
 * @time 
 * @version 1.0
 */
public class CustomerDaoImpl extends BaseDao implements CustomerDao {

	@Override
	public List<CustomerDto> queryCustomerByPage(String customeremail, int start, int end) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customeremail", customeremail);
		paramMap.put("start", start);
		paramMap.put("end", end);
		@SuppressWarnings("unchecked")
		List<CustomerDto> list = getSqlMapClientTemplate().queryForList("queryCustomerByPage", paramMap);
		return list;
	}

	@Override
	public int queryCustomerCountByPage(String customeremail) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customeremail", customeremail);
		return (Integer) getSqlMapClientTemplate().queryForObject("queryCustomerCountByPage", paramMap);
	}

	@Override
	public CustomerDto queryCustomerByID(int customerid) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerid", customerid);
		@SuppressWarnings("unchecked")
		List<CustomerDto> list = getSqlMapClientTemplate().queryForList("queryCustomerByID", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<CustomerDto> queryCustomerByMail(String customeremail) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customeremail", customeremail);
		@SuppressWarnings("unchecked")
		List<CustomerDto> list = getSqlMapClientTemplate().queryForList("queryCustomerByMail", paramMap);
		return list;
	}

	@Override
	public CustomerDto queryCustomerByMailStatus(String customeremail,
			int status) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customeremail", customeremail);
		paramMap.put("status", status);
		@SuppressWarnings("unchecked")
		List<CustomerDto> list = getSqlMapClientTemplate().queryForList("queryCustomerByMailStatus", paramMap);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<CustomerDto> queryAllCustomer() {
		@SuppressWarnings("unchecked")
		List<CustomerDto> list = getSqlMapClientTemplate().queryForList("queryAllCustomer");
		return list;
	}

	@Override
	public void deleteCustomer(int customerid) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerid", customerid);
		getSqlMapClientTemplate().delete("deleteCustomer", paramMap);
	}

	@Override
	public void insertCustomer(CustomerDto Customer) {
		getSqlMapClientTemplate().insert("insertCustomer", Customer);
	}

	@Override
	public void updateCustomer(CustomerDto Customer) {
		getSqlMapClientTemplate().update("updateCustomer", Customer);
	}
}
