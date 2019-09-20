package model;

public class Attendance {
	private String attendanceID;
	private String employeeID;
	private String Date;
	private String state;
	private String intime;
	private String outtime;
	
	public Attendance() {
		attendanceID = null;
		employeeID = null;
		state = null;
		intime = null;
		outtime = null;
	}
	
	
	
	public String getDate() {
		return Date;
	}



	public void setDate(String date) {
		Date = date;
	}



	public String getAttendanceID() {
		return attendanceID;
	}



	public void setAttendanceID(String attendanceID) {
		this.attendanceID = attendanceID;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
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
