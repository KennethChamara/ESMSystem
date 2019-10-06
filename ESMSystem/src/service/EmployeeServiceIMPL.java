package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.EmployeeDetails;
import common.DB_ConnectionS;
import java.sql.DriverManager;



import com.mysql.cj.protocol.Resultset;


public class EmployeeServiceIMPL implements EmployeeService{
	
	
	private static Connection connection;	

	private static Connection connection2;
	

	private static PreparedStatement preparedStatement;	

	private ResultSet resultSet;

	
	private static PreparedStatement preparedStatement2;	

	private ResultSet resultSet2;
	private ResultSet resultSet3;

	


	//static {
		//createTable();
	//}

//public static void createTable() {
//	try {
//		connection = DBConnectionUtil.getDBConnection();//create connection
//		
//		
//	
//		
//		
//		
//		
//		//preparedStatement.execute();
//
//
//	} catch (SQLException e) {
//		e.printStackTrace();
//	} catch (ClassNotFoundException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	} finally {
//		try {
//			connection.close();//close the connection
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//}


public void addemployee(EmployeeDetails empdesc){

	
	

	try {
		connection = DB_ConnectionS.get_connection();
		
		preparedStatement = connection.prepareStatement("insert into  employees values(?,?,?,?,?,?);");
		
		preparedStatement.setString(1, empdesc.getEmpID());
		preparedStatement.setString(2, empdesc.getEmpName());
		preparedStatement.setString(3, empdesc.getEmpEmail());
		preparedStatement.setString(4, empdesc.getEmpGender());
		preparedStatement.setString(5,empdesc.getEmpAddress());
		preparedStatement.setString(6,empdesc.getEmpDesignation());
		

		preparedStatement.execute();

		connection.close();

	} catch (SQLException e) {

		e.printStackTrace();
	}

}
	
public ArrayList<EmployeeDetails> getemployeedetailsList(String search) {
	 
	ArrayList<EmployeeDetails> empList = new ArrayList<>();
	
	
	
	try {
		connection = DB_ConnectionS.get_connection();
		if(search !=null && !search.isEmpty()) {
	 

		
		preparedStatement = connection.prepareStatement("select * from employees where empID like ? or empName like ? or empDesignation like ? or empEmail like ? ESCAPE '!' "); 
		search=search.replace("!", "!!").replace("%", "!%").replace("_", "1_").replace("[", "![");
		preparedStatement.setString(1,"%"+search+"%");
		preparedStatement.setString(2,"%"+search+"%");
		preparedStatement.setString(3,"%"+search+"%");
		preparedStatement.setString(4,"%"+search+"%");
		

		}else {
			preparedStatement = connection.prepareStatement("select * from employees");
		
		}
		
		resultSet = preparedStatement.executeQuery();
		
		while (resultSet.next()) {
			EmployeeDetails  emp= new EmployeeDetails ();	
			emp.setEmpID(resultSet.getString(1));
			emp.setEmpName(resultSet.getString(2));
			emp.setEmpEmail(resultSet.getString(3));
			emp.setEmpGender(resultSet.getString(4));
			emp.setEmpAddress(resultSet.getString(5));
			emp.setEmpDesignation(resultSet.getString(6));
			
			
			empList.add(emp);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	return empList; 

}
public EmployeeDetails getemployee(String empID) {
	EmployeeDetails emp = new EmployeeDetails();
	try {
		connection = DB_ConnectionS.get_connection();
		preparedStatement = connection.prepareStatement("select * from employees where empID=?"); 
		
		preparedStatement.setString(1, empID);

		resultSet = preparedStatement.executeQuery();
		
		resultSet.first();
			
			emp.setEmpID(resultSet.getString(1));
			emp.setEmpName(resultSet.getString(2));
			emp.setEmpEmail(resultSet.getString(3));
			emp.setEmpGender(resultSet.getString(4));
			emp.setEmpAddress(resultSet.getString(5));
			emp.setEmpDesignation(resultSet.getString(6));

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	return emp; 
}

public void deleteEmployeeById(String empID) {
	
try {
	connection = DB_ConnectionS.get_connection();	
	
	preparedStatement = connection.prepareStatement("delete from  employees where empID=?;");
	
	preparedStatement.setString(1, empID);	
	
	preparedStatement.execute();	
	
	preparedStatement.execute();

	connection.close();

} catch (SQLException e) {

	e.printStackTrace();
}

}


public void updatemployeedetails(EmployeeDetails empID) {
	try {
		
		connection = DB_ConnectionS.get_connection();	
		
		
		preparedStatement = connection.prepareStatement("update employees set  empName=?,empEmail=?, empGender=?,empAddress=?,empDesignation=? where empID=?;");
		
		preparedStatement.setString(1,empID.getEmpName());
		preparedStatement.setString(2, empID.getEmpEmail());
		preparedStatement.setString(3, empID.getEmpGender());
		preparedStatement.setString(4, empID.getEmpAddress());
		preparedStatement.setString(5, empID.getEmpDesignation());
		preparedStatement.setString(6, empID.getEmpID());
		
		
		preparedStatement.execute();		
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}


	
	
	
	
	
	
	
	
	
	

}
