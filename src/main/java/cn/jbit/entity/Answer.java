package cn.jbit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Answer {
	private int id;
	private String content;	
	private int questionid;
	private Date answertime;
	private String teacherName;
	
	@Override
	public String toString() {
		return "Answer [id=" + id + ", content=" + content + ", questionid=" + questionid + ", answertime=" + answertime
				+ ", teacherName=" + teacherName + "]";
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQuestionid() {
		return questionid;
	}
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	public String getAnswertime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(answertime);
	}
	public void setAnswertime(Date answertime) {
		this.answertime = answertime;
	}
	
}
