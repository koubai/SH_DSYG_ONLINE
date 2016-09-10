package com.cn.dsyg.action;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.Page;
import com.cn.common.util.PropertiesConfig;
import com.cn.common.util.StringUtil;
import com.cn.dsyg.dto.Dict01Dto;
import com.cn.dsyg.dto.FeatureDto;
import com.cn.dsyg.dto.ProductDto;
import com.cn.dsyg.service.Dict01Service;
import com.cn.dsyg.service.ProductService;
import com.opensymphony.xwork2.ActionContext;

/**
 * ProductAction
 * @author Frank
 * @version 1.0
 * @create 2016-8-30上午10:33:24
 */
public class ProductAction extends BaseAction {

	private static final long serialVersionUID = 8390698593615629697L;

	private static final Logger log = LogManager.getLogger(ProductAction.class);
	
	private Dict01Service dict01Service;
	private ProductService productService;
	
	/**
	 * 页码
	 */
	private int startIndex;
	
	/**
	 * 翻页
	 */
	private Page page;
	
	private List<ProductDto> productList;
	//大分类ID
	private String fieldno;
	//现货查询stockfalg=1表示是现货
	private String stockfalg;
	
	//firstfalg=1为第一次进入产品查询页面
	private String firstfalg;
	
	/**
	 * 大产品分类
	 */
	//大分类（非多语言）
	private List<Dict01Dto> goodsBaseList;
	private List<Dict01Dto> goodsList;
	//小分类列表
	private List<FeatureDto> featureList;

	//单位
	private List<Dict01Dto> unitList;
	//产地
	private List<Dict01Dto> makeareaList;
	//颜色
	private List<Dict01Dto> colorList;
	
	/**
	 * 显示库存检索页面
	 * @return
	 */
	public String showSearchProductAction() {
		try {
			this.clearMessages();
			//默认第一页
			startIndex = 0;
			fieldno = "";
			//默认查询所有产品
			stockfalg = "";
			firstfalg = "1";
			initData();
			//queryData();
		} catch(Exception e) {
			log.error(e);
		}
		return SUCCESS;
	}

	/**
	 * 查询数据
	 * @return
	 */
	public String searchProductAction() {
		try {
			this.clearMessages();
			startIndex = 0;
			queryData();
		} catch(Exception e) {
			log.error("searchProductAction error:" + e);
		}
		return SUCCESS;
	}
	
	/**
	 * 翻页查询数据
	 * @return
	 */
	public String turnSearchProductAction() {
		try {
			this.clearMessages();
			queryData();
		} catch(Exception e) {
			log.error("turnSearchProductAction error:" + e);
		}
		return SUCCESS;
	}
	
	/**
	 * 产品查询
	 */
	@SuppressWarnings("unchecked")
	private void queryData() {
		initData();
		firstfalg = "2";
		if(page == null) {
			page = new Page();
		}
		
		//翻页查询所有委托公司
		this.page.setStartIndex(startIndex);
		page = productService.queryOnlineProductByPage(fieldno, stockfalg, page);
		productList = (List<ProductDto>) page.getItems();
		this.setStartIndex(page.getStartIndex());
				
		//查询数据
		String language = (String) ActionContext.getContext().getSession().get(Constants.SYSTEM_LANGUAGE);
		//替换住友电工
		if("en".equals(language)) {
			if(productList != null && productList.size() > 0) {
				for(ProductDto product : productList) {
					if(StringUtil.isNotBlank(product.getBrand())) {
						product.setBrand(product.getBrand().replace("住友电工", "SUMITUBE"));
					}
				}
			}
		}
	}
	
	private void initData() {
		String language = (String) ActionContext.getContext().getSession().get(Constants.SYSTEM_LANGUAGE);
		goodsBaseList = dict01Service.queryGoodsNoOther(PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		//大分类列表
		if("en".equals(language)) {
			//英文系统
			//产品类型
			goodsList = dict01Service.queryGoodsNoOther(Constants.SYSTEM_LANGUAGE_ENGLISH);
			//单位
			unitList = dict01Service.queryDict01ByFieldcode(Constants.DICT_UNIT_TYPE, Constants.SYSTEM_LANGUAGE_ENGLISH);
			//产地
			makeareaList = dict01Service.queryDict01ByFieldcode(Constants.DICT_MAKEAREA, Constants.SYSTEM_LANGUAGE_ENGLISH);
			//颜色
			colorList = dict01Service.queryDict01ByFieldcode(Constants.DICT_COLOR_TYPE, Constants.SYSTEM_LANGUAGE_ENGLISH);
		} else {
			//默认读取配置文件
			//产品类型
			goodsList = dict01Service.queryGoodsNoOther(PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
			//单位
			unitList = dict01Service.queryDict01ByFieldcode(Constants.DICT_UNIT_TYPE, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
			//产地
			makeareaList = dict01Service.queryDict01ByFieldcode(Constants.DICT_MAKEAREA, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
			//颜色
			colorList = dict01Service.queryDict01ByFieldcode(Constants.DICT_COLOR_TYPE, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		}
	}

	public Dict01Service getDict01Service() {
		return dict01Service;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public Page getPage() {
		return page;
	}

	public List<Dict01Dto> getGoodsBaseList() {
		return goodsBaseList;
	}

	public List<Dict01Dto> getGoodsList() {
		return goodsList;
	}

	public List<Dict01Dto> getUnitList() {
		return unitList;
	}

	public List<Dict01Dto> getMakeareaList() {
		return makeareaList;
	}

	public List<Dict01Dto> getColorList() {
		return colorList;
	}

	public void setDict01Service(Dict01Service dict01Service) {
		this.dict01Service = dict01Service;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public void setGoodsBaseList(List<Dict01Dto> goodsBaseList) {
		this.goodsBaseList = goodsBaseList;
	}

	public void setGoodsList(List<Dict01Dto> goodsList) {
		this.goodsList = goodsList;
	}

	public void setUnitList(List<Dict01Dto> unitList) {
		this.unitList = unitList;
	}

	public void setMakeareaList(List<Dict01Dto> makeareaList) {
		this.makeareaList = makeareaList;
	}

	public void setColorList(List<Dict01Dto> colorList) {
		this.colorList = colorList;
	}

	public List<FeatureDto> getFeatureList() {
		return featureList;
	}

	public void setFeatureList(List<FeatureDto> featureList) {
		this.featureList = featureList;
	}

	public String getStockfalg() {
		return stockfalg;
	}

	public void setStockfalg(String stockfalg) {
		this.stockfalg = stockfalg;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<ProductDto> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductDto> productList) {
		this.productList = productList;
	}

	public String getFieldno() {
		return fieldno;
	}

	public void setFieldno(String fieldno) {
		this.fieldno = fieldno;
	}

	public String getFirstfalg() {
		return firstfalg;
	}

	public void setFirstfalg(String firstfalg) {
		this.firstfalg = firstfalg;
	}
}
