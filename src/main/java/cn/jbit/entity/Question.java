package cn.jbit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Question {
	private Integer id;
	private String studentId;
	private String problem;
	private Date time;
	private Student student;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(time);
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", studentId=" + studentId + ", problem=" + problem + ", time=" + time
				+ ", student=" + student + "]";
	}
	public Question(Integer id, String studentId, String problem, Date time) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.problem = problem;
		this.time = time;
	}
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
}
