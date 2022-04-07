package com.ischoolbar.programmer.controller.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.BookOrder;
import com.ischoolbar.programmer.entity.RoomType;
import com.ischoolbar.programmer.entity.admin.Checkin;
import com.ischoolbar.programmer.entity.admin.Room;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.BookOrderService;
import com.ischoolbar.programmer.service.RoomTypeService;
import com.ischoolbar.programmer.service.admin.CheckinService;
import com.ischoolbar.programmer.service.admin.RoomService;

/**
 * 入住管理后台控制器
 * @author ymj
 *
 */
@RequestMapping("/admin/checkin")
@Controller
public class CheckinController {
	
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private BookOrderService bookOrderService;
	@Autowired
	private CheckinService checkinService;
	
	/**
	 * 入住管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.addObject("roomTypeList", roomTypeService.findAll());
		model.addObject("roomList", roomService.findAll());
		model.setViewName("checkin/list");
		return model;
	}
	
	/**
	 * 入住信息添加操作
	 * @param checkin
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Checkin checkin,
			@RequestParam(name="bookOrderId",required=false) Long bookOrderId
			){
		Map<String, String> ret = new HashMap<String, String>();
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的入住信息!");
			return ret;
		}
		if(checkin.getRoomId() == null){
			ret.put("type", "error");
			ret.put("msg", "房间不能为空!");
			return ret;
		}
		if(checkin.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "房型不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getName())){
			ret.put("type", "error");
			ret.put("msg", "入住联系人名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "入住联系人手机号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getIdCard())){
			ret.put("type", "error");
			ret.put("msg", "联系人身份证号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "到达时间不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getLeaveDate())){
			ret.put("type", "error");
			ret.put("msg", "离店时间不能为空!");
			return ret;
		}
		checkin.setCreateTime(new Date());
		if(checkinService.add(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		RoomType roomType = roomTypeService.find(checkin.getRoomTypeId());
		
		if(bookOrderId != null){
			//从预定来的入住单(入住既可以是直接入住也可以是已经预定的人来入住)
			BookOrder bookOrder = bookOrderService.find(bookOrderId);
			bookOrder.setStatus(1);
			bookOrderService.edit(bookOrder);
			//roomType.setBookNum(roomType.getBookNum() - 1);//预定数减1
		}else{
			roomType.setAvilableNum(roomType.getAvilableNum() - 1);
		}
		//入住成功后去修改该房型的预定数
		if(roomType != null){
			roomType.setLivedNum(roomType.getLivedNum() + 1);//入住数加1
			roomTypeService.updateNum(roomType);
			//如果可用的房间数为0，则设置该房型状态已满
			if(roomType.getAvilableNum() == 0){
				roomType.setStatus(0);
				roomTypeService.edit(roomType);
			}
		}
		Room room = roomService.find(checkin.getRoomId());
		if(room != null){
			//要把房间状态设置为已入住
			room.setStatus(1);
			roomService.edit(room);
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 入住信息编辑操作
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Checkin checkin,
			@RequestParam(name="bookOrderId",required=false) Long bookOrderId
			){
		Map<String, String> ret = new HashMap<String, String>();
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的入住信息!");
			return ret;
		}
		if(checkin.getRoomId() == null){
			ret.put("type", "error");
			ret.put("msg", "房间不能为空!");
			return ret;
		}
		if(checkin.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "房型不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getName())){
			ret.put("type", "error");
			ret.put("msg", "入住联系人名称不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "入住联系人手机号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getIdCard())){
			ret.put("type", "error");
			ret.put("msg", "联系人身份证号不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "到达时间不能为空!");
			return ret;
		}
		if(StringUtils.isEmpty(checkin.getLeaveDate())){
			ret.put("type", "error");
			ret.put("msg", "离店时间不能为空!");
			return ret;
		}
		Checkin existCheckin = checkinService.find(checkin.getId());
		if(existCheckin == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的入住信息进行编辑!");
			return ret;
		}
		if(checkinService.edit(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		//编辑成功之后：1：判断房型是否发生变化，2：判断房间是否发生变化，3：判断是否是从预定订单来的信息
		//首先判断是否是从预定来的入住信息
		RoomType oldRoomType = roomTypeService.find(existCheckin.getRoomTypeId());
		RoomType newRoomType = roomTypeService.find(checkin.getRoomTypeId());
		
		//房型入住数不收预定订单的影响
		if(oldRoomType.getId().longValue() != newRoomType.getId().longValue()){
			//说明房型发生了变化，原来的房型入住数恢复，新的房型入住数增加
			oldRoomType.setLivedNum(oldRoomType.getLivedNum() - 1);
			newRoomType.setLivedNum(newRoomType.getLivedNum() + 1);
			if(bookOrderId == null){
				oldRoomType.setAvilableNum(oldRoomType.getAvilableNum() + 1);
				newRoomType.setAvilableNum(newRoomType.getAvilableNum() - 1);
			}
		}
		/**
		if(bookOrderId == null){
			//表示不是从预定订单来的，此时需判断原来的入住信息是否来源于预定
			if(existCheckin.getBookOrderId() == null){
				oldRoomType.setAvilableNum(oldRoomType.getAvilableNum() + 1);
				newRoomType.setAvilableNum(newRoomType.getAvilableNum() - 1);
			}
			if(existCheckin.getBookOrderId() != null){
				//表示原来的入住信息来源于预定，但是新的入住信息不是来源于预定,需恢复原来的预定状态
				BookOrder oldBookOrder = bookOrderService.find(existCheckin.getBookOrderId());
				oldBookOrder.setStatus(0);
				bookOrderService.edit(oldBookOrder);
				oldRoomType.setBookNum(oldRoomType.getBookNum() + 1);
			}
		}
		//表示此时的订单是来源于预定
		if(bookOrderId != null){
			//表示是从预定订单来的，此时需判断原来的入住信息是否来源于预定
			if(existCheckin.getBookOrderId() != null){
				//表示原来的入住信息来源于预定，但是新的入住信息不是来源于预定,需恢复原来的预定状态
				BookOrder oldBookOrder = bookOrderService.find(existCheckin.getBookOrderId());
				if(bookOrderId.longValue() != oldBookOrder.getId().longValue()){
					oldBookOrder.setStatus(0);
					bookOrderService.edit(oldBookOrder);
					//oldRoomType.setBookNum(oldRoomType.getBookNum() + 1);
				}
			}
			if(oldRoomType.getId().longValue() != newRoomType.getId().longValue()){
				newRoomType.setBookNum(newRoomType.getBookNum() - 1);
				
				if(existCheckin.getBookOrderId() == null){
					oldRoomType.setAvilableNum(oldRoomType.getAvilableNum() + 1);
				}else{
					oldRoomType.setBookNum(oldRoomType.getBookNum() + 1);
				}
			}
			BookOrder newBookOrder = bookOrderService.find(bookOrderId);
			newBookOrder.setStatus(1);
			bookOrderService.edit(newBookOrder);
		}**/
		roomTypeService.updateNum(newRoomType);
		roomTypeService.updateNum(oldRoomType);
		//判断房间是否发生变化
		if(checkin.getRoomId().longValue() != existCheckin.getRoomId().longValue()){
			//表示房间发生了变化
			Room oldRoom = roomService.find(existCheckin.getRoomId());
			Room newRoom = roomService.find(checkin.getRoomId());
			oldRoom.setStatus(0);//原来的房间可入住
			newRoom.setStatus(1);//现在的房间已入住
			roomService.edit(newRoom);
			roomService.edit(oldRoom);
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询入住信息
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="roomId",defaultValue="") Long roomId,
			@RequestParam(name="roomTypeId",defaultValue="") Long roomTypeId,
			@RequestParam(name="idCard",defaultValue="") String idCard,
			@RequestParam(name="mobile",defaultValue="") String mobile,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("roomId", roomId);
		queryMap.put("roomTypeId", roomTypeId);
		queryMap.put("idCard", idCard);
		queryMap.put("mobile", mobile);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", checkinService.findList(queryMap));
		ret.put("total", checkinService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 退房操作
	 * @param checkId
	 * @return
	 */
	@RequestMapping(value="/checkout",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> checkout(Long checkId
			){
		Map<String, String> ret = new HashMap<String, String>();
		if(checkId == null){
			ret.put("type", "error");
			ret.put("msg", "请选择数据!");
			return ret;
		}
		Checkin checkin = checkinService.find(checkId);
		if(checkin == null){
			ret.put("type", "error");
			ret.put("msg", "请选择正确的数据!");
			return ret;
		}
		checkin.setStatus(1);
		if(checkinService.edit(checkin) <= 0){
			ret.put("type", "error");
			ret.put("msg", "退房失败，请联系管理员!");
			return ret;
		}
		//首先操作房间状态
		Room room = roomService.find(checkin.getRoomId());
		if(room != null){
			room.setStatus(2);
			roomService.edit(room);
		}
		//其次修改房型可用数、入住数、状态
		RoomType roomType = roomTypeService.find(checkin.getRoomTypeId());
		if(roomType != null){
			roomType.setAvilableNum(roomType.getAvilableNum() + 1);
			if(roomType.getAvilableNum() > roomType.getRoomNum()){
				roomType.setAvilableNum(roomType.getRoomNum());
			}
			roomType.setLivedNum(roomType.getLivedNum() - 1);
			if(roomType.getStatus() == 0){
				roomType.setStatus(1);
			}
			if(checkin.getBookOrderId() != null){
				roomType.setBookNum(roomType.getBookNum() - 1);
			}
			roomTypeService.updateNum(roomType);
			roomTypeService.edit(roomType);
		}
		//判断是否来自预定
		if(checkin.getBookOrderId() != null){
			BookOrder bookOrder = bookOrderService.find(checkin.getBookOrderId());
			bookOrder.setStatus(2);
			bookOrderService.edit(bookOrder);
			
		}
		ret.put("type", "success");
		ret.put("msg", "退房成功!");
		return ret;
	}
	
	/**
	 * 根据房间类型获取房间
	 * @param roomTypeId
	 * @return
	 */
	@RequestMapping(value="/load_room_list",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> load_room_list(Long roomTypeId){
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("roomTypeId", roomTypeId);
		queryMap.put("status", 0);
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		List<Room> roomList = roomService.findList(queryMap);
		for(Room room:roomList){
			Map<String, Object> option = new HashMap<String, Object>();
			option.put("value", room.getId());
			option.put("text", room.getSn());
			retList.add(option);
		}
		return retList;
	}
}
