package cn.jbit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jbit.entity.Announcement;
import cn.jbit.service.OfficeService;

@Controller
public class indexController {
	
	@Autowired
	private OfficeService officeService;
	
	@ResponseBody
	@RequestMapping(value = "/getAnnouncements",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,List<Announcement>> getAnnouncements(Integer pageNO,String title) {
		Map<String, List<Announcement>> map = new HashMap<String, List<Announcement>>();
		List<Announcement> announcements=officeService.getAnnouncements(pageNO,title);
		map.put("data", announcements);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCountAnnouncement",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getCountAnnouncement(String title) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int count=officeService.getCountAnnouncement(title);
		map.put("data", count);
		return map;
	}
}
