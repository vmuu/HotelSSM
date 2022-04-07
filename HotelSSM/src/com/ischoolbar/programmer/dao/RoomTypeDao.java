package com.ischoolbar.programmer.dao;
import java.util.List;
import java.util.Map;



/**
 * 房间类型dao
 */
import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.RoomType;

@Repository
public interface RoomTypeDao {
	public int add(RoomType roomType);
	public int edit(RoomType roomType);
	public int delete(Long id);
	public List<RoomType> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public List<RoomType> findAll();
	public RoomType find(Long id);
	public int updateNum(RoomType roomType);
}
