package com.ischoolbar.programmer.entity;

import org.springframework.stereotype.Component;

/**
 * 房间类型实体类
 * @author ymj
 *
 */
@Component
public class RoomType {
	private Long id;//房间类型id
	private String name;//房间名称
	private String photo;//房间类型图片
	private Float price;//房型价格
	private Integer liveNum;//可住人数
	private Integer bedNum;//床位数
	private Integer roomNum;//房间数
	private Integer avilableNum;//可住或可预定房间数
	private Integer bookNum;//预定数
	private Integer livedNum;//已经入住数
	private int status;//房型状态，0：房型已满,1:可预订可入住
	private String remark;//房型备注
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
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getLiveNum() {
		return liveNum;
	}
	public void setLiveNum(Integer liveNum) {
		this.liveNum = liveNum;
	}
	public Integer getBedNum() {
		return bedNum;
	}
	public void setBedNum(Integer bedNum) {
		this.bedNum = bedNum;
	}
	public Integer getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}
	public Integer getAvilableNum() {
		return avilableNum;
	}
	public void setAvilableNum(Integer avilableNum) {
		this.avilableNum = avilableNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getBookNum() {
		return bookNum;
	}
	public void setBookNum(Integer bookNum) {
		this.bookNum = bookNum;
	}
	public Integer getLivedNum() {
		return livedNum;
	}
	public void setLivedNum(Integer livedNum) {
		this.livedNum = livedNum;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
