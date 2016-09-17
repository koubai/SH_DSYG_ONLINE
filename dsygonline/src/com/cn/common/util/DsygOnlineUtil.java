package com.cn.common.util;

import java.math.BigDecimal;

/**
 * @name DsygOnlineUtil.java
 * @author Frank
 * @time 2016-9-17下午10:48:56
 * @version 1.0
 */
public class DsygOnlineUtil {

	/**
	 * 计算价格
	 * @param baseprice
	 * @param pricelist
	 * @param basenum
	 * @param buynum
	 * @return
	 */
	public static BigDecimal calcOnlinePrice(BigDecimal baseprice, String pricelist, String basenum, BigDecimal buynum) {
		BigDecimal result = new BigDecimal(0);
		BigDecimal pecent = new BigDecimal(0);
		if(baseprice != null) {
			if(pricelist != null && !"".equals(pricelist) && basenum != null) {
				int base = Integer.valueOf(basenum);
				int n = buynum.intValue() / base;
				String[] list = pricelist.split(";");
				for(int i = 0; i < list.length; i++) {
					if(!"".equals(list[i])) {
						//取上一个标签的内容
						String[] ll = list[i].split("-");
						if(n >= Integer.valueOf(ll[0])) {
							pecent = new BigDecimal(ll[1]);
						} else {
							break;
						}
					}
				}
			}
		}
		result = baseprice.multiply(new BigDecimal(1).add(pecent.divide(new BigDecimal(100)))).setScale(6, BigDecimal.ROUND_HALF_UP);
		return result;
	}
	
	public static void main(String[] args) {
		BigDecimal baseprice = new BigDecimal(0.188955);
		String pricelist = "1-55;20-50;40-48;60-46;80-44;100-42;120-40;140-38;160-36;180-34;200-32;";
		String basenum = "500";
		BigDecimal buynum = new BigDecimal(100000);
		System.out.println(calcOnlinePrice(baseprice, pricelist, basenum, buynum));
	}
}
