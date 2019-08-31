package model;

public class Stockproduct {
	
	private String pid;
	private String pname;
	private String category;
	private int qty;
	private String manufacture;
	private double price;
	
	public Stockproduct() {
		this.pid = null;
		this.pname = null;
		this.category = null;
		this.qty = 0;
		this.manufacture = null;
		this.price = 0;
	}
	
	public String getPid() {
		return pid;
	}
	
	public void setPid(String pid) {
		this.pid= pid;
	}
	
	public String getPname() {
		return pname;
	}
	
	public void setPname(String pname) {
		this.pname= pname;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category= category;
	}
	
	public int getQty() {
		return qty;
	}
	
	public void setQty(int qty) {
		this.qty= qty;
	}
	
	public String getManufacture() {
		return manufacture;
	}
	
	public void setManufacture(String manufacture) {
		this.manufacture= manufacture;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price= price;
	}

}
