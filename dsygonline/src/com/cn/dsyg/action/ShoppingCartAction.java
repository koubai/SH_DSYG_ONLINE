package com.cn.dsyg.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.PropertiesConfig;
import com.cn.common.util.StringUtil;
import com.cn.dsyg.dto.Dict01Dto;
import com.cn.dsyg.dto.FeatureDto;
import com.cn.dsyg.dto.ProductDto;
import com.cn.dsyg.dto.ShoppingCartDto;
import com.cn.dsyg.service.Dict01Service;
import com.cn.dsyg.service.ProductService;
import com.opensymphony.xwork2.ActionContext;

/**
 * ShoppingCartAction
 * @author Frank
 * @version 1.0
 * @create 2016-8-30下午1:43:50
 */
public class ShoppingCartAction extends BaseAction {

	private static final long serialVersionUID = -7104477336164041584L;
	private static final Logger log = LogManager.getLogger(ShoppingCartAction.class);
	
	private ProductService productService;
	private Dict01Service dict01Service;
	
	private List<ShoppingCartDto> shoppingCartList;
	//格式：productid##amount##price
	private String productInfo;
	//删除
	private String delProductID;
	//合计
	private BigDecimal totalMoney;
	//合计含税
	private BigDecimal totalTaxMoney;
	
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
	 * 生成假订单
	 * @return
	 */
	public String submitShoppingCart() {
		try {
			this.clearMessages();
			//生成假订单
			//发送MAIL
		} catch(Exception e) {
			log.error("submitShoppingCart error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 获得购物车总额
	 * @return
	 * @throws IOException 
	 */
	public String getShoppingCartAmount() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		int count = 0;
		BigDecimal amount = new BigDecimal(0);
		try {
			this.clearMessages();
			@SuppressWarnings("unchecked")
			List<ShoppingCartDto> list = (List<ShoppingCartDto>) ActionContext.getContext().getSession().get(Constants.SESSION_SHOPPING_CART);
			if(list != null && list.size() > 0) {
				count = list.size();
				//计算总额
				for(ShoppingCartDto shoppingCart : list) {
					amount = amount.add(shoppingCart.getPrice().multiply(shoppingCart.getProductNum()));
				}
			}
		} catch(Exception e) {
			log.error("getShoppingCartAmount error:" + e);
		}
		String result = "{\"count\":" + count + ",\"amount\":" + amount + "}";
		out = response.getWriter();
		log.info(result);
		out.write(result);
		out.flush();
		return null;
	}
	
	/**
	 * 添加购物车
	 * @return
	 * @throws IOException 
	 */
	public String addShoppingCart() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		int count = 0;
		BigDecimal amount = new BigDecimal(0);
		try {
			this.clearMessages();
			@SuppressWarnings("unchecked")
			List<ShoppingCartDto> list = (List<ShoppingCartDto>) ActionContext.getContext().getSession().get(Constants.SESSION_SHOPPING_CART);
			//解析productInfo
			//格式：productid##amount##price
			String ll[] = productInfo.split("##");
			if(list != null && list.size() > 0) {
				boolean flag = false;
				//判断该产品ID是否存在
				for(ShoppingCartDto shoppingCart : list) {
					if(shoppingCart.getProductid().equals(ll[0])) {
						//存在该产品，则数量合并
						shoppingCart.setProductNum(shoppingCart.getProductNum().add(new BigDecimal(ll[1])));
						flag = true;
					}
				}
				if(!flag) {
					//不存在该产品，则新增记录
					ShoppingCartDto shoppingCart = new ShoppingCartDto();
					shoppingCart.setProductid(ll[0]);
					shoppingCart.setProductNum(new BigDecimal(ll[1]));
					shoppingCart.setPrice(new BigDecimal(ll[2]));
					
//					shoppingCart.setProductid(ll[0]);
//					shoppingCart.setProductNum(new BigDecimal(ll[1]));
//					shoppingCart.setPrice(new BigDecimal(ll[2]));
//					shoppingCart.setFieldno(ll[3]);
//					shoppingCart.setTypeno(ll[4]);
//					shoppingCart.setColor(ll[5]);
//					shoppingCart.setBrand(ll[6]);
//					shoppingCart.setMakearea(ll[7]);
//					shoppingCart.setPackaging(ll[8]);
//					shoppingCart.setUnit(ll[9]);
//					shoppingCart.setMinnum(ll[10]);
//					shoppingCart.setTradename(ll[11]);
					list.add(shoppingCart);
				}
			} else {
				list = new ArrayList<ShoppingCartDto>();
				ShoppingCartDto shoppingCart = new ShoppingCartDto();
				shoppingCart.setProductid(ll[0]);
				shoppingCart.setProductNum(new BigDecimal(ll[1]));
				shoppingCart.setPrice(new BigDecimal(ll[2]));
				
//				shoppingCart.setProductid(ll[0]);
//				shoppingCart.setProductNum(new BigDecimal(ll[1]));
//				shoppingCart.setPrice(new BigDecimal(ll[2]));
//				shoppingCart.setFieldno(ll[3]);
//				shoppingCart.setTypeno(ll[4]);
//				shoppingCart.setColor(ll[5]);
//				shoppingCart.setBrand(ll[6]);
//				shoppingCart.setMakearea(ll[7]);
//				shoppingCart.setPackaging(ll[8]);
//				shoppingCart.setUnit(ll[9]);
//				shoppingCart.setMinnum(ll[10]);
//				shoppingCart.setTradename(ll[11]);
				list.add(shoppingCart);
			}
			
			if(list != null && list.size() > 0) {
				count = list.size();
				//计算总额
				for(ShoppingCartDto shoppingCart : list) {
					amount = amount.add(shoppingCart.getPrice().multiply(shoppingCart.getProductNum()));
				}
			}
			ActionContext.getContext().getSession().put(Constants.SESSION_SHOPPING_CART, list);
		} catch(Exception e) {
			log.error("addShoppingCart error:" + e);
		}
		String result = "{\"count\":" + count + ",\"amount\":" + amount + "}";
		out = response.getWriter();
		log.info(result);
		out.write(result);
		out.flush();
		return null;
	}
	
	/**
	 * 删除购物车产品AJAX
	 * @return
	 * @throws IOException 
	 */
	public String delShoppingCartAjax() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		int count = 0;
		BigDecimal amount = new BigDecimal(0);
		try {
			this.clearMessages();
			@SuppressWarnings("unchecked")
			List<ShoppingCartDto> list = (List<ShoppingCartDto>) ActionContext.getContext().getSession().get(Constants.SESSION_SHOPPING_CART);
			if(StringUtil.isNotBlank(delProductID)) {
				if(list != null && list.size() > 0) {
					for(ShoppingCartDto shoppingCart : list) {
						if(shoppingCart.getProductid().equals(delProductID)) {
							list.remove(shoppingCart);
						}
					}
					ActionContext.getContext().getSession().put(Constants.SESSION_SHOPPING_CART, list);
				}
			}
			count = list.size();
			//计算总额
			amount = new BigDecimal(1);
		} catch(Exception e) {
			log.error("delShoppingCartAjax error:" + e);
		}
		String result = "{\"count\":" + count + ",\"amount\":" + amount + "}";
		out = response.getWriter();
		log.info(result);
		out.write(result);
		out.flush();
		return null;
	}
	
