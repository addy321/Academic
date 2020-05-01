package cn.jbit.service;

import java.util.List;

import cn.jbit.entity.Achievement;
import cn.jbit.entity.Answer;
import cn.jbit.entity.Course;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;

public interface TeacherService {
	public Teacher login(String account,String password);
	public int updateTeacher(Teacher teacher);
	public List<Course> getCourses(int pageNO);//查询课程
	public int getCoursesCount();//查询课程数量
	public int AddCurriculum(Curriculum curriculum);//添加课表
	public Course getCourse(int id);//获取课程信息
	public int updateCourse(int id);//修改状态
	public List<Curriculum> getCurriculums(String teacherId,int pageNo);
	public int getCurriculumsCount(String teacherId);
	public List<Question> getQuestions(int pageNO,String studentId);
	public int getQuestionsCount(String studentId);
	public List<Answer> getAnswers(int questionid);
	public int Addanswer(Answer answer);
	public int getCountStudent();//查询学生数量
	public List<Student> getStudents(int pageNO);//查询学生
	public int Addachievement(Achievement achievement);
}
