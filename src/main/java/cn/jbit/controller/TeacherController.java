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
import cn.jbit.entity.Answer;
import cn.jbit.entity.Course;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;
import cn.jbit.service.TeacherService; 

@RequestMapping("/Teacher")
@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
    @ResponseBody
	@RequestMapping(value = "/login",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,String> login(String account,String password,HttpSession session) { 
    	Map<String, String> map = new HashMap<String, String>();
    	Teacher teacher=teacherService.login(account, password);
    	if(teacher!=null) {
    		System.out.println(teacher.toString());
        	session.setAttribute("teacherUser", teacher);
        	map.put("account", teacher.getTeacherID());
    	}
		return map;
	}
    
    @RequestMapping(value="/showMain",method=RequestMethod.GET)
	public String showStudent_main(HttpSession session,Model model) {
    	Teacher teacher= (Teacher) session.getAttribute("teacherUser");
		model.addAttribute("teacherUser", teacher);
		System.out.println(teacher.toString());
		return "teacher_main";
	}
    
    @ResponseBody
	@RequestMapping(value = "/update",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	public Map<String,Object> update(Teacher teacher,HttpSession session) {
		System.out.println(teacher.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		if(teacherService.updateTeacher(teacher)==0) {
			map.put("success", "修改错误！你填入的信息不符合信息规则");
		}else {
			session.removeAttribute("teacherUser");
			session.setAttribute("teacherUser", teacher);
			map.put("success", "修改成功！");
		} 
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/AddCurriculum",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
    public Map<String, String> AddCurriculum(Curriculum curriculum) {
    	Map<String, String> map = new HashMap<String, String>();
    	System.out.println(curriculum.toString());
    	if(teacherService.AddCurriculum(curriculum)==0) {
			map.put("success", "新增错误！你填入的信息不符合信息规则");
		}else {
			map.put("success", "新增成功！");
			teacherService.updateCourse(curriculum.getCourseId());
		}
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/getCourses",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Course>> getCourses(int pageNO) {
    	Map<String, List<Course>> map = new HashMap<String, List<Course>>();
    	map.put("data", teacherService.getCourses(pageNO));
		return map;
	}

    @ResponseBody
    @RequestMapping(value = "/getCoursesCount",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getCoursesCount() {
    	Map<String,Integer> map = new HashMap<String, Integer>();
    	map.put("data", teacherService.getCoursesCount());
		return map;
	}
    @ResponseBody
    @RequestMapping(value = "/getCourse",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
    public Map<String,Course> getCourse(int id) {
    	Map<String,Course> map = new HashMap<String, Course>();
    	Course course= teacherService.getCourse(id);
    	System.out.println(course.toString());
    	map.put("data",course);
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/getCurriculums",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Curriculum>> getCurriculums(String teacherId,int pageNo) {
    	Map<String, List<Curriculum>> map = new HashMap<String, List<Curriculum>>();
    	map.put("data", teacherService.getCurriculums(teacherId,pageNo));
		return map;
	}
    @ResponseBody
    @RequestMapping(value = "/getCurriculumsCount",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getCurriculumsCount(String teacherId) {
    	Map<String,Integer> map = new HashMap<String, Integer>();
    	map.put("data", teacherService.getCurriculumsCount(teacherId));
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/getQuestions",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Question>> getQuestions(int pageNo,String studentId) {
    	Map<String, List<Question>> map = new HashMap<String, List<Question>>();
    	map.put("data", teacherService.getQuestions(pageNo,studentId));
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/getQuestionsCount",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getQuestionsCount(String studentId) {
    	Map<String,Integer> map = new HashMap<String, Integer>();
    	map.put("data", teacherService.getQuestionsCount(studentId));
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/getAnswers",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String, List<Answer>> getAnswers(int questionid) {
    	Map<String, List<Answer>> map = new HashMap<String, List<Answer>>();
    	map.put("data", teacherService.getAnswers(questionid));
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/getName",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,String> getName(HttpSession session) {
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("data", ((Teacher) session.getAttribute("teacherUser")).getName());
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/Addanswer",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
    public Map<String, String> Addanswer(Answer answer) {
    	Map<String, String> map = new HashMap<String, String>();
    	answer.setAnswertime(new Date());
    	System.out.println(answer.toString());
    	if(teacherService.Addanswer(answer)==0) {
			map.put("success", "评论错误！你填入的信息不符合信息规则");
		}else {
			map.put("success", "评论成功！"); 
		}
		return map;
	}
    
    @ResponseBody
	@RequestMapping(value = "/getCountStudent",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,Integer> getCountStudent() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int count=teacherService.getCountStudent();
		map.put("data", count);
		return map;
	}
    @ResponseBody
	@RequestMapping(value = "/getStudents",method=RequestMethod.GET,produces = "application/json;charset=utf-8")
	public Map<String,List<Student>> getStudents(Integer pageNO) {
		Map<String, List<Student>> map = new HashMap<String, List<Student>>();
		List<Student> data=teacherService.getStudents(pageNO);
		map.put("data", data);
		return map;
	}
    
    @ResponseBody
    @RequestMapping(value = "/Addachievement",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
    public Map<String, String> Addachievement(Achievement achievement,HttpSession session) {
    	Map<String, String> map = new HashMap<String, String>();
    	achievement.setEntryTime(new Date());
    	achievement.setSubject(((Teacher) session.getAttribute("teacherUser")).getCourseName());
    	System.out.println(achievement.toString());
    	if(teacherService.Addachievement(achievement)==0) {
			map.put("success", "录入错误！你填入的信息不符合信息规则");
		}else {
			map.put("success", "录入成功！");
		}
		return map;
	}
}
