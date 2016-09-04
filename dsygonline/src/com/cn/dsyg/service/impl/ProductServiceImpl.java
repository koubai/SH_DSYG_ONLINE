package com.cn.dsyg.service.impl;

import java.util.List;

import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.PropertiesConfig;
import com.cn.dsyg.dao.Dict01Dao;
import com.cn.dsyg.dao.ProductDao;
import com.cn.dsyg.dto.ProductDto;
import com.cn.dsyg.service.ProductService;

/**
 * @name ProductServiceImpl.java
 * @author Frank
 * @time 2015-5-21下午10:58:31
 * @version 1.0
 */
public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;
	private Dict01Dao dict01Dao;

	@Override
	public Page queryOnlineProductByPage(String fieldno, String stockfalg, Page page) {
		//查询总记录数
		int totalCount = productDao.queryOnlineProductCountByPage(fieldno, stockfalg);
		page.setTotalCount(totalCount);
		if(totalCount % page.getPageSize() > 0) {
			page.setTotalPage(totalCount / page.getPageSize() + 1);
		} else {
			page.setTotalPage(totalCount / page.getPageSize());
		}
		//翻页查询记录
		List<ProductDto> list = productDao.queryOnlineProductByPage(fieldno, stockfalg,
				page.getStartIndex() * page.getPageSize(), page.getPageSize());
		
		if(list != null && list.size() > 0) {
			//PDF文件URL
			String pdfurl = PropertiesConfig.getPropertiesValueByKey(Constants.PROPERTIES_PDF_URL);
			for(ProductDto tmp : list) {
				//添加PDF文件URL
				tmp.setPdfurl(pdfurl);
			}
		}	
		
		page.setItems(list);
		return page;
	}

	@Override
	public ProductDto queryProductByID(String id) {
		ProductDto product = productDao.queryProductByID(id);
		if(product != null) {
			//图片和PDF文件显示地址
			String imageurl = PropertiesConfig.getPropertiesValueByKey(Constants.PROPERTIES_IMAGES_URL);
			String pdfurl = PropertiesConfig.getPropertiesValueByKey(Constants.PROPERTIES_PDF_URL);
			product.setImageurl(imageurl);
			product.setPdfurl(pdfurl);
			return product;
		}
		return null;
	}

	public Dict01Dao getDict01Dao() {
		return dict01Dao;
	}

	public void setDict01Dao(Dict01Dao dict01Dao) {
		this.dict01Dao = dict01Dao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
}
