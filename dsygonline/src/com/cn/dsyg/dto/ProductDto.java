package com.cn.dsyg.dto;

import java.math.BigDecimal;
import java.util.Date;

import com.cn.common.dto.BaseDto;

/**
 * @name 产品
 * @author Frank
 * @time 2014-12-16下午11:51:36
 * @version 1.0
 */
public class ProductDto extends BaseDto {
	
	private static final long serialVersionUID = -4977327319491155374L;

	/**
	 * ID
	 */
	private Long id;
	
	/**
	 * 采购单所属地（以后可能分上海和深圳）
	 */
	private String belongto;

	/**
	 * 类型01：电线，02：套管，03：扁平线，04：线束，05：连接器，06：FPC
	 */
	private String fieldno;

	/**
	 * 品牌
	 */
	private String brand;
	
	/**
	 * 库存数量
	 */
	private BigDecimal quantity;
	
	//含税成本价格
	private BigDecimal basetaxprice;
	
	/**
	 * ONLINE价格鼠标移上去显示的提示内容
	 */
	private String showOnlinePriceTip;
	
	/**
	 * 线上销售价
	 */
	private BigDecimal onlineprice;
	
	/**
	 * 购买数量
	 */
	private BigDecimal buynum;
	
	/**
	 * 总价格=数量*单价
	 */
	private BigDecimal buyamount;

	/**
	 * 类型1
	 */
	private String item1;

	/**
	 * 类型2
	 */
	private String item2;

	/**
	 * 类型3
	 */
	private String item3;
	
	/**
	 * 品名
	 */
	private String tradename;

	/**
	 * 规格
	 */
	private String typeno;

	/**
	 * 颜色
	 */
	private String color;

	/**
	 * 形式
	 */
	private String packaging;
	
	/**
	 * 单位
	 */
	private String unit;

	/**
	 * 是否样品
	 */
	private String sampleflag;

	/**
	 * 品牌-类型1-品名-规格-颜色-包装-是否样品
	 */
	private String productname;

	/**
	 * 产地
	 */
	private String makearea;
	
	/**
	 * 供应商ID（备用）
	 */
	private Long supplierid;
	
	/**
	 * 销售价
	 */
	private String salesprice;
	
	/**
	 * 采购价
	 */
	private String purchaseprice;
	
	//数量（入出库单显示用）
	private String num;
	//数量（入出库单显示用）
	private String numabs;
	//单价（入出库单显示用）
	private String unitprice;
	//金额（入出库单显示用）
	private String amount;
	//是否退货或破损
	private String hasbroken;
	//退货或破损数量
	private String brokennum;
	//订单号
	private String parentid;
	
	/**
	 * 备注
	 */
	private String note;

	/**
	 * 项目1
	 */
	private String item01;

	/**
	 * 项目2
	 */
	private String item02;

	/**
	 * 项目3
	 */
	private String item03;

	/**
	 * 项目4
	 */
	private String item04;

	/**
	 * 项目5
	 */
	private String item05;

	/**
	 * 项目6
	 */
	private String item06;

	/**
	 * 项目7
	 */
	private String item07;

	/**
	 * 项目8
	 */
	private String item08;

	/**
	 * 项目9
	 */
	private String item09;

	/**
	 * 包装
	 */
	private String item10;

	/**
	 * 住友代码
	 */
	private String item11;

	/**
	 * 购买最小单位
	 */
	private String item12;

	/**
	 * 项目13
	 */
	private String item13;

	/**
	 * 项目14
	 */
	private String item14;

	/**
	 * 项目15
	 */
	private String item15;

	/**
	 * 项目16
	 */
	private String item16;

	/**
	 * 项目17
	 */
	private String item17;

	/**
	 * 项目18
	 */
	private String item18;

	/**
	 * 项目19
	 */
	private String item19;

	/**
	 * 项目20
	 */
	private String item20;

	/**
	 * 项目21
	 */
	private String item21;

	/**
	 * 项目22
	 */
	private String item22;

