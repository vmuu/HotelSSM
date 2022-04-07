package com.ischoolbar.programmer.dao;
import java.util.List;
import java.util.Map;


/**
 * ¿Í»§dao
 */
import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.Account;

@Repository
public interface AccountDao {
	public int add(Account account);
	public int edit(Account account);
	public int delete(Long id);
	public List<Account> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public Account find(Long id);
	public Account findByName(String name);
	public List<Account> findAll();
}
