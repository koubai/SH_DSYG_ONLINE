package com.cn.dsyg.service;

import com.cn.common.util.Page;
import com.cn.dsyg.dto.ProductDto;

/**
 * @name ProductService.java
 * @author Frank
 * @time 2015-5-23下午10:39:06
 * @version 1.0
 */
public interface ProductService {

	/**
	 * 翻页查询信息
	 * @param fieldno
	 * @param stockfalg
	 * @param page
	 * @return
	 */
	public Page queryOnlineProductByPage(String fieldno, String stockfalg, Page page);
	
	/**
	 * 根据ID查询数据
	 * @param id
	 * @return
	 */
	public ProductDto queryProductByID(String id);
}
