package com.cn.dsyg.dto;

import java.math.BigDecimal;

import com.cn.common.dto.BaseDto;

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
		money = new BigDecimal(0);
		if(productNum != null && price != null) {
			money = productNum.multiply(price).setScale(2, BigDecimal.ROUND_HALF_UP);
		}
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public BigDecimal getTaxmoney() {
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
}
