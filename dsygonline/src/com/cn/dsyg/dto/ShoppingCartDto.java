package com.cn.dsyg.dto;

import java.math.BigDecimal;

import com.cn.common.dto.BaseDto;
import com.cn.common.util.DsygOnlineUtil;

/**
 * ShoppingCartDto
 * @author Frank
 * @version 1.0
 * @create 2016-8-30下午1:45:22
 */
public class ShoppingCartDto extends BaseDto {

	private static final long serialVersionUID = 2970695967768147422L;

	/**
	 * 产品ID
	 */
	private String productid;
	
	/**
	 * 数量
	 */
	private BigDecimal productNum;
	
	/**
	 * 批号（生成warehouse记录用）
	 */
	private String batchno;
	
	/**
	 * 单价
	 */
	private BigDecimal price;
	
	/**
	 * 实际单价（根据销售数量和对应的价格列表计算出价格）
	 */
	private BigDecimal saleprice;
	
	/**
	 * ONLINE价格鼠标移上去显示的提示内容
	 */
	private String showOnlinePriceTip;
	
	/**
	 * 金额
	 */
	private BigDecimal money;
	
	/**
	 * 金额（含税）
	 */
	private BigDecimal taxmoney;

	/**
	 * 产品名
	 */
	private String tradename;
	
	/**
	 * 类型01：电线，02：套管，03：扁平线，04：线束，05：连接器，06：FPC
	 */
	private String fieldno;
	
	/**
	 * 品牌
	 */
	private String brand;
	
	/**
	 * 规格
	 */
	private String typeno;
	
	/**
	 * 颜色
	 */
	private String color;
	
	/**
	 * 产地
	 */
	private String makearea;
	
	/**
	 * 形式
	 */
	private String packaging;
	
	/**
	 * 单位
	 */
	private String unit;
	
	/**
	 * 最小单位
	 */
	private String minnum;
	
	/**
	 * 单价列表
	 */
	private String item13;

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public BigDecimal getProductNum() {
		return productNum;
	}

	public void setProductNum(BigDecimal productNum) {
		this.productNum = productNum;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getTradename() {
		return tradename;
	}

	public void setTradename(String tradename) {
		this.tradename = tradename;
	}

	public String getFieldno() {
		return fieldno;
	}

	public void setFieldno(String fieldno) {
		this.fieldno = fieldno;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getTypeno() {
		return typeno;
	}

	public void setTypeno(String typeno) {
		this.typeno = typeno;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getMakearea() {
		return makearea;
	}

	public void setMakearea(String makearea) {
		this.makearea = makearea;
	}

	public String getPackaging() {
		return packaging;
	}

	public void setPackaging(String packaging) {
		this.packaging = packaging;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getMinnum() {
		return minnum;
	}

	public void setMinnum(String minnum) {
		this.minnum = minnum;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public BigDecimal getTaxmoney() {
		taxmoney = new BigDecimal(0);
		if(productNum != null && getSaleprice() != null) {
			taxmoney = productNum.multiply(getSaleprice()).setScale(2, BigDecimal.ROUND_HALF_UP);
		}
		return taxmoney;
	}

	public void setTaxmoney(BigDecimal taxmoney) {
		this.taxmoney = taxmoney;
	}

	public String getBatchno() {
		return batchno;
	}

	public void setBatchno(String batchno) {
		this.batchno = batchno;
	}

	public BigDecimal getSaleprice() {
		saleprice = DsygOnlineUtil.calcOnlinePrice(price, item13, minnum, productNum);
		return saleprice;
	}

	public void setSaleprice(BigDecimal saleprice) {
		this.saleprice = saleprice;
	}

	public String getItem13() {
		return item13;
	}

	public void setItem13(String item13) {
		this.item13 = item13;
	}

	public String getShowOnlinePriceTip() {
		return showOnlinePriceTip;
	}

	public void setShowOnlinePriceTip(String showOnlinePriceTip) {
		this.showOnlinePriceTip = showOnlinePriceTip;
	}
}
