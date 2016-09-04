package com.cn.dsyg.service;

import java.util.List;

import com.cn.common.util.Page;
import com.cn.dsyg.dto.CustomerDto;

public interface CustomerService {
	
	/**
	 * 修改密码
	 * @param customer
	 */
	public void updPassword(CustomerDto customer);

	/**
	 * 翻页查询用户
	 * @param customeremail
	 * @param page
	 * @return
	 */
	public Page queryCustomerByPage(String customeremail, Page page);
	
	/**
	 * 根据ID查询用户
	 * @param customerid
	 * @return
	 */
	public CustomerDto queryCustomerByID(int customerid);
	
	/**
	 * 根据mail查询用户
	 * @param customeremail
	 * @return
	 */
	public List<CustomerDto> queryCustomerByMail(String customeremail);
	
	/**
	 * 根据mail和status查询用户
	 * @param customeremail
	 * @param status
	 * @return
	 */
	public CustomerDto queryCustomerByMailStatus(String customeremail, int status);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<CustomerDto> queryAllCustomer();
	
	/**
	 * 删除用户
	 * @param customerid
	 */
	public void deleteCustomer(int customerid);
	
	/**
	 * 新增用户
	 * @param customer
	 */
	public void insertCustomer(CustomerDto customer);
	
	/**
	 * 修改用户
	 * @param customer
	 */
	public void updateCustomer(CustomerDto customer);
}
