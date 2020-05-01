package cn.jbit.entity;

import java.util.Date;

public class Mustbedone {

	private int id;
	private String courseName;
	private String classroomId;
	private Date classTime;
	private String teacherId;
	private int grade;
	private String className;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getClassroomId() {
		return classroomId;
	}

	public void setClassroomId(String classroomId) {
		this.classroomId = classroomId;
	}

	public Date getClassTime() {
		return classTime;
	}

	public void setClassTime(Date classTime) {
		this.classTime = classTime;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Override
	public String toString() {
		return "Mustbedone [id=" + id + ", courseName=" + courseName + ", classroomId=" + classroomId + ", classTime="
				+ classTime + ", teacherId=" + teacherId + ", grade=" + grade + ", className=" + className + "]";
	}
	
}