	/**
	 * 项目23
	 */
	private String item23;

	/**
	 * 项目24
	 */
	private String item24;

	/**
	 * 项目25
	 */
	private String item25;

	/**
	 * 项目26
	 */
	private String item26;

	/**
	 * 项目27
	 */
	private String item27;

	/**
	 * 项目28
	 */
	private String item28;

	/**
	 * 项目29
	 */
	private String item29;

	/**
	 * 项目30
	 */
	private String item30;
	
	/**
	 * 图片网络访问地址
	 */
	private String imageurl;
	
	/**
	 * PDF文件访问地址
	 */
	private String pdfurl;

	/**
	 * 图片1路径
	 */
	private String pic01;

	/**
	 * 图片2路径
	 */
	private String pic02;

	/**
	 * 图片3路径
	 */
	private String pic03;

	/**
	 * 图片4路径
	 */
	private String pic04;

	/**
	 * 图片5路径
	 */
	private String pic05;

	/**
	 * PDF文件路径
	 */
	private String pdfpath;

	/**
	 * 级别(0-99)
	 */
	private Integer rank;

	/**
	 * 状态
	 */
	private Integer status;

	/**
	 * 预备项目1
	 */
	private String res01;

	/**
	 * 预备项目2
	 */
	private String res02;

	/**
	 * 预备项目3
	 */
	private String res03;

	/**
	 * 预备项目4
	 */
	private String res04;

	/**
	 * 预备项目5
	 */
	private String res05;

	/**
	 * 预备项目6
	 */
	private String res06;

	/**
	 * 预备项目7
	 */
	private String res07;

	/**
	 * 预备项目8
	 */
	private String res08;

	/**
	 * 预备项目9
	 */
	private String res09;

	/**
	 * 预备项目10
	 */
	private String res10;

	/**
	 * 关键字，模糊查询用
	 */
	private String keyword;

	/**
	 * 数据创建者
	 */
	private String createuid;

	/**
	 * 数据创建时间
	 */
	private Date createdate;

	/**
	 * 数据更新者
	 */
	private String updateuid;

	/**
	 * 数据更新时间
	 */
	private Date updatedate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getItem1() {
		return item1;
	}

	public void setItem1(String item1) {
		this.item1 = item1;
	}

	public String getItem2() {
		return item2;
	}

	public void setItem2(String item2) {
		this.item2 = item2;
	}

	public String getItem3() {
		return item3;
	}

	public void setItem3(String item3) {
		this.item3 = item3;
	}

	public String getTradename() {
		return tradename;
	}

