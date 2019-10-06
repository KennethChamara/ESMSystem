package common;

public class User_Bean {
	
	private String bill_ID;
	private String bill_type;
	private String month;
	private String date;
	private String amount;
	private String paidBy;
	public String electricity = "Electricity"; 
	public String rental = "Rental";
	public String water = "Water";
	public String internet = "Internet";
	public String other = "Other";
	
	
	public String getBill_ID() {
		return bill_ID;
	}
	public void setBill_ID(String bill_ID) {
		this.bill_ID = bill_ID;
	}
	public String getBill_type() {
		return bill_type;
	}
	public void setBill_type(String bill_type) {
		this.bill_type = bill_type;
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
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPaidBy() {
		return paidBy;
	}
	public void setPaidBy(String paidBy) {
		this.paidBy = paidBy;
	}

	
	

}
