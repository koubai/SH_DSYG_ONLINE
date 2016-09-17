package com.cn.dsyg.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cn.common.action.BaseAction;
import com.cn.common.mail.MailSender;
import com.cn.common.util.Constants;
import com.cn.common.util.DateUtil;
import com.cn.common.util.EncryptionDecryption;
import com.cn.common.util.MD5Util;
import com.cn.common.util.Page;
import com.cn.common.util.PropertiesConfig;
import com.cn.common.util.StringUtil;
import com.cn.dsyg.dto.CustomerDto;
import com.cn.dsyg.dto.MailAuthDto;
import com.cn.dsyg.service.CustomerService;
import com.cn.dsyg.service.MailAuthService;
import com.opensymphony.xwork2.ActionContext;

/**
 * @name CustomerAction.java
 * @author lql
 * @time 
 * @version 1.0
 */
public class CustomerAction extends BaseAction {
	
	private static final long serialVersionUID = 213673874531334690L;
	private static final Logger log = LogManager.getLogger(CustomerAction.class);
	private static String hostInfo = "";
	
	private CustomerService customerService;
	private MailAuthService mailAuthService;

	// 默认HOST_INFO
	private static String HOST_INFO = PropertiesConfig.getPropertiesValueByKey("HOST_INFO");

	static {
		// HOST_INFO
		hostInfo = PropertiesConfig.getPropertiesValueByKey("HOST_INFO");
		if (StringUtil.isBlank(hostInfo)) {
			hostInfo = HOST_INFO;
		}
	}
	
	//页码
	private int startIndex;

	//翻页page
	private Page page;
	//一页显示数据条数
	private Integer intPageSize;
	//页面显示的产品列表
	private List<CustomerDto> customerList;
	//用户mail
	private String strCustomerMail;
	
	//添加用户
	private CustomerDto addCustomerDto;
	private String hash;
	
	//修改用户
	private CustomerDto updCustomerDto;

	private int updCustomerid;
	
	//删除用户
	private int delCustomerid;
	
	//删除用户邮件
	private String delCustomeremail;

	//修改密码
	private CustomerDto updCustomerPsdDto;
	private String oldpassword;
	private String password;
	private String repassword;

	//用户登录
	private CustomerDto customerDto;
	
	//邮件记录
	private MailAuthDto mailAuthDto;

	//登录用
	//邮件
	private String customeremail;
	//密码
	private String customerpsd;
	
	//注册用
	//邮件
	private String customeremailR;
	//密码
	private String customerpsdR;
	//密码(确认)
	private String customerrepsdR;
	
