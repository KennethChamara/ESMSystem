package model;

public class IncomeCalc {
	private String type,month,year,mValue,found;
	private double sum;
	
	
	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type=type;
	}
	public String getMonth() {
		return this.month;
	}
	public void setMonth(String month) {
		this.month=month;
	}
	public String getYear() {
		return this.year;
	}
	public void setYear(String year) {
		this.year=year;
	}
	public double getTotal() {
		return this.sum;
	}
	public void setTotal(Double sum) {
		this.sum=sum;
	}
	public String findMonth(String month) {
		mValue=month;
		if(mValue.equals("1")) {
			found="January";
		}else if(mValue.equals("2")){
			found="February";
		}else if(mValue.equals("3")){
			found="Marrch";
		}else if(mValue.equals("4")){
			found="April";
		}else if(mValue.equals("5")){
			found="May";
		}else if(mValue.equals("6")){
			found="June";
		}else if(mValue.equals("7")){
			found="July";
		}else if(mValue.equals("8")){
			found="Auguest";
		}else if(mValue.equals("9")){
			found="September";
		}else if(mValue.equals("10")){
			found="October";
		}else if(mValue.equals("11")){
			found="November";
		}else if(mValue.equals("12")){
			found="December";
		}
		return found;
	}
}
