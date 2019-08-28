package service;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactoryConfigurationError;

import model.Salary;

public interface IsalaryService {
	
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(IsalaryService.class.getName());


	/**
	 * Add salary for salary table
	 * @param employee
	 */
	public void addSalary(Salary salary);

	/**
	 * Get a particular Salary
	 * 
	 * @param SalaryID
	 * @return salary
	 */
	public Salary getSalaryByID(String salaryID);
	
	/**
	 * Get all list of salarys
	 * 
	 * @return ArrayList<Salary>
	 */
	public ArrayList<Salary> getSalarys();
	
	/**
	 * Update existing salary
	 * @param salaryID
	 * @param salary
	 * 
	 * @return
	 */
	public Salary updateSalary(String salaryID, Salary salary);

	/**
	 * Remove existing salary
	 * 
	 * @param salaryID
	 */
	public void removeSalary(String salaryID);
	
	

}
