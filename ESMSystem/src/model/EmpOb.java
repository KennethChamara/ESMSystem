package model;

public class EmpOb {
	
	private String eId;
	private String EmpName;
	private String designation;
	
	
	// some
	public EmpOb() {
		super();
		eId=null;
		EmpName=null;
		designation=null;
		
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getEmpName() {
		return EmpName;
	}
	public void setEmpName(String empName) {
		EmpName = empName;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	
	
	

}
