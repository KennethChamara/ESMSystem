package model;

public class Bonuse {
	private String bid;
	private String ename;
	private String eid;
	private String possion;
	private double salary;
	private double amount;
	private String type;
	private int rate;
	private String date;
	private double netsalary;
	
	public Bonuse() {
		this.ename = null;
		this.eid = null;
		this.possion = null;
		this.salary = 0;
		this.amount = 0;
		this.type = null;
		this.rate = 0;
	}
	
	

	public double getNetsalary() {
		return netsalary;
	}



	public void setNetsalary(double netsalary) {
		this.netsalary = netsalary;
	}



	public String getBid() {
		return bid;
	}



	public void setBid(String bid) {
		this.bid = bid;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getPossion() {
		return possion;
	}

	public void setPossion(String possion) {
		this.possion = possion;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}
	
}
