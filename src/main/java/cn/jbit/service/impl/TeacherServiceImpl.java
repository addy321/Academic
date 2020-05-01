package cn.jbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jbit.dao.TeacherDao;
import cn.jbit.entity.Achievement;
import cn.jbit.entity.Answer;
import cn.jbit.entity.Course;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;
import cn.jbit.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherDao teacherDao;
	
	public Teacher login(String account, String password) {
		return teacherDao.login(account, password);
	}

	public int updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		return teacherDao.updateTeacher(teacher);
	}

	public int AddCurriculum(Curriculum curriculum) {
		// TODO Auto-generated method stub
		return teacherDao.AddCurriculum(curriculum);
	}

	public List<Course> getCourses(int pageNO) {
		// TODO Auto-generated method stub
		return teacherDao.getCourses(pageNO*8-8, 8);
	}

	public int getCoursesCount() {
		// TODO Auto-generated method stub
		return teacherDao.getCoursesCount();
	}

	public Course getCourse(int id) {
		// TODO Auto-generated method stub
		return teacherDao.getCourse(id);
	}

	public int updateCourse(int id) {
		// TODO Auto-generated method stub 
		return teacherDao.updateCourse(id);
	}

	public List<Curriculum> getCurriculums(String teacherId, int pageNo) {
		// TODO Auto-generated method stub
		return teacherDao.getCurriculums(teacherId,pageNo*8-8, 8);
	}

	public int getCurriculumsCount(String teacherId) {
		// TODO Auto-generated method stub
		return teacherDao.getCurriculumsCount(teacherId);
	}

	public List<Question> getQuestions(int pageNO,String studentId) {
		// TODO Auto-generated method stub
		return teacherDao.getQuestions(pageNO*3-3, 3,studentId);
	}

	public int getQuestionsCount(String studentId) {
		// TODO Auto-generated method stub
		return teacherDao.getQuestionsCount(studentId);
	}

	public List<Answer> getAnswers(int questionid) {
		// TODO Auto-generated method stub
		return teacherDao.getAnswers(questionid);
	}

	public int Addanswer(Answer answer) {
		// TODO Auto-generated method stub
		return teacherDao.Addanswer(answer);
	}

	public int getCountStudent() {
		// TODO Auto-generated method stub
		return teacherDao.getCountStudent();
	}

	public List<Student> getStudents(int pageNO) {
		// TODO Auto-generated method stub
		return teacherDao.getStudents(pageNO*8-8, 8);
	}

	public int Addachievement(Achievement achievement) {
		// TODO Auto-generated method stub
		return teacherDao.Addachievement(achievement);
	}
}
