package com.ischoolbar.programmer.controller.home;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.Account;
import com.ischoolbar.programmer.entity.BookOrder;
import com.ischoolbar.programmer.entity.RoomType;
import com.ischoolbar.programmer.service.AccountService;
import com.ischoolbar.programmer.service.BookOrderService;
import com.ischoolbar.programmer.service.RoomTypeService;

/**
 * 前台用户控制器
 * @author ymj
 *
 */
@RequestMapping("/home/account")
@Controller
public class HomeAccountController {
	
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private BookOrderService bookOrderService;
	
	/**
	 * 前台用户中心首页
	 * @param model
	 * @param name
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model,HttpServletRequest request
			){
		Account account = (Account)request.getSession().getAttribute("account");
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("accountId", account.getId());
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		model.addObject("bookOrderList", bookOrderService.findList(queryMap));
		model.addObject("roomTypeList", roomTypeService.findAll());
		model.setViewName("home/account/index");
		return model;
	}
	
	/**
	 * 预定房间页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/book_order",method=RequestMethod.GET)
	public ModelAndView bookOrder(ModelAndView model,Long roomTypeId
			){
		model.addObject("roomType", roomTypeService.find(roomTypeId));
		model.setViewName("home/account/book_order");
		return model;
	}
	
	
	/**
	 * 预定信息提交
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/book_order",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> bookOrderAct(BookOrder bookOrder,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的预定订单信息!");
			return ret;
		}
		Account account = (Account)request.getSession().getAttribute("account");
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "客户不能为空!");
			return ret;
		}
		bookOrder.setAccountId(account.getId());
		if(bookOrder.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "房型不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "预定订单联系人名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "预定订单联系人手机号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getIdCard())){
			ret.put("type", "error");
			ret.put("msg", "联系人身份证号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "到达时间不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getLeaveDate())){
			ret.put("type", "error");
			ret.put("msg", "离店时间不能为空!");
			return ret;
		}
		bookOrder.setCreateTime(new Date());
		bookOrder.setStatus(0);
		if(bookOrderService.add(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		RoomType roomType = roomTypeService.find(bookOrder.getRoomTypeId());
		//预定成功后去修改该房型的预定数
		if(roomType != null){
			roomType.setBookNum(roomType.getBookNum() + 1);
			roomType.setAvilableNum(roomType.getAvilableNum() - 1);
			roomTypeService.updateNum(roomType);
			//如果可用的房间数为0，则设置该房型状态已满
			if(roomType.getAvilableNum() == 0){
				roomType.setStatus(0);
				roomTypeService.edit(roomType);
			}
		}
		ret.put("type", "success");
		ret.put("msg", "预定成功!");
		return ret;
	}
	
	/**
	 * 修改个人信息提交
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/update_info",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> updateInfoAct(Account account,HttpServletRequest request){
		Map<String,String> retMap = new HashMap<String, String>();
		if(account == null){
			retMap.put("type", "error");
			retMap.put("msg", "请填写正确的用户信息！");
			return retMap;
		}
		if(StringUtils.isEmpty(account.getName())){
			retMap.put("type", "error");
			retMap.put("msg", "用户名不能为空！");
			return retMap;
		}
		Account loginedAccount = (Account)request.getSession().getAttribute("account");
		if(isExist(account.getName(),loginedAccount.getId())){
			retMap.put("type", "error");
			retMap.put("msg", "该用户名已经存在！");
			return retMap;
		}
		loginedAccount.setAddress(account.getAddress());
		loginedAccount.setIdCard(account.getIdCard());
		loginedAccount.setMobile(account.getMobile());
		loginedAccount.setName(account.getName());
		loginedAccount.setRealName(account.getRealName());
		if(accountService.edit(loginedAccount) <= 0){
			retMap.put("type", "error");
			retMap.put("msg", "修改失败，请联系管理员！");
			return retMap;
		}
		request.getSession().setAttribute("account", loginedAccount);
		retMap.put("type", "success");
		retMap.put("msg", "修改成功！");
		return retMap;
	}
	
	/**
	 * 修改密码提交
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/update_pwd",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> updatePwdAct(String oldPassword,String newPassword,HttpServletRequest request){
		Map<String,String> retMap = new HashMap<String, String>();
		if(StringUtils.isEmpty(oldPassword)){
			retMap.put("type", "error");
			retMap.put("msg", "请填写原来的密码！");
			return retMap;
		}
		if(StringUtils.isEmpty(newPassword)){
			retMap.put("type", "error");
			retMap.put("msg", "请填写新密码！");
			return retMap;
		}
		Account loginedAccount = (Account)request.getSession().getAttribute("account");
		if(!oldPassword.equals(loginedAccount.getPassword())){
			retMap.put("type", "error");
			retMap.put("msg", "原密码错误！");
			return retMap;
		}
		loginedAccount.setPassword(newPassword);
		if(accountService.edit(loginedAccount) <= 0){
			retMap.put("type", "error");
			retMap.put("msg", "修改失败，请联系管理员！");
			return retMap;
		}
		retMap.put("type", "success");
		retMap.put("msg", "修改密码成功！");
		return retMap;
	}
	
	/**
	 * 判断用户是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	private boolean isExist(String name,Long id){
		Account account = accountService.findByName(name);
		if(account == null)return false;
		if(account != null && account.getId().longValue() == id)return false;
		return true;
	}
}
