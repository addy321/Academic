package cn.jbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.jbit.entity.Announcement;
import cn.jbit.entity.Classroom;
import cn.jbit.entity.Course;
import cn.jbit.entity.Mustbedone;
import cn.jbit.entity.Office;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;

public interface OfficeDao {
	public Office login(@Param("account")String account,@Param("password")String password);	//登录
	public int update(Office office);//修改信息
	public int AddAnnouncement(Announcement announcement);//新增公告
	public List<Announcement> getAnnouncements(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize,@Param("title")String title);//查询公告
	public int getCountAnnouncement(@Param("title")String title);//查询公告数量
	public int getCountStudent();//查询学生数量
	public int getCountTeachers();//查询教师数量
	public List<Student> getStudents(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize);//查询学生
	public List<Teacher> geTeachers(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize);//查询教师
	public int deleteStudent(@Param("id")int id);//删除学生
	public int deleteTeachers(@Param("id")int id);//删除教师
	public int AddStudent(Student student);//新增学生
	public int AddTeachers(Teacher teacher);//新增学生
	public Student getStudent(@Param("account")String account);//查询学生
	public Teacher getTeacher(@Param("account")String account);//查询教师
	public List<Classroom> getClassrooms(@Param("pageNO")int pageNO,@Param("pagesize") int pagesize);//查询教室
	public int deleteClassrooms(@Param("id")int id);//删除教室
	public int AddClassrooms(Classroom classroom);//删除教室
	public int getClassroomsCount();//查询教室数量
	public int Addcourse(Course course);//新增课程
	public int updateClassrooms(@Param("className")String className);//修改教室状态
	public Classroom getClassroom(@Param("id")int id,@Param("className")String className);//查询教室
	public List<Teacher> geTeachersOptions();//查询所有教师
	public int AddMustbedone(Mustbedone mustbedone);//添加必修课
} 
