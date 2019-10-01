package model;

public class leave {
	private String employeeID;
	private String leaveID;
	private int noOfDate;
	private String startDate;
	private String endDate;
	private String leaveType;
	private String reason;
	
	public leave() {
		this.employeeID = null;
		this.noOfDate = 0;
		this.startDate = null;
		this.endDate = null;
		this.leaveType = null;
		this.reason = null;
	}

	public String getLeaveID() {
		return leaveID;
	}


	public void setLeaveID(String leaveID) {
		this.leaveID = leaveID;
	}


	public String getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}

	public int getNoOfDate() {
		return noOfDate;
	}

	public void setNoOfDate(int noOfDate) {
		this.noOfDate = noOfDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
