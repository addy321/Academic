package cn.jbit.entity;

public class Classroom {
	private int id;
	private String className;
	private int status;
	private int types;
	private int size;
	public int getTypes() {
		return types;
	}
	public void setTypes(int types) {
		this.types = types;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Classroom [id=" + id + ", className=" + className + ", status=" + status + ", types=" + types
				+ ", size=" + size + "]";
	}
	
}
