package com.ischoolbar.programmer.service;
/**
 * ¿Í»§service
 */
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.Account;

@Service
public interface AccountService {
	public int add(Account account);
	public int edit(Account account);
	public int delete(Long id);
	public List<Account> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public Account find(Long id);
	public Account findByName(String name);
	public List<Account> findAll();
}
