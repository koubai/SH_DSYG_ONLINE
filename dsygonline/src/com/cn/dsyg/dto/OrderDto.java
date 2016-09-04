package com.cn.dsyg.dto;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.cn.common.dto.BaseDto;

/**
 * @name OrderDto.java
 * @author Frank
 * @time 2016-9-4下午2:10:05
 * @version 1.0
 */
public class OrderDto extends BaseDto {

	private static final long serialVersionUID = -5277224653340637835L;

	/**
	 * ID
	 */
	private Integer id;

	/**
	 * 订单号，逻辑主键
	 */
	private String ordercode;
	
	/**
	 * 订单明细
	 */
	private List<OrderDetailDto> orderDetailList;

	/**
	 * 线上客户ID
	 */
	private Integer customerid;

	/**
	 * 总金额
	 */
	private BigDecimal amount;

	/**
	 * 总金额含税
	 */
	private BigDecimal taxamount;

	/**
	 * 交期日
	 */
	private Date deliverydate;

	/**
	 * 付款日
	 */
	private Date cashdate;

	/**
	 * 收款银行
	 */
	private String bank;

	/**
	 * 收款银行帐号
	 */
	private String bankaccount;

	/**
	 * 收货人
	 */
	private String receive;

	/**
	 * 收货邮编
	 */
	private String receivecode;

	/**
	 * 收货人电话
	 */
	private String receivetell;

	/**
	 * 收货地址
	 */
	private String receiveaddress;
	
	/**
	 * 备注
	 */
	private String note;

	/**
	 * 10新建，20交期确认，30交期回复，40下单成功，50付款成功，60收款成功，70已发货，80已收货订单完成，99订单关闭
	 */
	private Integer status;

	/**
	 * 备用字段1
	 */
	private String res01;

	/**
	 * 备用字段2
	 */
	private String res02;

	/**
	 * 备用字段3
	 */
	private String res03;

	/**
	 * 备用字段4
	 */
	private String res04;

	/**
	 * 备用字段5
	 */
	private String res05;

	/**
	 * 最后操作者电脑IP
	 */
	private String updateip;

	/**
	 * 创建者
	 */
	private String createuid;

	/**
	 * 创建时间
	 */
	private Date createdate;

	/**
	 * 更新者
	 */
	private String updateuid;

	/**
	 * 更新时间
	 */
	private Date updatedate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public BigDecimal getTaxamount() {
		return taxamount;
	}

	public void setTaxamount(BigDecimal taxamount) {
		this.taxamount = taxamount;
	}

	public Date getDeliverydate() {
		return deliverydate;
	}

	public void setDeliverydate(Date deliverydate) {
		this.deliverydate = deliverydate;
	}

	public Date getCashdate() {
		return cashdate;
	}

	public void setCashdate(Date cashdate) {
		this.cashdate = cashdate;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankaccount() {
		return bankaccount;
	}

	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}

	public String getReceive() {
		return receive;
	}

	public void setReceive(String receive) {
		this.receive = receive;
	}

	public String getReceivecode() {
		return receivecode;
	}

	public void setReceivecode(String receivecode) {
		this.receivecode = receivecode;
	}

	public String getReceivetell() {
		return receivetell;
	}

	public void setReceivetell(String receivetell) {
		this.receivetell = receivetell;
	}

	public String getReceiveaddress() {
		return receiveaddress;
	}

	public void setReceiveaddress(String receiveaddress) {
		this.receiveaddress = receiveaddress;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRes01() {
		return res01;
	}

	public void setRes01(String res01) {
		this.res01 = res01;
	}

	public String getRes02() {
		return res02;
	}

	public void setRes02(String res02) {
		this.res02 = res02;
	}

	public String getRes03() {
		return res03;
	}

	public void setRes03(String res03) {
		this.res03 = res03;
	}

	public String getRes04() {
		return res04;
	}

	public void setRes04(String res04) {
		this.res04 = res04;
	}

	public String getRes05() {
		return res05;
	}

	public void setRes05(String res05) {
		this.res05 = res05;
	}

	public String getUpdateip() {
		return updateip;
	}

	public void setUpdateip(String updateip) {
		this.updateip = updateip;
	}

	public String getCreateuid() {
		return createuid;
	}

	public void setCreateuid(String createuid) {
		this.createuid = createuid;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getUpdateuid() {
		return updateuid;
	}

	public void setUpdateuid(String updateuid) {
		this.updateuid = updateuid;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getOrdercode() {
		return ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public List<OrderDetailDto> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetailDto> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
}
