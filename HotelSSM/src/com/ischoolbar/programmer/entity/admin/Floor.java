package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * Â¥²ãÊµÌåÀà
 * @author ymj
 *
 */
@Component
public class Floor {
	private Long id;//Â¥²ãid
	private String name;//Â¥²ãÃû³Æ
	private String remark;//Â¥²ã±¸×¢
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
