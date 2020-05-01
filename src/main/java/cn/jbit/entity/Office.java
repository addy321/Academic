package cn.jbit.entity;

public class Office {
	private String officeId;
	private String password;
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Office [officeId=" + officeId + ", password=" + password + "]";
	}
	
}
