package com.ischoolbar.programmer.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.Account;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.AccountService;

/**
 * 客户管理后台控制器
 * @author ymj
 *
 */
@RequestMapping("/admin/account")
@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	
	/**
	 * 客户管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("account/list");
		return model;
	}
	
	/**
	 * 客户信息添加操作
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Account account){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的客户信息!");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("type", "error");
			ret.put("msg", "客户名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "客户密码不能为空!");
			return ret;
		}
		if(isExist(account.getName(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "该用户名已经存在!");
			return ret;
		}
		if(accountService.add(account) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 客户信息编辑操作
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Account account){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的客户信息!");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("type", "error");
			ret.put("msg", "客户名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "客户密码不能为空!");
			return ret;
		}
		if(isExist(account.getName(), account.getId())){
			ret.put("type", "error");
			ret.put("msg", "该用户名已经存在!");
			return ret;
		}
		if(accountService.edit(account) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询客户信息
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="realName",defaultValue="") String realName,
			@RequestParam(name="idCard",defaultValue="") String idCard,
			@RequestParam(name="mobile",defaultValue="") String mobile,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("realName", realName);
		queryMap.put("idCard", idCard);
		queryMap.put("mobile", mobile);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", accountService.findList(queryMap));
		ret.put("total", accountService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 客户信息删除操作
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的信息!");
			return ret;
		}
		try {
			if(accountService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该客户下存在订单信息，请先删除该客户下的所有订单信息!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
	/**
	 * 判断用户名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	private boolean isExist(String name,Long id){
		Account findByName = accountService.findByName(name);
		if(findByName == null)return false;
		if(findByName.getId().longValue() == id.longValue())return false;
		return true;
	}
}
