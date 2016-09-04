package com.cn.dsyg.service.impl;

import java.util.List;

import com.cn.common.util.Constants;
import com.cn.common.util.MD5Util;
import com.cn.common.util.Page;
import com.cn.common.util.StringUtil;
import com.cn.dsyg.dao.CustomerDao;
import com.cn.dsyg.dto.CustomerDto;
import com.cn.dsyg.service.CustomerService;

/**
 * @name CustomerServiceImpl.java
 * @author lql
 * @time 
 * @version 1.0
 */
public class CustomerServiceImpl implements CustomerService {
	
	private CustomerDao customerDao;

	@Override
	public void updPassword(CustomerDto customer) {
		CustomerDto u = customerDao.queryCustomerByID(customer.getCustomerid());
		if(u != null) {
			u.setPassword(MD5Util.md5(customer.getPassword()));
			u.setUpdateuid(String.valueOf(customer.getCustomerid()));
			customerDao.updateCustomer(u);
		}
	}
	
	@Override
	public Page queryCustomerByPage(String customeremail, Page page) {
		customeremail = StringUtil.replaceDatabaseKeyword_mysql(customeremail);
		//查询总记录数
		int totalCount = customerDao.queryCustomerCountByPage(customeremail);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<CustomerDto> list = customerDao.queryCustomerByPage(customeremail,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		page.setItems(list);
		return page;
	}

	@Override
	public CustomerDto queryCustomerByID(int customerid) {
		return customerDao.queryCustomerByID(customerid);
	}

	@Override
	public List<CustomerDto> queryCustomerByMail(String customeremail) {
		return customerDao.queryCustomerByMail(customeremail);
	}

	@Override
	public CustomerDto queryCustomerByMailStatus(String customeremail,
			int status) {
		return customerDao.queryCustomerByMailStatus(customeremail, status);
	}

	@Override
	public List<CustomerDto> queryAllCustomer() {
		return customerDao.queryAllCustomer();
	}

	@Override
	public void deleteCustomer(int customerid) {
		//customerDao.deleteCustomer(customerid);
		CustomerDto customer = customerDao.queryCustomerByID(customerid);
		if(customer != null) {
			//状态=已删除
			customer.setStatus(Constants.STATUS_DEL);
			customerDao.updateCustomer(customer);
		}
	}

	@Override
	public void insertCustomer(CustomerDto customer) {
		//MD5加密密码
		customer.setPassword(MD5Util.md5(customer.getPassword()));
		//MD5加密hash连接键
		/*Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String time = dateFormat.format(now); 
		customer.setHash(MD5Util.md5(customer.getCustomeremail()+time));*/
		customer.setPaytype("0");
		customer.setAccounttype("0");
		customer.setReceipttype("0");
		//操作用户
		customer.setCreateuid("web");
		customerDao.insertCustomer(customer);
	}

	@Override
	public void updateCustomer(CustomerDto customer) {
		customerDao.updateCustomer(customer);
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
}