	/**
	 * 显示修改密码页面
	 * @return
	 */
	public String showUpdCustomerPsdAction() {
		try {
			this.clearMessages();
			updCustomerPsdDto = new CustomerDto();
			oldpassword = "";
			password = "";
			repassword = "";
		} catch(Exception e) {
			log.error("showUpdCustomerPsdAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改密码
	 * @return
	 * @throws IOException 
	 */
	public String updCustomerPsdAction() throws IOException {
		String msg = "";
		try {
			this.clearMessages();
			if(StringUtil.isBlank(oldpassword)) {
				msg = "原始密码不能为空！";
				loginMsg(msg);
				return null;
			}
			
			if(StringUtil.isBlank(password)) {
				msg = "请输入新密码！";
				loginMsg(msg);
				return null;
			}
			if(!password.equals(repassword)) {
				msg = "两次密码不一致！";
				loginMsg(msg);
				return null;
			}
			//判断旧密码是否正确
			String currCustomer = (String) ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID);
			if(currCustomer.equals("")){
				msg = "请重新登录！";
				loginMsg(msg);
				return null;
			}
			CustomerDto account = customerService.queryCustomerByID(Integer.parseInt(currCustomer));
			if(!account.getPassword().equals(MD5Util.md5(oldpassword))) {
				msg = "旧密码不正确！";
				loginMsg(msg);
				return null;
			}
			
			updCustomerPsdDto.setCustomerid(Integer.parseInt(currCustomer));
			updCustomerPsdDto.setPassword(password);
			customerService.updPassword(updCustomerPsdDto);
			updCustomerPsdDto = new CustomerDto();
		} catch(Exception e) {
			log.error("updCustomerPsdAction error:" + e);
			msg = "修改密码产生系统异常！请联系管理员。";
		}
		loginMsg(msg);
		return null;
	}
	
	/**
	 * 显示用户修改页面
	 * @return
	 */
	public String showUpdCustomerAction() {
		try {
			this.clearMessages();
			updCustomerDto = customerService.queryCustomerByID(updCustomerid);
		} catch(Exception e) {
			log.error("showUpdCustomerAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改用户
	 * @return
	 */
	public String updCustomerAction() {
		try {
			this.clearMessages();
			//当前操作用户ID
			String currUser = String.valueOf(updCustomerDto.getCustomerid());
			updCustomerDto.setUpdateuid(currUser);
			customerService.updateCustomer(updCustomerDto);
			//修改用户成功
			log.error("更新成功！");
			//this.addActionMessage("更新成功！");
			
			//用户登录Session信息
			String username = "";
			String email = updCustomerDto.getCustomeremail();
			if(updCustomerDto.getName() != null && !updCustomerDto.getName().equals("")){
				username = updCustomerDto.getName();
			} else {
				username = email.substring(0, email.indexOf("@"));
			}
			ActionContext.getContext().getSession().put(Constants.SESSION_USER_ID, currUser);
			ActionContext.getContext().getSession().put(Constants.SESSION_USER_NAME, username);
			ActionContext.getContext().getSession().put(Constants.SESSION_LOGIN_TIME, DateUtil.dateToLogintime(new Date()));
			ActionContext.getContext().getSession().put(Constants.SESSION_ISLOGIN, Constants.SESSION_FLAG_IS_LOGIN);
			log.info(email + " login success.");
		} catch(Exception e) {
			log.error("updCustomerAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示新增用户页面
	 * @return
	 */
	public String showAddCustomerAction() {
		try {
			this.clearMessages();
			addCustomerDto = new CustomerDto();
			addCustomerDto.setStatus(1);
		} catch(Exception e) {
			log.error("showAddCustomerAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 发送受理交期确认邮件
	 * @return
	 */
	public String sendConfirmMailAction() {
		try {
			this.clearMessages();
			
			//发送受理交期确认邮件
			//邮件标题
			String subject = "[东升盈港线上购买] 受理交期确认";
			String customerid = updCustomerDto.getCustomerid()+"";
			//hash加密键
			EncryptionDecryption ee = new EncryptionDecryption();
			Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = dateFormat.format(now); 
			String strHash = "customerid=" + customerid + "&time=" + time;
			System.out.println(strHash);
			//加密
			String hash = ee.encrypt(strHash);
			System.out.println(hash);
			//邮件内容
			String body = "";
			body += "非常感谢本次与东升盈港确认交期。<br/>";
			body += "在确认在库状况后，会尽快答复您的。但是，根据产品不同，答复所需的时间也会不同，这一点还请理解。<br/><br/>";
			body += "==========================================<br/>";
			body += "东升盈港企业发展有限公司<br/>";
			body += "上海市杨浦区控江路760号<br/>";
			body += "电话：021－65388038－0（总机）<br/>";
			body += "Mail：sales@shdsyg.com<br/>";
			body += "http://www.shdsyg.cn<br/>";			
			body += "==========================================<br/>";
			MailSender.send("", updCustomerDto.getCustomeremail(), subject, body, "东升盈港", "");
			
			//新增邮件记录
			mailAuthDto = new MailAuthDto();
			mailAuthDto.setAuthtype(2);
			mailAuthDto.setUserid(String.valueOf(customerid));
			mailAuthDto.setMailauthcode(hash);
			mailAuthDto.setStatus(1);
			mailAuthService.insertMailAuth(mailAuthDto);
			
			addCustomerDto = new CustomerDto();
			addCustomerDto.setStatus(1);
			mailAuthDto = new MailAuthDto();
		} catch(Exception e) {
			log.error("sendConfirmMailAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 新增用户
	 * @return
	 * @throws IOException 
	 */
	public String addCustomerAction() throws IOException {
		String msg = "";
		try {
			this.clearMessages();
			//数据验证
			/*if(!checkData(addCustomerDto, "1")) {
				return "checkerror";
			}*/
			if(StringUtil.isBlank(customeremailR)) {
				msg = "用户邮件地址不能为空！";
				loginMsg(msg);
				return null;
			}
			if(StringUtil.isBlank(customerpsdR)) {
				msg = "用户密码不能为空！";
				loginMsg(msg);
				return null;
			}
			if(!customerpsdR.equals(customerrepsdR)) {
				msg = "两次输入的密码不一致！";
				loginMsg(msg);
				return null;
			}
			//逻辑主键check
			List<CustomerDto> customerList = customerService.queryCustomerByMail(customeremailR);
			for (CustomerDto customer : customerList){
				if(customer.getStatus() == 1){
					msg = "此邮件地址已被注册，请根据邮件内容激活正式会员！";
					loginMsg(msg);
					return null;
				}
				if(customer.getStatus() == 2){
					msg = "此邮件地址已被注册！";
					loginMsg(msg);
					return null;
				}
			}
			//新增用户
			addCustomerDto = new CustomerDto();
			addCustomerDto.setStatus(1);
			addCustomerDto.setCustomeremail(customeremailR);
			addCustomerDto.setPassword(customerpsdR);
			customerService.insertCustomer(addCustomerDto);
			//取得用户ID
			CustomerDto cus = customerService.queryCustomerByMailStatus(addCustomerDto.getCustomeremail(), 1);
			if(cus == null){
				msg = "用户数据不存在！";
				loginMsg(msg);
				return null;
			}
			int customerid = cus.getCustomerid();
			//新增用户成功
			log.error("添加成功！");
			
			//发送临时登录邮件
			//邮件标题
			String subject = "[东升盈港线上购买] 会员临时登录";
			//hash加密键
			EncryptionDecryption ee = new EncryptionDecryption();
			Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = dateFormat.format(now); 
			String strHash = "customerid=" + customerid + "&time=" + time;
			System.out.println(strHash);
			//加密
			String hash = ee.encrypt(strHash);
			System.out.println(hash);
			//邮件内容
			String body = "";
			body += "平日里承蒙对东升盈港的厚爱，我司对此表示诚挚感谢。<br/>";
			body += "目前为临时登录，请点击以下页面，进行正式登录。<br/><br/>";
			body += hostInfo + "/dsygonline/customer/doRegistryAction.action"
				+ "?hash=" + hash + "<br/><br/><br/><br/><br/>";
			body += "==========================================<br/>";
			body += "东升盈港企业发展有限公司<br/>";
			body += "上海市杨浦区控江路760号<br/>";
			body += "电话：021－65388038－0（总机）<br/>";
			body += "Mail：sales@shdsyg.com<br/>";
			body += "http://www.shdsyg.cn<br/>";			
			body += "==========================================<br/>";
			MailSender.send("", addCustomerDto.getCustomeremail(), subject, body, "东升盈港", "");
			
			//新增邮件记录
			mailAuthDto = new MailAuthDto();
			mailAuthDto.setAuthtype(1);
			mailAuthDto.setUserid(String.valueOf(customerid));
			mailAuthDto.setMailauthcode(hash);
			mailAuthDto.setStatus(1);
			mailAuthService.insertMailAuth(mailAuthDto);
			
			addCustomerDto = new CustomerDto();
			addCustomerDto.setStatus(1);
			mailAuthDto = new MailAuthDto();
		} catch(Exception e) {
			log.error("addCustomerAction error:" + e);
			msg = "注册产生系统异常！请联系管理员。";
		}
		loginMsg(msg);
		return null;
	}
	
	/**
	 * 正式注册
	 * @return
	 */
	public String doRegistryAction() {
		try {
			this.clearMessages();
			String ip = getIP();
			//逻辑主键check
			//解密
			EncryptionDecryption ee = new EncryptionDecryption();
			String params = ee.decrypt(hash);
			String customerid = "";
			log.info("params=" + params);
			Map<String, Object> map = getParamMap(params);
			for(Map.Entry<String, Object> entry : map.entrySet()) {
				if(entry.getKey().equals("customerid")){
					customerid = (String) entry.getValue();
				}
			}
			//验证数据是否存在
			MailAuthDto mailAuth = mailAuthService.queryMailAuthByLogicId(customerid, hash);
			if(mailAuth == null) {
				this.addActionMessage("此邮件数据不存在！");
				return "checkerror";
			}
			log.info("params=queryMailAuthByLogicId");
			//判断该code是否已被验证
			if(Constants.STATUS_NORMAL != mailAuth.getStatus()) {
				this.addActionMessage("此邮件内容已完成验证！");
				return "checkerror";
			}
			log.info("params=getStatus");
			updCustomerDto = customerService.queryCustomerByID(Integer.parseInt(customerid));
			if(updCustomerDto == null){
				this.addActionMessage("此邮件地址未注册！");
				return "checkerror";
			}
			if(updCustomerDto.getStatus() == 0){
				this.addActionMessage("此邮件地址已注销！");
				return "checkerror";
			}
			if(updCustomerDto.getStatus() == 2){
				this.addActionMessage("此邮件地址已注册完成！");
				return "checkerror";
			}
			log.info("params=queryCustomerByID");
			//当前操作用户ID
			updCustomerDto.setUpdateuid(customerid);
			updCustomerDto.setStatus(2);
			customerService.updateCustomer(updCustomerDto);
			//逻辑删除MailAuth数据
			mailAuthService.deleteMailAuth("" + mailAuth.getId(), ip, customerid);
			//修改用户成功
			log.info("正式注册成功！");
			//this.addActionMessage("正式注册成功！");

			//发送正式登录邮件
			//邮件标题
			String subject = "[东升盈港线上购买] 会员正式登录";
			String email = updCustomerDto.getCustomeremail();
			//邮件内容
			String body = "";
			body += "已完成正式会员的登录。<br/>";
			body += "感谢您成为东升盈港正式会员<br/><br/>";
			body += "用户登录EMAIL:[ " + email + " ]<br/>";
			body += "登录密码是新会员在注册时所输入的密码。<br/><br/>";
			body += hostInfo + "/dsygonline/customer/showShop.action<br/><br/><br/><br/><br/>";
			body += "==========================================<br/>";
			body += "东升盈港企业发展有限公司<br/>";
			body += "上海市杨浦区控江路760号<br/>";
			body += "电话：021－65388038－0（总机）<br/>";
			body += "Mail：sales@shdsyg.com<br/>";
			body += "http://www.shdsyg.cn<br/>";			
			body += "==========================================<br/>";
			System.out.println(body);
			MailSender.send("", email, subject, body, "东升盈港", "");
			
		} catch(Exception e) {
			log.error("doRegistryAction error:" + e);
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
	
	/**
	 * 删除用户
	 * @return
	 * @throws IOException 
	 */
	public String delCustomerAction() throws IOException {
		String msg = "";
		try {
			this.clearMessages();
			delCustomerid = Integer.valueOf(ActionContext.getContext().getSession().get(Constants.SESSION_USER_ID)+"");
			log.error("delCustomerid=" + delCustomerid);
			if(StringUtil.isBlank(String.valueOf(delCustomerid))) {
				msg = "用户登录ID不能为空！";
				loginMsg(msg);
				return null;
			}
			CustomerDto customer = customerService.queryCustomerByID(delCustomerid);
			if(customer == null){
				msg = "用户数据不存在！";
				loginMsg(msg);
				return null;
			}
			//删除用户
			customerService.deleteCustomer(delCustomerid);
			log.error("删除成功！");
			//刷新页面
			startIndex = 0;
			delCustomerid = 0;
			//退出登录
			logoutAction();
		} catch(Exception e) {
			log.error("delCustomerAction error:" + e);
			msg = "注销产生系统异常！请联系管理员。";
			//return ERROR;
		}
		loginMsg(msg);
		return null;
	}

	/**
	 * 验证数据
	 * @param account
	 * @param flag
	 * @return
	 */
	private boolean checkData(CustomerDto customer, String flag) {
		if("1".equals(flag)) {
			//新增
			if(StringUtil.isBlank(customeremailR)) {
				this.addActionMessage("用户邮件地址不能为空！");
				return false;
			}
			if(StringUtil.isBlank(customerpsdR)) {
				this.addActionMessage("用户密码不能为空！");
				return false;
			}
			if(!customerpsdR.equals(customerrepsdR)) {
				this.addActionMessage("两次输入的密码不一致！");
				return false;
			}
		}
		return true;
	}
	
	//用户登录
	
	/**
	 * 显示用户登录页
	 * @return
	 */
	public String showLoginAction() {
		try {
			this.clearMessages();
			String ip = this.getIP();
			log.info("ip=" + ip);
			customerDto = new CustomerDto();
			customeremail = "";
			customerpsd = "";
		} catch(Exception e) {
			log.error("showLoginAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 用户登录
	 * @return
	 * @throws IOException 
	 */
	public String loginAction() throws IOException {
		String msg = "";
		try {
			this.clearMessages();
			if(StringUtil.isBlank(customeremail)) {
				msg = "邮件地址不能为空！";
				loginMsg(msg);
				return null;
			}
			if(StringUtil.isBlank(customerpsd)) {
				msg = "登录密码不能为空";
				loginMsg(msg);
				return null;
			}

			//验证登录密码
			CustomerDto customer = customerService.queryCustomerByMailStatus(customeremail, 2);
			if(customer == null) {
				msg = "非有效用户！";
				loginMsg(msg);
				return null;
			}
			if(!MD5Util.md5(customerpsd).equals(customer.getPassword())) {
				msg = "登录密码不正确！";
				loginMsg(msg);
				return null;
			}
			
			//用户登录Session信息
			String username = "";
			if(customer.getName() != null && !customer.getName().equals("")){
				username = customer.getName();
			} else {
				username = customeremail.substring(0, customeremail.indexOf("@"));
			}
			ActionContext.getContext().getSession().put(Constants.SESSION_USER_ID, String.valueOf(customer.getCustomerid()));
			ActionContext.getContext().getSession().put(Constants.SESSION_USER_NAME, username);
			ActionContext.getContext().getSession().put(Constants.SESSION_LOGIN_TIME, DateUtil.dateToLogintime(new Date()));
			ActionContext.getContext().getSession().put(Constants.SESSION_ISLOGIN, Constants.SESSION_FLAG_IS_LOGIN);
			log.info(customeremail + " login success.");
		} catch(Exception e) {
			log.error("loginAction error:" + e);
			msg = "登录产生系统异常！请联系管理员。";
			//return ERROR;
		}
		loginMsg(msg);
		return null;
	}
	
	/**
	 * 返回登录信息
	 * @return
	 * @throws IOException 
	 */
	public void loginMsg(String msg) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		String result = "";
		out = response.getWriter();
		result = "{\"msg\":\"" + msg + "\"}";
		log.info("loginAction result=" + result);
		out.write(result);
		out.flush();
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	public String logoutAction() {
		try {
			this.clearMessages();
			//不能直接清空所有SESSION，有购物车内容。
			ActionContext.getContext().getSession().remove(Constants.SESSION_USER_ID);
			ActionContext.getContext().getSession().remove(Constants.SESSION_USER_NAME);
			ActionContext.getContext().getSession().remove(Constants.SESSION_LOGIN_TIME);
			ActionContext.getContext().getSession().remove(Constants.SESSION_ISLOGIN);
			//ActionContext.getContext().getSession().clear();
			customerDto = new CustomerDto();
		} catch(Exception e) {
			log.error("logoutAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	/* 
	 * show Shop Purchase Information
	 * 
	 */
	public String showShopHelpAction() {
		try {
			this.clearMessages();
			//不能直接清空所有SESSION，有购物车内容。
			//ActionContext.getContext().getSession().clear();
		} catch(Exception e) {
			log.error("showShopHelpAction error:" + e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Integer getIntPageSize() {
		return intPageSize;
	}

	public void setIntPageSize(Integer intPageSize) {
		this.intPageSize = intPageSize;
	}

	public List<CustomerDto> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<CustomerDto> customerList) {
		this.customerList = customerList;
	}

	public String getStrCustomerMail() {
		return strCustomerMail;
	}

	public void setStrCustomerMail(String strCustomerMail) {
		this.strCustomerMail = strCustomerMail;
	}

	public CustomerDto getAddCustomerDto() {
		return addCustomerDto;
	}

	public void setAddCustomerDto(CustomerDto addCustomerDto) {
		this.addCustomerDto = addCustomerDto;
	}

	public CustomerDto getUpdCustomerDto() {
		return updCustomerDto;
	}

	public void setUpdCustomerDto(CustomerDto updCustomerDto) {
		this.updCustomerDto = updCustomerDto;
	}

	public int getUpdCustomerid() {
		return updCustomerid;
	}

	public void setUpdCustomerid(int updCustomerid) {
		this.updCustomerid = updCustomerid;
	}

	public int getDelCustomerid() {
		return delCustomerid;
	}

	public void setDelCustomerid(int delCustomerid) {
		this.delCustomerid = delCustomerid;
	}

	public CustomerDto getUpdCustomerPsdDto() {
		return updCustomerPsdDto;
	}

	public void setUpdCustomerPsdDto(CustomerDto updCustomerPsdDto) {
		this.updCustomerPsdDto = updCustomerPsdDto;
	}

	public MailAuthDto getMailAuthDto() {
		return mailAuthDto;
	}

	public void setMailAuthDto(MailAuthDto mailAuthDto) {
		this.mailAuthDto = mailAuthDto;
	}

	public MailAuthService getMailAuthService() {
		return mailAuthService;
	}

	public void setMailAuthService(MailAuthService mailAuthService) {
		this.mailAuthService = mailAuthService;
	}

	public CustomerDto getCustomerDto() {
		return customerDto;
	}

	public void setCustomerDto(CustomerDto customerDto) {
		this.customerDto = customerDto;
	}

	public String getDelCustomeremail() {
		return delCustomeremail;
	}

	public void setDelCustomeremail(String delCustomeremail) {
		this.delCustomeremail = delCustomeremail;
	}

	public String getCustomeremail() {
		return customeremail;
	}

	public void setCustomeremail(String customeremail) {
		this.customeremail = customeremail;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getCustomerpsd() {
		return customerpsd;
	}

	public void setCustomerpsd(String customerpsd) {
		this.customerpsd = customerpsd;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getCustomeremailR() {
		return customeremailR;
	}

	public void setCustomeremailR(String customeremailR) {
		this.customeremailR = customeremailR;
	}

	public String getCustomerpsdR() {
		return customerpsdR;
	}

	public void setCustomerpsdR(String customerpsdR) {
		this.customerpsdR = customerpsdR;
	}

	public String getCustomerrepsdR() {
		return customerrepsdR;
	}

	public void setCustomerrepsdR(String customerrepsdR) {
		this.customerrepsdR = customerrepsdR;
	}
}
