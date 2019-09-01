package model;

public class Salary {
	
	private String empName;
	private String salaryID;
	private String empId;
	@Override
	public String toString() {
		return "Salary [empName=" + empName + ", salaryID=" + salaryID + ", empId=" + empId + ", month=" + month
				+ ", date=" + date + ", amount=" + amount + "]";
	}

	private String month;
	private String date;
	
	private double amount;

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getSalaryID() {
		return salaryID;
	}

	public void setSalaryID(String salaryID) {
		this.salaryID = salaryID;
	}
	
	
	

}
