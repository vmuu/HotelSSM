package com.ischoolbar.programmer.service.admin.impl;
/**
 * 入住管理service实现类
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.CheckinDao;
import com.ischoolbar.programmer.entity.admin.Checkin;
import com.ischoolbar.programmer.service.admin.CheckinService;
@Service
public class CheckinServiceImpl implements CheckinService {

	@Autowired
	private CheckinDao checkinDao;

	@Override
	public int add(Checkin checkin) {
		// TODO Auto-generated method stub
		return checkinDao.add(checkin);
	}

	@Override
	public int edit(Checkin checkin) {
		// TODO Auto-generated method stub
		return checkinDao.edit(checkin);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return checkinDao.delete(id);
	}

	@Override
	public List<Checkin> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return checkinDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return checkinDao.getTotal(queryMap);
	}

	@Override
	public Checkin find(Long id) {
		// TODO Auto-generated method stub
		return checkinDao.find(id);
	}

	@Override
	public List<Map> getStatsByMonth() {
		// TODO Auto-generated method stub
		return checkinDao.getStatsByMonth();
	}

	@Override
	public List<Map> getStatsByDay() {
		// TODO Auto-generated method stub
		return checkinDao.getStatsByDay();
	}

	

	
	
	

}
