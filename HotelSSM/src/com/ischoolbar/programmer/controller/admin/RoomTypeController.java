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

import com.ischoolbar.programmer.entity.RoomType;
import com.ischoolbar.programmer.entity.admin.Floor;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.RoomTypeService;
import com.ischoolbar.programmer.service.admin.FloorService;

/**
 * 房间类型管理后台控制器
 * @author ymj
 *
 */
@RequestMapping("/admin/room_type")
@Controller
public class RoomTypeController {
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	
	/**
	 * 房间类型管理列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("room_type/list");
		return model;
	}
	
	/**
	 * 房间类型信息添加操作
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(RoomType roomType){
		Map<String, String> ret = new HashMap<String, String>();
		if(roomType == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的房间类型信息!");
			return ret;
		}
		if(StringUtils.isEmpty(roomType.getName())){
			ret.put("type", "error");
			ret.put("msg", "房间类型名称不能为空!");
			return ret;
		}
		roomType.setAvilableNum(roomType.getRoomNum());//默认房间数等于可用房间数
		roomType.setBookNum(0);//设置预定数0
		roomType.setLivedNum(0);//设置已入住数0
		if(roomTypeService.add(roomType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 房间类型信息编辑操作
	 * @param roomType
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(RoomType roomType){
		Map<String, String> ret = new HashMap<String, String>();
		if(roomType == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的房间类型信息!");
			return ret;
		}
		if(StringUtils.isEmpty(roomType.getName())){
			ret.put("type", "error");
			ret.put("msg", "房间类型名称不能为空!");
			return ret;
		}
		RoomType existRoomType = roomTypeService.find(roomType.getId());
		if(existRoomType == null){
			ret.put("type", "error");
			ret.put("msg", "未找到该数据!");
			return ret;
		}
		int offset = roomType.getRoomNum() - existRoomType.getRoomNum();
		roomType.setAvilableNum(existRoomType.getAvilableNum() + offset);
		if(roomType.getAvilableNum() <= 0){
			roomType.setAvilableNum(0);//没有可用房间
			roomType.setStatus(0);//房型已满
			if(roomType.getAvilableNum() + existRoomType.getLivedNum() + existRoomType.getBookNum() > roomType.getRoomNum()){
				ret.put("type", "error");
				ret.put("msg", "房间数设置不合理!");
				return ret;
			}
		}
		if(roomTypeService.edit(roomType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "修改失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "修改成功!");
		return ret;
	}
	
	/**
	 * 分页查询房间类型信息
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", roomTypeService.findList(queryMap));
		ret.put("total", roomTypeService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 房间类型信息删除操作
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
			if(roomTypeService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该房间类型下存在房间信息，请先删除该房间类型下的所有房间信息!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
}
