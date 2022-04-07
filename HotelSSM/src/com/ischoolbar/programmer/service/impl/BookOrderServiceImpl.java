package com.ischoolbar.programmer.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.BookOrderDao;
import com.ischoolbar.programmer.entity.BookOrder;
import com.ischoolbar.programmer.service.BookOrderService;
@Service
public class BookOrderServiceImpl implements BookOrderService {

	@Autowired
	private BookOrderDao bookOrderDao;

	@Override
	public int add(BookOrder bookOrder) {
		// TODO Auto-generated method stub
		return bookOrderDao.add(bookOrder);
	}

	@Override
	public int edit(BookOrder bookOrder) {
		// TODO Auto-generated method stub
		return bookOrderDao.edit(bookOrder);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return bookOrderDao.delete(id);
	}

	@Override
	public List<BookOrder> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return bookOrderDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return bookOrderDao.getTotal(queryMap);
	}

	@Override
	public BookOrder find(Long id) {
		// TODO Auto-generated method stub
		return bookOrderDao.find(id);
	}

	
	
	

}
