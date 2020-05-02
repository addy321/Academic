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

import cn.jbit.entity.Achievement;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Mustbedone;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;
import cn.jbit.service.StudentService;

@RequestMapping("/Student")
@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@ResponseBody
	@RequestMapping(value = "/login",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,String> login(String account,String password,HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
    	Student student=studentService.login(account, password);
    	if(student!=null) {
        	session.setAttribute("student", student);
        	map.put("account", student.getStudentID());
    	}
		return map;
	}
	@RequestMapping(value="/showMain",method=RequestMethod.GET)
	public String showStudent_main(HttpSession session,Model model) {
		Student student= (Student) session.getAttribute("student");
		model.addAttribute("studentUser", student);
		System.out.println(student.toString());
		return "student_main";
	}
	 
	@ResponseBody
	@RequestMapping(value = "/update",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,Object> update(Student student,HttpSession session) {
		System.out.println(student.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		if(studentService.update(student)==0) {
			map.put("success", "修改错误！你填入的信息不符合信息规则");
		}else {
			session.removeAttribute("student");
			session.setAttribute("student", student);
			map.put("success", "修改成功！");
		} 
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/addquestion",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Object> adduestion(String studentId,String problem) {
		Map<String, Object> map = new HashMap<String, Object>();
		Question question=new Question(null,studentId,problem,new Date());
		System.out.println(question.toString());
		if(studentService.addquestion(question)==0) {
			map.put("success", "提交失败，出现错误！");
		}else {
			map.put("success", "提交成功！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCurriculums",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Curriculum>> getCurriculums(int pageNO) {
		Map<String, List<Curriculum>> map = new HashMap<String, List<Curriculum>>();
		List<Curriculum> list= studentService.getCurriculums(pageNO);
		map.put("data", list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCurriculumsCount",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Integer> getCurriculumsCount() {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("data", studentService.getCurriculumsCount());
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/UpdateCurriculum",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String, String> UpdateCurriculum(String studentIds,int id) {
		Map<String, String> map = new HashMap<String,String>();
		if(studentService.UpdateCurriculum(studentIds,id)==0) {
			map.put("data", "参加失败!");
		}else {
			map.put("data", "参加成功!");
		}
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getAchievements",method=RequestMethod.GET)
	public Map<String, List<Achievement>> getAchievements(int pageNO,int id) {
		Map<String, List<Achievement>> map = new HashMap<String, List<Achievement>>();
		System.err.println(studentService.getAchievements(pageNO,id));
		List<Achievement> list= studentService.getAchievements(pageNO,id);
		map.put("data", list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAchievementCount",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Integer> getAchievementCount(int id) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("data", studentService.getAchievementCount(id));
		return map;
	}
	
	@ResponseBody
    @RequestMapping(value = "/getName",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,String> getName(HttpSession session) {
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("data", ((Student) session.getAttribute("student")).getStudentID());
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getMustbedones",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Mustbedone>> getMustbedones(int pageNO,int grade,String className) {
		Map<String, List<Mustbedone>> map = new HashMap<String, List<Mustbedone>>();
		List<Mustbedone> list= studentService.getMustbedones(pageNO,grade,className);
		map.put("data", list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getStudent",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, Student> getStudent(int id) {
		Map<String, Student> map = new HashMap<String, Student>();
		Student student= studentService.getStudent(id);
		map.put("data", student);
		return map;
	}
	
}
