package model;

public class Income {
	private int incID;
	private String iName,iType;
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
	public double getIamount() {
		return iAmount;
	}
	public void setIamount(double iAmount) {
		this.iAmount=iAmount;
	}
}
