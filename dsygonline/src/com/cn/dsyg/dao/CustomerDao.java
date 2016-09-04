package com.cn.dsyg.dao;

import java.util.List;

import com.cn.dsyg.dto.CustomerDto;

/**
 * @name CustomerDao.java
 * @author lql
 * @time 
 * @version 1.0
 */
public interface CustomerDao {
	
	/**
	 * 翻页查询数据
	 * @param customeremail
	 * @param start
	 * @param end
	 * @return
	 */
	public List<CustomerDto> queryCustomerByPage(String customeremail, int start, int end);
	
	/**
	 * 查询总记录数
	 * @param customeremail
	 * @return
	 */
	public int queryCustomerCountByPage(String customeremail);

	/**
	 * 根据ID查询数据
	 * @param customerid
	 * @return
	 */
	public CustomerDto queryCustomerByID(int customerid);

	/**
	 * 根据mail查询数据
	 * @param customeremail
	 * @return
	 */
	public List<CustomerDto> queryCustomerByMail(String customeremail);

	/**
	 * 根据mail和status查询数据
	 * @param customeremail
	 * @param status
	 * @return
	 */
	public CustomerDto queryCustomerByMailStatus(String customeremail, int status);
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<CustomerDto> queryAllCustomer();
	
	/**
	 * 删除数据
	 * @param customerid
	 */
	public void deleteCustomer(int customerid);
	
	/**
	 * 新增数据
	 * @param customer
	 */
	public void insertCustomer(CustomerDto customer);
	
	/**
	 * 修改数据
	 * @param customer
	 */
	public void updateCustomer(CustomerDto customer);
}