	public void setTradename(String tradename) {
		this.tradename = tradename;
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

	public String getPackaging() {
		return packaging;
	}

	public void setPackaging(String packaging) {
		this.packaging = packaging;
	}

	public String getSampleflag() {
		return sampleflag;
	}

	public void setSampleflag(String sampleflag) {
		this.sampleflag = sampleflag;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getMakearea() {
		return makearea;
	}

	public void setMakearea(String makearea) {
		this.makearea = makearea;
	}

	public String getItem01() {
		return item01;
	}

	public void setItem01(String item01) {
		this.item01 = item01;
	}

	public String getItem02() {
		return item02;
	}

	public void setItem02(String item02) {
		this.item02 = item02;
	}

	public String getItem03() {
		return item03;
	}

	public void setItem03(String item03) {
		this.item03 = item03;
	}

	public String getItem04() {
		return item04;
	}

	public void setItem04(String item04) {
		this.item04 = item04;
	}

	public String getItem05() {
		return item05;
	}

	public void setItem05(String item05) {
		this.item05 = item05;
	}

	public String getItem06() {
		return item06;
	}

	public void setItem06(String item06) {
		this.item06 = item06;
	}

	public String getItem07() {
		return item07;
	}

	public void setItem07(String item07) {
		this.item07 = item07;
	}

	public String getItem08() {
		return item08;
	}

	public void setItem08(String item08) {
		this.item08 = item08;
	}

	public String getItem09() {
		return item09;
	}

	public void setItem09(String item09) {
		this.item09 = item09;
	}

	public String getItem10() {
		return item10;
	}

	public void setItem10(String item10) {
		this.item10 = item10;
	}

	public String getItem11() {
		return item11;
	}

	public void setItem11(String item11) {
		this.item11 = item11;
	}

	public String getItem12() {
		return item12;
	}

	public void setItem12(String item12) {
		this.item12 = item12;
	}

	public String getItem13() {
		return item13;
	}

	public void setItem13(String item13) {
		this.item13 = item13;
	}

	public String getItem14() {
		return item14;
	}

	public void setItem14(String item14) {
		this.item14 = item14;
	}

	public String getItem15() {
		return item15;
	}

	public void setItem15(String item15) {
		this.item15 = item15;
	}

	public String getItem16() {
		return item16;
	}

	public void setItem16(String item16) {
		this.item16 = item16;
	}

	public String getItem17() {
		return item17;
	}

	public void setItem17(String item17) {
		this.item17 = item17;
	}

	public String getItem18() {
		return item18;
	}

	public void setItem18(String item18) {
		this.item18 = item18;
	}

	public String getItem19() {
		return item19;
	}

	public void setItem19(String item19) {
		this.item19 = item19;
	}

	public String getItem20() {
		return item20;
	}

	public void setItem20(String item20) {
		this.item20 = item20;
	}

	public String getItem21() {
		return item21;
	}

	public void setItem21(String item21) {
		this.item21 = item21;
	}

	public String getItem22() {
		return item22;
	}

	public void setItem22(String item22) {
		this.item22 = item22;
	}

	public String getItem23() {
		return item23;
	}

	public void setItem23(String item23) {
		this.item23 = item23;
	}

	public String getItem24() {
		return item24;
	}

	public void setItem24(String item24) {
		this.item24 = item24;
	}

	public String getItem25() {
		return item25;
	}

	public void setItem25(String item25) {
		this.item25 = item25;
	}

	public String getItem26() {
		return item26;
	}

	public void setItem26(String item26) {
		this.item26 = item26;
	}

	public String getItem27() {
		return item27;
	}

	public void setItem27(String item27) {
		this.item27 = item27;
	}

	public String getItem28() {
		return item28;
	}

	public void setItem28(String item28) {
		this.item28 = item28;
	}

	public String getItem29() {
		return item29;
	}

	public void setItem29(String item29) {
		this.item29 = item29;
	}

	public String getItem30() {
		return item30;
	}

	public void setItem30(String item30) {
		this.item30 = item30;
	}

	public String getPic01() {
		return pic01;
	}

	public void setPic01(String pic01) {
		this.pic01 = pic01;
	}

	public String getPic02() {
		return pic02;
	}

	public void setPic02(String pic02) {
		this.pic02 = pic02;
	}

	public String getPic03() {
		return pic03;
	}

	public void setPic03(String pic03) {
		this.pic03 = pic03;
	}

	public String getPic04() {
		return pic04;
	}

	public void setPic04(String pic04) {
		this.pic04 = pic04;
	}

	public String getPic05() {
		return pic05;
	}

	public void setPic05(String pic05) {
		this.pic05 = pic05;
	}

	public String getPdfpath() {
		return pdfpath;
	}

	public void setPdfpath(String pdfpath) {
		this.pdfpath = pdfpath;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
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

	public String getRes06() {
		return res06;
	}

	public void setRes06(String res06) {
		this.res06 = res06;
	}

	public String getRes07() {
		return res07;
	}

	public void setRes07(String res07) {
		this.res07 = res07;
	}

	public String getRes08() {
		return res08;
	}

	public void setRes08(String res08) {
		this.res08 = res08;
	}

	public String getRes09() {
		return res09;
	}

	public void setRes09(String res09) {
		this.res09 = res09;
	}

	public String getRes10() {
		return res10;
	}

	public void setRes10(String res10) {
		this.res10 = res10;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

	public String getBelongto() {
		return belongto;
	}

	public void setBelongto(String belongto) {
		this.belongto = belongto;
	}

	public Long getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(Long supplierid) {
		this.supplierid = supplierid;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getHasbroken() {
		return hasbroken;
	}

	public void setHasbroken(String hasbroken) {
		this.hasbroken = hasbroken;
	}

	public String getBrokennum() {
		return brokennum;
	}

	public void setBrokennum(String brokennum) {
		this.brokennum = brokennum;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getPdfurl() {
		return pdfurl;
	}

	public void setPdfurl(String pdfurl) {
		this.pdfurl = pdfurl;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public String getSalesprice() {
		return salesprice;
	}

	public void setSalesprice(String salesprice) {
		this.salesprice = salesprice;
	}

	public String getPurchaseprice() {
		return purchaseprice;
	}

	public void setPurchaseprice(String purchaseprice) {
		this.purchaseprice = purchaseprice;
	}

	public String getNumabs() {
		return numabs;
	}

	public void setNumabs(String numabs) {
		this.numabs = numabs;
	}

	public String getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getBuynum() {
		return buynum;
	}

	public void setBuynum(BigDecimal buynum) {
		this.buynum = buynum;
	}

	public BigDecimal getBuyamount() {
		return buyamount;
	}

	public void setBuyamount(BigDecimal buyamount) {
		this.buyamount = buyamount;
	}

	public BigDecimal getBasetaxprice() {
		return basetaxprice;
	}

	public void setBasetaxprice(BigDecimal basetaxprice) {
		this.basetaxprice = basetaxprice;
	}

	public String getShowOnlinePriceTip() {
		showOnlinePriceTip = "";
		if(basetaxprice != null) {
			if(item13 != null && !"".equals(item13) && item12 != null && !"".equals(item12)) {
				int basenum = Integer.valueOf(item12);
				int startnum = 0;
				String[] list = item13.split(";");
				for(int i = 1; i < list.length; i++) {
					if(!"".equals(list[i])) {
						//取上一个标签的内容
						String[] startll = list[i - 1].split("-");
						startnum = Integer.valueOf(startll[0]) * basenum;
						BigDecimal price = basetaxprice.multiply(new BigDecimal(1).add(new BigDecimal(startll[1]).divide(new BigDecimal(100)))).setScale(6, BigDecimal.ROUND_HALF_UP);
						
						String[] ll = list[i].split("-");
						int endnum = Integer.valueOf(ll[0]) * basenum;
						//showOnlinePriceTip += "" + startnum + "-" + endnum + "，单价：" + price + "[" + startll[1] + "]&#13;";
						showOnlinePriceTip += "" + startnum + "-" + endnum + "，单价：" + price + "&#13;";
						if(i == list.length - 1) {
							//最后一条记录
							BigDecimal lastprice = basetaxprice.multiply(new BigDecimal(1).add(new BigDecimal(ll[1]).divide(new BigDecimal(100)))).setScale(6, BigDecimal.ROUND_HALF_UP);
							//showOnlinePriceTip += "" + endnum + "以上单价：" + lastprice + "[" + ll[1] + "]";
							showOnlinePriceTip += "" + endnum + "以上单价：" + lastprice + "";
						}
					}
				}
			}
		}
		return showOnlinePriceTip;
	}

	public void setShowOnlinePriceTip(String showOnlinePriceTip) {
		this.showOnlinePriceTip = showOnlinePriceTip;
	}

	public BigDecimal getOnlineprice() {
		onlineprice = null;
		if(basetaxprice != null) {
			if(item13 != null && !"".equals(item13)) {
				String[] list = item13.split(";");
				String[] startll = list[0].split("-");
				onlineprice = basetaxprice.multiply(new BigDecimal(1).add(new BigDecimal(startll[1]).divide(new BigDecimal(100)))).setScale(6, BigDecimal.ROUND_HALF_UP);
			}
		}
		return onlineprice;
	}

	public void setOnlineprice(BigDecimal onlineprice) {
		this.onlineprice = onlineprice;
	}
}
