package cn.jbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jbit.dao.OfficeDao;
import cn.jbit.entity.Announcement;
import cn.jbit.entity.Classroom;
import cn.jbit.entity.Course;
import cn.jbit.entity.Office;
import cn.jbit.entity.Student;
import cn.jbit.entity.Teacher;
import cn.jbit.service.OfficeService;

@Service
public class OfficeServiceImpl implements OfficeService {

	@Autowired
	private OfficeDao officeDao;
	
	public Office login(String account, String password) {
		// TODO Auto-generated method stub
		return officeDao.login(account, password);
	}

	public int update(Office office) {
		// TODO Auto-generated method stub
		return officeDao.update(office);
	}

	public int AddAnnouncement(Announcement announcement) {
		// TODO Auto-generated method stub
		return officeDao.AddAnnouncement(announcement);
	}

	public List<Announcement> getAnnouncements(int pageNO,String title) {
		return officeDao.getAnnouncements(pageNO*8-8, 8,title);
	}

	public int getCountAnnouncement(String title) {
		// TODO Auto-generated method stub
		return officeDao.getCountAnnouncement(title);
	}

	public List<Student> getStudents(int pageNO) {
		// TODO Auto-generated method stub
		return officeDao.getStudents(pageNO*8-8, 8);
	}

	public List<Teacher> geTeachers(int pageNO) {
		// TODO Auto-generated method stub
		return officeDao.geTeachers(pageNO*8-8, 8);
	}

	public int getCountStudent() {
		// TODO Auto-generated method stub
		return officeDao.getCountStudent();
	}

	public int getCountTeachers() {
		// TODO Auto-generated method stub
		return officeDao.getCountTeachers();
	}

	public int deleteStudent(int id) {
		// TODO Auto-generated method stub
		return officeDao.deleteStudent(id);
	}

	public int deleteTeachers(int id) {
		// TODO Auto-generated method stub
		return officeDao.deleteTeachers(id);
	}

	public int AddStudent(Student student) {
		// TODO Auto-generated method stub
		return officeDao.AddStudent(student);
	}

	public int AddTeachers(Teacher teacher) {
		// TODO Auto-generated method stub
		return officeDao.AddTeachers(teacher);
	}

	public Student getStudent(String account) {
		// TODO Auto-generated method stub
		return officeDao.getStudent(account);
	}

	public Teacher getTeacher(String account) {
		// TODO Auto-generated method stub
		return officeDao.getTeacher(account);
	}

	public List<Classroom> getClassrooms(int pageNO) {
		// TODO Auto-generated method stub
		return officeDao.getClassrooms(pageNO*8-8, 8);
	}

	public int deleteClassrooms(int id) {
		// TODO Auto-generated method stub
		return officeDao.deleteClassrooms(id);
	}

	public int AddClassrooms(Classroom classroom) {
		// TODO Auto-generated method stub
		return officeDao.AddClassrooms(classroom);
	}

	public int getClassroomsCount() {
		// TODO Auto-generated method stub
		return officeDao.getClassroomsCount();
	}

	public int Addcourse(Course course) {
		// TODO Auto-generated method stub
		return officeDao.Addcourse(course);
	}
 

	public Classroom getClassroom(int id,String className) {
		// TODO Auto-generated method stub
		return officeDao.getClassroom(id,className);
	}

	public int updateClassrooms(String className) {
		// TODO Auto-generated method stub
		return officeDao.updateClassrooms(className);
	}

	public List<Teacher> geTeachersOptions() {
		// TODO Auto-generated method stub
		return officeDao.geTeachersOptions();
	}
}