	/**
	 * 删除购物车产品
	 * @return
	 * @throws IOException 
	 */
	@SuppressWarnings("unchecked")
	public String delShoppingCart() throws IOException {
		try {
			this.clearMessages();
			List<ShoppingCartDto> list = (List<ShoppingCartDto>) ActionContext.getContext().getSession().get(Constants.SESSION_SHOPPING_CART);
			if(StringUtil.isNotBlank(delProductID)) {
				//从购物车中删除该产品
				if(list != null && list.size() > 0) {
					for(ShoppingCartDto shoppingCart : list) {
						if(shoppingCart.getProductid().equals(delProductID)) {
							list.remove(shoppingCart);
							break;
						}
					}
					ActionContext.getContext().getSession().put(Constants.SESSION_SHOPPING_CART, list);
				}
			}
			
			//初期化购物车列表页面
			initData();
			delProductID = "";
			totalMoney = new BigDecimal(0);
			totalTaxMoney = new BigDecimal(0);
			
			shoppingCartList = (List<ShoppingCartDto>) ActionContext.getContext().getSession().get(Constants.SESSION_SHOPPING_CART);
			if(shoppingCartList != null && shoppingCartList.size() > 0) {
				for(ShoppingCartDto shoppingCart : shoppingCartList) {
					//查询产品信息
					ProductDto product = productService.queryProductByID(shoppingCart.getProductid());
					shoppingCart.setFieldno(product.getFieldno());
					shoppingCart.setTypeno(product.getTypeno());
					shoppingCart.setColor(product.getColor());
					shoppingCart.setBrand(product.getBrand());
					shoppingCart.setMakearea(product.getMakearea());
					shoppingCart.setPackaging(product.getPackaging());
					shoppingCart.setUnit(product.getUnit());
					shoppingCart.setMinnum(product.getItem12());
					shoppingCart.setTradename(product.getTradename());
					totalMoney = totalMoney.add(shoppingCart.getMoney()).setScale(2, BigDecimal.ROUND_HALF_UP);
				}
				//合计含税=合计*(1 + 税率)
				totalTaxMoney = totalMoney.multiply(new BigDecimal(1).add(new BigDecimal(common_rate))).setScale(2, BigDecimal.ROUND_HALF_UP);
			}
		} catch(Exception e) {
			log.error("delShoppingCart error:" + e);
		}
		return SUCCESS;
	}
	
