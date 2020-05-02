package cn.jbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.jbit.entity.Achievement;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Mustbedone;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;

public interface StudentDao {
	public Student login(@Param("account")String account,@Param("password")String password);//学生登录
	public int update(Student student);//学生修改信息
	public int addquestion(Question question);//提问
	public  List<Curriculum> getCurriculums(@Param("pageNO")int pageNO,@Param("pageSize") int pageSize);//所有课程
	public  int getCurriculumsCount();//数量
	public int UpdateCurriculum(@Param("studentIds")String studentIds,@Param("id")int id);
	public List<Achievement> getAchievements(@Param("pageNO")int pageNO,@Param("pageSize") int pageSize,@Param("id")int id);
	public int getAchievementCount(@Param("id")int id);
	public List<Mustbedone> getMustbedones(@Param("pageNO")int pageNO,@Param("pageSize") int pageSize,@Param("grade")int grade,@Param("className")String className);
	public Student getStudent(@Param("id")int id);
	public int updateAge();
}
