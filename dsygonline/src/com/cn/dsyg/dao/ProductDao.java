package com.cn.dsyg.dao;

import java.util.List;

import com.cn.dsyg.dto.ProductDto;

/**
 * @name ProductDao.java
 * @author Frank
 * @time 2016-9-2上午7:47:43
 * @version 1.0
 */
public interface ProductDao {

	/**
	 * 翻页查询信息
	 * @param keyword
	 * @param fieldno
	 * @param stockfalg
	 * @param start
	 * @param end
	 * @return
	 */
	public List<ProductDto> queryOnlineProductByPage(String keyword, String fieldno, String stockfalg, int start, int end);
	
	/**
	 * 查询翻页数据数量
	 * @param keyword
	 * @param fieldno
	 * @param stockfalg
	 * @return
	 */
	public int queryOnlineProductCountByPage(String keyword, String fieldno, String stockfalg);
	
	/**
	 * 根据ID查询数据
	 * @param id
	 * @return
	 */
	public ProductDto queryProductByID(String id);
}