	/**
	 * 显示购物车内容
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String showShoppingCartAction() {
		try {
			this.clearMessages();
			initData();
			delProductID = "";
			totalMoney = new BigDecimal(0);
			totalTaxMoney = new BigDecimal(0);
			
			shoppingCartList = (List<ShoppingCartDto>) ActionContext.getContext().getSession().get(Constants.SESSION_SHOPPING_CART);
			if(shoppingCartList != null && shoppingCartList.size() > 0) {
				for(ShoppingCartDto shoppingCart : shoppingCartList) {
					//查询产品信息
					ProductDto product = productService.queryProductByID(shoppingCart.getProductid());
					shoppingCart.setFieldno(product.getFieldno());
					shoppingCart.setTypeno(product.getTypeno());
					shoppingCart.setColor(product.getColor());
					shoppingCart.setBrand(product.getBrand());
					shoppingCart.setMakearea(product.getMakearea());
					shoppingCart.setPackaging(product.getPackaging());
					shoppingCart.setUnit(product.getUnit());
					shoppingCart.setMinnum(product.getItem12());
					shoppingCart.setTradename(product.getTradename());
					totalMoney = totalMoney.add(shoppingCart.getMoney()).setScale(2, BigDecimal.ROUND_HALF_UP);
				}
				//合计含税=合计*(1 + 税率)
				totalTaxMoney = totalMoney.multiply(new BigDecimal(1).add(new BigDecimal(common_rate))).setScale(2, BigDecimal.ROUND_HALF_UP);
			}
		} catch(Exception e) {
			log.error("showShoppingCartAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	private void initData() {
		String language = (String) ActionContext.getContext().getSession().get(Constants.SYSTEM_LANGUAGE);
		goodsBaseList = dict01Service.queryGoodsNoOther(PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		
		//税率
		List<Dict01Dto> listRate = dict01Service.queryDict01ByFieldcode(Constants.DICT_RATE, PropertiesConfig.getPropertiesValueByKey(Constants.SYSTEM_LANGUAGE));
		if(listRate != null && listRate.size() > 0) {
			common_rate = listRate.get(0).getCode();
		}
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

	public List<ShoppingCartDto> getShoppingCartList() {
		return shoppingCartList;
	}

	public void setShoppingCartList(List<ShoppingCartDto> shoppingCartList) {
		this.shoppingCartList = shoppingCartList;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getDelProductID() {
		return delProductID;
	}

	public void setDelProductID(String delProductID) {
		this.delProductID = delProductID;
	}

	public Dict01Service getDict01Service() {
		return dict01Service;
	}

	public void setDict01Service(Dict01Service dict01Service) {
		this.dict01Service = dict01Service;
	}

	public List<Dict01Dto> getGoodsBaseList() {
		return goodsBaseList;
	}

	public void setGoodsBaseList(List<Dict01Dto> goodsBaseList) {
		this.goodsBaseList = goodsBaseList;
	}

	public List<Dict01Dto> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Dict01Dto> goodsList) {
		this.goodsList = goodsList;
	}

	public List<FeatureDto> getFeatureList() {
		return featureList;
	}

	public void setFeatureList(List<FeatureDto> featureList) {
		this.featureList = featureList;
	}

	public List<Dict01Dto> getUnitList() {
		return unitList;
	}

	public void setUnitList(List<Dict01Dto> unitList) {
		this.unitList = unitList;
	}

	public List<Dict01Dto> getMakeareaList() {
		return makeareaList;
	}

	public void setMakeareaList(List<Dict01Dto> makeareaList) {
		this.makeareaList = makeareaList;
	}

	public List<Dict01Dto> getColorList() {
		return colorList;
	}

	public void setColorList(List<Dict01Dto> colorList) {
		this.colorList = colorList;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public BigDecimal getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}

	public BigDecimal getTotalTaxMoney() {
		return totalTaxMoney;
	}

	public void setTotalTaxMoney(BigDecimal totalTaxMoney) {
		this.totalTaxMoney = totalTaxMoney;
	}
}
