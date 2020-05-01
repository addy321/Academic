package cn.jbit.entity;

public class Teacher {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String teacherID;
	private String password;
	private String name;
	private int gender;
	private int age;
	private int grade;
	private String phone;
	private String courseName;
	
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", teacherID=" + teacherID + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", age=" + age + ", grade=" + grade + ", phone=" + phone + ", courseName="
				+ courseName + "]";
	}
	public Teacher(String teacherID, String password, String name, int gender, int age, int grade, String phone,
			String courseName) {
		super();
		this.teacherID = teacherID;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.grade = grade;
		this.phone = phone;
		this.courseName = courseName;
	}
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
}
