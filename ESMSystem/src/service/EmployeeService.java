package service;

import java.util.ArrayList;

import model.EmployeeDetails;

public interface EmployeeService {
	

	
	public void addemployee(EmployeeDetails empdesc);
	
	public ArrayList<EmployeeDetails> getemployeedetailsList(String search);
	
	public void deleteEmployeeById(String empID);
	
	public EmployeeDetails getemployee(String empID);
	
	//public void updatemployeedetails(String empID);

	
	public void updatemployeedetails(EmployeeDetails empID);

}
