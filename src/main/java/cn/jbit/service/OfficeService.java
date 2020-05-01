package cn.jbit.service;

import java.util.List;

import cn.jbit.entity.Announcement;
import cn.jbit.entity.Classroom;
import cn.jbit.entity.Course;
import cn.jbit.entity.Office;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;

public interface OfficeService {
	public Office login(String account,String password);	
	public int update(Office office);
	public int AddAnnouncement(Announcement announcement);
	public List<Announcement> getAnnouncements(int pageNO,String title);//查询公告
	public int getCountAnnouncement(String title);//查询公告数量
	public List<Student> getStudents(int pageNO);//查询学生
	public List<Teacher> geTeachers(int pageNO);//查询教师
	public int getCountStudent();//查询学生数量
	public int getCountTeachers();//查询教师数量
	public int deleteStudent(int id);
	public int deleteTeachers(int id);
	public int AddStudent(Student student);//新增学生
	public int AddTeachers(Teacher teacher);//新增学生
	public Student getStudent(String account);//查询学生
	public Teacher getTeacher(String account);//查询教师
	public List<Classroom> getClassrooms(int pageNO);
	public int deleteClassrooms(int id);//删除教室
	public int AddClassrooms(Classroom classroom);//删除教室
	public int getClassroomsCount();//查询教室数量
	public int Addcourse(Course course);//新增课程
	public Classroom getClassroom(int id,String className);//查询教室
	public int updateClassrooms(String className);
	public List<Teacher> geTeachersOptions();//查询所有教师
	
}
