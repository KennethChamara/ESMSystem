package model;

public class Attendancelist extends Attendance {
	
	private int noOfdate_present;
	private int noOfdate_absent;
	private String employeeName;
	private String employeePossion;
	
	public Attendancelist() {
		super();
		noOfdate_present = 0;
		noOfdate_absent=0;
		employeeName = null;
		employeePossion = null;
	}
	
	public int getNoOfdate_present() {
		return noOfdate_present;
	}

	public void setNoOfdate_present(int noOfdate_present) {
		this.noOfdate_present = noOfdate_present;
	}

	public int getNoOfdate_absent() {
		return noOfdate_absent;
	}

	public void setNoOfdate_absent(int noOfdate_absent) {
		this.noOfdate_absent = noOfdate_absent;
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
