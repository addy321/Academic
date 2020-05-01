package cn.jbit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jbit.entity.Announcement;
import cn.jbit.entity.Classroom;
import cn.jbit.entity.Course;
import cn.jbit.entity.Office;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;
import cn.jbit.service.OfficeService;

@Controller
@RequestMapping("/office")
public class officeController {

	@Autowired
	private OfficeService officeService;
	
	@ResponseBody
	@RequestMapping(value = "/login",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,String> login(String account,String password,HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
    	Office office=officeService.login(account, password);
    	if(office!=null) {
        	session.setAttribute("Office", office);
        	map.put("account", office.getOfficeId());
    	}
		return map;
	}
	@RequestMapping(value="/showMain",method=RequestMethod.GET)
	public String showOffice_main(HttpSession session,Model model) {
		Office office= (Office) session.getAttribute("Office");
		model.addAttribute("OfficeUser", office);
		System.out.println(office.toString());
		return "office_main";
	}
	 
	@ResponseBody
	@RequestMapping(value = "/update",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,Object> update(Office office,HttpSession session) {
		System.out.println(office.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		if(officeService.update(office)==0) {
			map.put("success", "修改错误！你填入的信息不符合信息规则");
		}else {
			session.removeAttribute("Office");
			session.setAttribute("Office", office);
			map.put("success", "修改成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/AddAnnouncement",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,Object> AddAnnouncement(Announcement announcement) {
		announcement.setReleaseTime(new Date());
		announcement.setFrequency(0);
		Map<String, Object> map = new HashMap<String, Object>();
		if(officeService.AddAnnouncement(announcement)==0) {
			map.put("success", "新增错误！你填入的信息不符合信息规则");
		}else {
			map.put("success", "新增成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getStudents",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,List<Student>> getStudents(Integer pageNO) {
		Map<String, List<Student>> map = new HashMap<String, List<Student>>();
		List<Student> data=officeService.getStudents(pageNO);
		map.put("data", data);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/geTeachers",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,List<Teacher>> geTeachers(Integer pageNO) {
		Map<String, List<Teacher>> map = new HashMap<String, List<Teacher>>();
		List<Teacher> data=officeService.geTeachers(pageNO);
		map.put("data", data);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/getCountStudent",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getCountStudent() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int count=officeService.getCountStudent();
		map.put("data", count);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/getCountTeachers",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getCountTeachers() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int count=officeService.getCountTeachers();
		map.put("data", count);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteStudent",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> deleteStudent(int id){
		Map<String, String> map = new HashMap<String, String>();
		if(officeService.deleteStudent(id)==0) {
			map.put("data", "删除失败！");
		}else {
			map.put("data", "删除成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteTeachers",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> deleteTeachers(int id){
		Map<String, String> map = new HashMap<String, String>();
		if(officeService.deleteTeachers(id)==0) {
			map.put("data", "删除失败！");
		}else {
			map.put("data", "删除成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/AddStudent",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> AddStudent(Student student){
		System.out.println(student.toString());
		Map<String, String> map = new HashMap<String, String>();
		if(officeService.AddStudent(student)==0) {
			map.put("data", "新增失败！");
		}else {
			map.put("data", "新增成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/AddTeachers",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> AddTeachers(Teacher teacher){
		System.out.println(teacher.toString());
		Map<String, String> map = new HashMap<String, String>();
		if(officeService.AddTeachers(teacher)==0) {
			map.put("data", "新增失败！");
		}else {
			map.put("data", "新增成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getStudent",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Boolean> getStudent(String account){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(officeService.getStudent(account)!=null) {
			map.put("data", false);
		}else {
			map.put("data", true);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getTeacher",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Boolean> getTeacher(String account){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(officeService.getTeacher(account)!=null) {
			map.put("data", false);
		}else {
			map.put("data", true);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getClassrooms",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Classroom>> getClassrooms(int pageNO){
		Map<String, List<Classroom>> map = new HashMap<String, List<Classroom>>();
		List<Classroom> list=officeService.getClassrooms(pageNO);
		map.put("data", list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteClassrooms",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> deleteClassrooms(int id) {
		Map<String, String> map = new HashMap<String, String>();
		if(officeService.deleteClassrooms(id)==0) {
			map.put("data", "删除失败！");
		}else {
			map.put("data", "删除成功！");
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/AddClassrooms",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> AddClassrooms(Classroom classroom) {
		Map<String, String> map = new HashMap<String, String>();
		if(officeService.AddClassrooms(classroom)==0) {
			map.put("data", "新增失败！");
		}else {
			map.put("data", "新增成功！");
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/getClassroomsCount",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Integer> getClassroomsCount() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("data", officeService.getClassroomsCount());
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/Addcourse",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> Addcourse(Course course) {
		System.out.println(course.toString());
		course.setCourseStatus(0);
		course.setUploadtime(new Date());
		System.out.println(course.toString());
		Map<String, String> map = new HashMap<String, String>(); 
		if(officeService.Addcourse(course)==0) {
			map.put("data", "新增失败！");
		}else {
			System.out.println(course.getClassroomId());
			System.out.println(officeService.updateClassrooms(course.getClassroomId())==1?"修改状态成功":"修改状态失败!");
			map.put("data", "新增成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getClassroom",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Classroom> getClassroom(int id,String className) {
		System.out.println("------------"+id);
		Map<String, Classroom> map = new HashMap<String, Classroom>(); 
		Classroom classroom=officeService.getClassroom(id,className);
		if(classroom!=null)
		System.out.println(classroom.toString());
		map.put("data", classroom);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/geTeachersOptions",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Teacher>> geTeachersOptions() { 
		Map<String, List<Teacher>> map = new HashMap<String, List<Teacher>>(); 
		List<Teacher> listTeacher=officeService.geTeachersOptions();
		map.put("data", listTeacher);
		return map;
	}
}
