package com.cn.dsyg.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.util.Constants;
import com.cn.common.util.DateUtil;
import com.cn.common.util.EncryptionDecryption;
import com.cn.common.util.MapUtil;
import com.cn.common.util.StringUtil;
import com.cn.dsyg.dto.MailAuthDto;
import com.cn.dsyg.dto.UserDto;
import com.cn.dsyg.service.MailAuthService;
import com.cn.dsyg.service.UserService;
import com.opensymphony.xwork2.ActionContext;

/**
 * MailAuthAction
 * @author Frank
 * @version 1.0
 * @create 2016-8-5下午3:27:01
 */
public class MailAuthAction extends BaseAction {

	private static final long serialVersionUID = -6381211594507792419L;
	private static final Logger log = LogManager.getLogger(MailAuthAction.class);
	
	private MailAuthService mailAuthService;
	private UserService userService;
	
	private String strUserid;
	private String strAuthCode;

	/**
	 * 订单确认
	 * @return
	 */
	public String orderConfirmAction() {
		try {
			this.clearMessages();
			String ip = getIP();
			log.info("orderConfirm ip=" + ip);
			//验证数据是否存在
			MailAuthDto mailAuth = mailAuthService.queryMailAuthByLogicId(strUserid, strAuthCode);
			if(mailAuth == null) {
				return "checkerror";
			}
			//判断该code是否已被验证
			if(Constants.STATUS_NORMAL != mailAuth.getStatus()) {
				return "checkerror";
			}
			EncryptionDecryption ee = new EncryptionDecryption();
			//解密
			String params = ee.decrypt(strAuthCode);
			
			log.info("params=" + params);
			Map<String, Object> map = getParamMap(params);
			MapUtil.printMap(map);
			
			//逻辑删除MailAuth数据
			mailAuthService.deleteMailAuth("" + mailAuth.getId(), ip, strUserid);
			
			//模拟登录
			UserDto user = userService.queryUserByID(strUserid);
			if(user != null) {
				ActionContext.getContext().getSession().put(Constants.SESSION_USER_ID, strUserid);
				ActionContext.getContext().getSession().put(Constants.SESSION_USER_NAME, user.getUsername());
				ActionContext.getContext().getSession().put(Constants.SESSION_LOGIN_TIME, DateUtil.dateToLogintime(new Date()));
				ActionContext.getContext().getSession().put(Constants.SESSION_ISLOGIN, Constants.SESSION_FLAG_IS_LOGIN);
				//进入订单确认页面，此处暂略，等订单确认页面开发完成后，接入。
			} else {
				//用户不存在
				return "checkerror";
			}
		} catch(Exception e) {
			log.error("orderConfirm error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 获得参数map
	 * @param params
	 * @return
	 */
	private Map<String, Object> getParamMap(String params) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNotBlank(params)) {
			String[] list = params.split("&");
			for(String s : list) {
				if(StringUtil.isNotBlank(s)) {
					String[] ll = s.split("=");
					map.put(ll[0], ll[1]);
				}
			}
		}
		return map;
	}

	public String getStrUserid() {
		return strUserid;
	}

	public String getStrAuthCode() {
		return strAuthCode;
	}

	public void setStrUserid(String strUserid) {
		this.strUserid = strUserid;
	}

	public void setStrAuthCode(String strAuthCode) {
		this.strAuthCode = strAuthCode;
	}

	public MailAuthService getMailAuthService() {
		return mailAuthService;
	}

	public void setMailAuthService(MailAuthService mailAuthService) {
		this.mailAuthService = mailAuthService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
