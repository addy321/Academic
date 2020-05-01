package cn.jbit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Course {

	private int id;
	private Date Uploadtime;
	private String courseName;
	private int courseStatus;
	public int getCourseStatus() {
		return courseStatus;
	}
	public void setCourseStatus(int courseStatus) {
		this.courseStatus = courseStatus;
	}
	private String classroomId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUploadtime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(Uploadtime);
	}
	public void setUploadtime(Date uploadtime) {
		Uploadtime = uploadtime;
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
	@Override
	public String toString() {
		return "Course [id=" + id + ", Uploadtime=" + Uploadtime + ", courseName=" + courseName + ", courseStatus="
				+ courseStatus + ", classroomId=" + classroomId + "]";
	}

}
