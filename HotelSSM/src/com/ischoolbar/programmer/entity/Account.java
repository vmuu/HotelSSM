package com.ischoolbar.programmer.entity;

import org.springframework.stereotype.Component;

/**
 * 客户实体类
 * @author ymj
 *
 */
@Component
public class Account {
	private Long id;//客户id
	private String name;//客户登录名
	private String password;//客户登录密码
	private String realName;//真实姓名
	private String idCard;//身份证号码
	private String mobile;//手机号
	private String address;//联系地址
	private int status;//状态：0：可用，-1：冻结
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
