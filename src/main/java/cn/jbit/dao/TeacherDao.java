package cn.jbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.jbit.entity.Achievement;
import cn.jbit.entity.Answer;
import cn.jbit.entity.Course;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Mustbedone;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;

public interface TeacherDao {
	public Teacher login(@Param("account")String account,@Param("password")String password);//教师登录
	public int updateTeacher(Teacher teacher);//修改信息
	public List<Course> getCourses(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize);//查询课程
	public int getCoursesCount();//查询课程数量
	public int AddCurriculum(Curriculum curriculum);//添加课表
	public Course getCourse(@Param("id")int id);
	public int updateCourse(@Param("id")int id);//修改状态
	public List<Curriculum> getCurriculums(@Param("teacherId")String teacherId,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询已申请课程
	public int getCurriculumsCount(@Param("teacherId")String teacherId);
	public List<Question> getQuestions(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize,@Param("studentId")String studentId);
	public int getQuestionsCount(@Param("studentId")String studentId);
	public List<Answer> getAnswers(@Param("questionid")int questionid);
	public int Addanswer(Answer answer);
	public List<Student> getStudents(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize);//查询学生
	public int getCountStudent();//查询学生数量
	public int Addachievement(Achievement achievement);//添加成绩
	public List<Mustbedone> getMustbedones(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize);//查询必修课程
	public int getMustbedonesCount();
}
