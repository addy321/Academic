package cn.jbit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Announcement {

	private int id;
	private String content;
	private Date releaseTime;
	private String title;
	private int frequency;
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
	public String getReleaseTime() {
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" ); 
		String str = sdf.format(releaseTime); 
		return str;
	}
	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	@Override
	public String toString() {
		return "Announcement [id=" + id + ", content=" + content + ", releaseTime=" + releaseTime + ", title=" + title
				+ ", frequency=" + frequency + "]";
	}
}
