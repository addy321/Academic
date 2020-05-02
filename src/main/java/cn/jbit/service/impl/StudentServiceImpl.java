package cn.jbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jbit.dao.StudentDao;
import cn.jbit.entity.Achievement;
import cn.jbit.entity.Curriculum;
import cn.jbit.entity.Mustbedone;
import cn.jbit.entity.Question;
import cn.jbit.entity.Student;
import cn.jbit.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;
	
	public Student login(String account, String password) {
		return studentDao.login(account, password);
	}

	public int update(Student student) {
		return studentDao.update(student);
	}

	public int addquestion(Question question) {
		return studentDao.addquestion(question);
	}

	public List<Curriculum> getCurriculums(int pageNO) {
		// TODO Auto-generated method stub
		return studentDao.getCurriculums(pageNO*8-8,8);
	}

	public int getCurriculumsCount() {
		// TODO Auto-generated method stub
		return studentDao.getCurriculumsCount();
	}

	public int UpdateCurriculum(String studentIds,int id) {
		// TODO Auto-generated method stub
		return studentDao.UpdateCurriculum(studentIds,id);
	}

	public List<Achievement> getAchievements(int pageNO, int id) {
		// TODO Auto-generated method stub
		return studentDao.getAchievements(pageNO*8-8,8,id);
	}

	public int getAchievementCount(int id) {
		// TODO Auto-generated method stub
		return studentDao.getAchievementCount(id);
	}

	public List<Mustbedone> getMustbedones(int pageNO, int grade, String className) {
		// TODO Auto-generated method stub
		return studentDao.getMustbedones(pageNO*8-8, 8, grade,className);
	}

	public Student getStudent(int id) {
		// TODO Auto-generated method stub
		return studentDao.getStudent(id);
	}

	public int updateAge() {
		while(true) { 
            try {
            	studentDao.updateAge();
                Thread.sleep(3000);// 主线程每隔3秒钟
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
	}

}
