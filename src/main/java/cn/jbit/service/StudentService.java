package cn.jbit.service;

import java.util.List;

import cn.jbit.entity.Achievement;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Mustbedone;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;

public interface StudentService {
	
	public Student 	login(String account,String password);
	public int update(Student student);
	public int addquestion(Question question);
	public  List<Curriculum> getCurriculums(int pageNO);//所有课程
	public  int getCurriculumsCount();//数量
	public int UpdateCurriculum(String studentIds,int id);
	public List<Achievement> getAchievements(int pageNO,int id);
	public int getAchievementCount(int id);
	public  List<Mustbedone> getMustbedones(int pageNO,int grade,String className);//所有课程
	public Student getStudent(int id);
	public int updateAge();
}
