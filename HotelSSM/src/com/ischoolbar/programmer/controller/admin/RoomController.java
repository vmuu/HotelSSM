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

import com.ischoolbar.programmer.entity.admin.Room;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.RoomTypeService;
import com.ischoolbar.programmer.service.admin.FloorService;
import com.ischoolbar.programmer.service.admin.RoomService;

/**
 * 房间管理后台控制器
 * @author ymj
 *
 */
@RequestMapping("/admin/room")
@Controller
public class RoomController {
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private FloorService floorService;
	
	/**
	 * 房间管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.addObject("roomTypeList", roomTypeService.findAll());
		model.addObject("floorList", floorService.findAll());
		model.setViewName("room/list");
		return model;
	}
	
	/**
	 * 房间信息添加操作
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Room room){
		Map<String, String> ret = new HashMap<String, String>();
		if(room == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的房间信息!");
			return ret;
		}
		if(StringUtils.isEmpty(room.getSn())){
			ret.put("type", "error");
			ret.put("msg", "房间编号不能为空!");
			return ret;
		}
		if(room.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择房间类型!");
			return ret;
		}
		if(room.getFloorId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择房间所属楼层!");
			return ret;
		}
		if(isExist(room.getSn(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "该房间编号已经存在!");
			return ret;
		}
		if(roomService.add(room) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 房间信息编辑操作
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Room room){
		Map<String, String> ret = new HashMap<String, String>();
		if(room == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的房间信息!");
			return ret;
		}
		if(StringUtils.isEmpty(room.getSn())){
			ret.put("type", "error");
			ret.put("msg", "房间编号不能为空!");
			return ret;
		}
		if(room.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择房间类型!");
			return ret;
		}
		if(room.getFloorId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择房间所属楼层!");
			return ret;
		}
		if(isExist(room.getSn(), room.getId())){
			ret.put("type", "error");
			ret.put("msg", "该房间编号已经存在!");
			return ret;
		}
		if(roomService.edit(room) <= 0){
			ret.put("type", "error");
			ret.put("msg", "修改失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询房间信息
	 * @param sn
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="sn",defaultValue="") String sn,
			@RequestParam(name="status",required=false) Integer status,
			@RequestParam(name="roomTypeId",required=false) Long roomTypeId,
			@RequestParam(name="floorId",required=false) Long floorId,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("sn", sn);
		queryMap.put("status", status);
		queryMap.put("roomTypeId", roomTypeId);
		queryMap.put("floorId", floorId);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", roomService.findList(queryMap));
		ret.put("total", roomService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 房间信息删除操作
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
			if(roomService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该房间下存在订单信息，请先删除该房间下的所有订单信息!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
	/**
	 * 判断房间编号是否存在
	 * @param sn
	 * @param id
	 * @return
	 */
	private boolean isExist(String sn,Long id){
		Room findBySn = roomService.findBySn(sn);
		if(findBySn == null)return false;
		if(findBySn.getId().longValue() == id.longValue())return false;
		return true;
	}
}
