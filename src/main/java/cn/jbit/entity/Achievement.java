package cn.jbit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Achievement {
	private int id;
	private String subject;
	private int fraction;
	private int studentid;
	private Date EntryTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getFraction() {
		return fraction;
	}
	public void setFraction(int fraction) {
		this.fraction = fraction;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public String getEntryTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(EntryTime);
	}
	public void setEntryTime(Date entryTime) {
		EntryTime = entryTime;
	}
	@Override
	public String toString() {
		return "Achievement [id=" + id + ", subject=" + subject + ", fraction=" + fraction + ", studentid=" + studentid
				+ ", EntryTime=" + EntryTime + "]";
	}
	
	
}
