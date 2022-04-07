package com.ischoolbar.programmer.dao;
import java.util.List;
import java.util.Map;

/**
 * Ô¤¶¨¶©µ¥dao
 */
import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.BookOrder;

@Repository
public interface BookOrderDao {
	public int add(BookOrder bookOrder);
	public int edit(BookOrder bookOrder);
	public int delete(Long id);
	public List<BookOrder> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public BookOrder find(Long id);
}
