package com.ischoolbar.programmer.service.admin.impl;
/**
 * ¬•≤„service µœ÷¿‡
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.FloorDao;
import com.ischoolbar.programmer.entity.admin.Floor;
import com.ischoolbar.programmer.service.admin.FloorService;
@Service
public class FloorServiceImpl implements FloorService {

	@Autowired
	private FloorDao floorDao;
	
	@Override
	public int add(Floor floor) {
		// TODO Auto-generated method stub
		return floorDao.add(floor);
	}

	@Override
	public int edit(Floor floor) {
		// TODO Auto-generated method stub
		return floorDao.edit(floor);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return floorDao.delete(id);
	}

	@Override
	public List<Floor> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return floorDao.findList(queryMap);
	}

	@Override
	public List<Floor> findAll() {
		// TODO Auto-generated method stub
		return floorDao.findAll();
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return floorDao.getTotal(queryMap);
	}

}
