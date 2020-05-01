package cn.jbit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Curriculum {
	private int id;
	private int courseId;
	private Date classTime;
	private String teacherId;
	private String studentIds;
	private Course course;
	private String teachername; 
	
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getClassTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(classTime);
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
	public String getStudentIds() {
		return studentIds;
	}
	public void setStudentIds(String studentIds) {
		this.studentIds = studentIds;
	}
	@Override
	public String toString() {
		return "Curriculum [id=" + id + ", courseId=" + courseId + ", classTime=" + classTime + ", teacherId="
				+ teacherId + ", studentIds=" + studentIds + ", course=" + course + ", teachername=" + teachername
				+ "]";
	}
	
	
	
}
