package model;

public class Attendence {
	private String employeeID;
	private String intime;
	private String outtime;
	public Attendence() {
		employeeID = null;
		intime = null;
		outtime = null;
	}
	public String getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public String getOuttime() {
		return outtime;
	}
	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}
	
}
