package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * ¥��ʵ����
 * @author ymj
 *
 */
@Component
public class Floor {
	private Long id;//¥��id
	private String name;//¥������
	private String remark;//¥�㱸ע
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
