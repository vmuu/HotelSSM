package com.ischoolbar.programmer.service.admin;
/**
 * ·¿¼äservice
 */
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.admin.Room;

@Service
public interface RoomService {
	public int add(Room room);
	public int edit(Room room);
	public int delete(Long id);
	public List<Room> findList(Map<String, Object> queryMap);
	public List<Room> findAll();
	public Integer getTotal(Map<String, Object> queryMap);
	public Room find(Long id);
	public Room findBySn(String sn);
}
