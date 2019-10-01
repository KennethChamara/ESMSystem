package service;



import java.io.IOException;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import utill.*;


import model.Salary;

public class SalaryServiceImpl implements IsalaryService {
	
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(SalaryServiceImpl.class.getName());

	private static Connection connection;

	private static Statement statement;

	static{
		//create table or drop if exist
		if(createSalaryTable()) {
			
			System.out.println("its workig");
		}else {
			
			System.out.println("Not working");
		}
	}

	private PreparedStatement preparedStatement;
	
	
	/**
	 * This method initially drop existing Salary table in the database and
	 * recreate table structure to insert salary entries
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection
	 * @throws ClassNotFoundException
	 *             - Thrown when an application tries to load in a class through
	 *             its string name using
	 * @throws SAXException
	 *             - Encapsulate a general SAX error or warning
	 * @throws IOException
	 *             - Exception produced by failed or interrupted I/O operations.
	 * @throws ParserConfigurationException
	 *             - Indicates a serious configuration error
	 * @throws NullPointerException
	 *             - Service is not available
	 * 
	 */
	public static boolean createSalaryTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			// Drop table if already exists and as per SQL query available in
			// Query.xml
			//statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE));
			// Create new salary table as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		
		return true;
	}

	@Override
	public void addSalary(Salary salary) {
		// TODO Auto-generated method stub
String salaryID = CommonUtil.generateIDs(getSalaryIDs());
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in salaryQuery.xml file and use
			 * insert_salary key to extract value of it
			 */
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_SALARY));
			connection.setAutoCommit(false);
			
			SimpleDateFormat sdf= new SimpleDateFormat("MM/dd/yyyy");
			SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd");
			
			
		    Date date = sdf.parse(salary.getDate());
		    String str = sdf2.format(date);
		    date = sdf2.parse(str);
		  			
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			//Generate salary IDs
			salary.setSalaryID(salaryID);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, salary.getSalaryID());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, salary.getEmpId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, salary.getEmpName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, salary.getMonth());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FIVE, sqlDate);
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_SIX, salary.getAmount());
		
			// Add salary
			preparedStatement.execute();
			connection.commit(); 

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
	}

	@Override
	public Salary getSalaryByID(String salaryID) {
		// TODO Auto-generated method stub
		return actionOnSalary(salaryID).get(0);
	}

	@Override
	public ArrayList<Salary> getSalarys() {
		// TODO Auto-generated method stub
		return actionOnSalary(null);
	}

	@Override
	public Salary updateSalary(String salaryID, Salary salary) {
		// TODO Auto-generated method stub
		/*
		 * Before fetching Salary it checks whether salary ID is available
		 */
		System.out.println(salaryID);
		if (salaryID != null && !salaryID.isEmpty()) {
			/*
			 * Update employee query will be retrieved from EmployeeQuery.xml
			 */
			
			
			try {
				SimpleDateFormat sdf= new SimpleDateFormat("dd-mm-y");
				
				Date date = sdf.parse(salary.getDate());
				
				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_EMPLOYEE));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, salary.getEmpName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, salary.getMonth());
				preparedStatement.setDate(CommonConstants.COLUMN_INDEX_THREE, sqlDate);
				preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_FOUR, salary.getAmount());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, salary.getSalaryID());
				
				preparedStatement.executeUpdate();

			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end
				 * of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		// Get the updated employee
		return getSalaryByID(salaryID);
	}

	@Override
	public void removeSalary(String salaryID) {
		// TODO Auto-generated method stub
		
		// Before deleting check whether salary ID is available
		if (salaryID != null && !salaryID.isEmpty()) {
			/*
			 * Remove salary query will be retrieved from salaryQuery.xml
			 */
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_REMOVE_SALARY));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, salaryID);
				preparedStatement.executeUpdate();
			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end
				 * of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		
	}
	
	private ArrayList<Salary> actionOnSalary(String salaryID) {

		ArrayList<Salary> salaryList = new ArrayList<Salary>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Before fetching salary it checks whether salary ID is
			 * available
			 */
			if (salaryID != null && !salaryID.isEmpty()) {
				/*
				 * Get salary by ID query will be retrieved from
				 * salaryQuery.xml
				 */
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_SALARY));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, salaryID);
			}
			/*
			 * If salary ID is not provided for get salary option it display
			 * all salarys
			 */
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_SALARY));
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Salary salary = new Salary();
				salary.setSalaryID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				salary.setEmpId(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				salary.setEmpName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				salary.setMonth(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				salary.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				salary.setAmount(resultSet.getDouble(CommonConstants.COLUMN_INDEX_SIX));
				salaryList.add(salary);
			}

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return salaryList;
	}
	
	
	public ArrayList<Salary> searchSalary(String search) {
		System.out.println(" no error in Search function");
		ArrayList<Salary> salaryList = new ArrayList<Salary>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Before fetching salary it checks whether salary ID is
			 * available
			 */
			if (search != null && !search.isEmpty()) {
				System.out.println("error in sal impl"+search);
				search = search
					    .replace("!", "!!")
					    .replace("%", "!%")
					    .replace("_", "!_")
					    .replace("[", "![");
				
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SEARCH_SALARY));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, "%"+search+"%");
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, "%"+search+"%");
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, "%"+search+"%");
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, "%"+search+"%");
				
			}
			/*
			 * If salary ID is not provided for get salary option it display
			 * all salarys
			 */
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_SALARY));
			}
			
			
			
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println("error in sal impl");
			while (resultSet.next()) {
				Salary salary = new Salary();
				salary.setSalaryID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				salary.setEmpId(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				salary.setEmpName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				salary.setMonth(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				salary.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				salary.setAmount(resultSet.getDouble(CommonConstants.COLUMN_INDEX_SIX));
				salaryList.add(salary);
			}

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		System.out.println("error in Search function end");
		return salaryList;
	}
	
private ArrayList<String> getSalaryIDs(){
		
		ArrayList<String> arrayList = new ArrayList<String>();
		/*
		 * List of salary IDs will be retrieved from salaryQuery.xml
		 */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_SALARY_IDS));
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException
				| ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return arrayList;
	}



}
