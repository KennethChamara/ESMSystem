package model;

public class Attendancelist extends Attendance {
	
	private int noOfdate;
	private String employeeName;
	private String employeePossion;
	
	public Attendancelist() {
		super();
		noOfdate = 0;
		employeeName = null;
		employeePossion = null;
	}
	public int getNoOfdate() {
		return noOfdate;
	}
	public void setNoOfdate(int noOfdate) {
		this.noOfdate = noOfdate;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeePossion() {
		return employeePossion;
	}
	public void setEmployeePossion(String employeePossion) {
		this.employeePossion = employeePossion;
	}
	
	

}
