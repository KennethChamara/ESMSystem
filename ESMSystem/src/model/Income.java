package model;

public class Income {
	private int incID;
	private String iName,iType,iMonth,iDate;
	private double iAmount;
	
	public int getId() {
		return incID;
	}
	public void setID(int incID) {
		this.incID=incID;
	}
	public String getIname() {
		return iName;
	}
	public void setIname(String iName) {
		this.iName=iName;
	}
	public String getItype() {
		return iType;
	}
	public void setItype(String iType) {
		this.iType=iType;
	}
	public String getImonth() {
		return iMonth;
	}
	public void setImonth(String iMonth) {
		this.iMonth=iMonth;
	}
	public String getIdate() {
		return iDate;
	}
	public void setIdate(String iDate) {
		this.iDate=iDate;
	}
	public double getIamount() {
		return iAmount;
	}
	public void setIamount(double iAmount) {
		this.iAmount=iAmount;
	}
}
