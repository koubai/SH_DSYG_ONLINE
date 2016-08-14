package com.cn.common.util;

import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * MapUtil
 * @author Frank
 * @version 1.0
 * @create 2013-6-3下午05:51:16
 */
public class MapUtil {
	
	private static final Logger log = LogManager.getLogger(MapUtil.class);

	/**
	 * 打印Map内容
	 * @param map
	 */
	public static void printMap(Map<String, Object> map) {
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			log.info(entry.getKey() + "=" + entry.getValue());
		}
	}
}
