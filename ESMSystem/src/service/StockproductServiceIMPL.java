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

import model.Salary;
import model.Stockproduct;
import utill.CommonConstants;
import utill.DBConnectionUtil;
import utill.QueryUtil;

public class StockproductServiceIMPL implements Stockproductservice {
	
	
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(SalaryServiceImpl.class.getName());

	private static Connection connection;

	private static Statement statement;

	static{
		//create table or drop if exist
		if(createProductTable()) {
			
			System.out.println("its workig");
		}else {
			
			System.out.println("Not working");
		}
	}

	private PreparedStatement preparedStatement;
	

	/**
	 * This method initially drop existing Salary table in the database and recreate
	 * table structure to insert salary entries
	 * 
	 * @throws SQLException                 - Thrown when database access error
	 *                                      occurs or this method is called on a
	 *                                      closed connection
	 * @throws ClassNotFoundException       - Thrown when an application tries to
	 *                                      load in a class through its string name
	 *                                      using
	 * @throws SAXException                 - Encapsulate a general SAX error or
	 *                                      warning
	 * @throws IOException                  - Exception produced by failed or
	 *                                      interrupted I/O operations.
	 * @throws ParserConfigurationException - Indicates a serious configuration
	 *                                      error
	 * @throws NullPointerException         - Service is not available
	 * 
	 */
	public static boolean createProductTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			// Drop table if already exists and as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE));
			// Create new salary table as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		
		return true;
	}
	
	
	
	
	
	
	@Override
	public void addProduct(Stockproduct product) {
		
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in salaryQuery.xml file and use
			 * insert_salary key to extract value of it
			 */
			preparedStatement = connection
					.prepareStatement("insert into product(pid,pname,category,qty,manufacture,price) values(?,?,?,?,?,?);");
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE,product.getPid());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, product.getPname());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, product.getCategory());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_FOUR, product.getQty());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, product.getManufacture());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_SIX, product.getPrice());
		
			// Add product
			preparedStatement.execute();

		} catch (SQLException| ClassNotFoundException e) {
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
				e.printStackTrace();
			}
		}
		
	}
	
	public ArrayList<Stockproduct> getpoducts() {

		ArrayList<Stockproduct> productList = new ArrayList<Stockproduct>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement("select * from product;");
			
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Stockproduct product = new Stockproduct();
				product.setPid(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				product.setPname(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				product.setCategory(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				product.setQty(resultSet.getInt(CommonConstants.COLUMN_INDEX_FOUR));
				product.setManufacture(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				product.setPrice(resultSet.getDouble(CommonConstants.COLUMN_INDEX_SIX));

				productList.add(product);
			}

		} catch (SQLException | ClassNotFoundException e) {
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
				e.printStackTrace();
			}
		}
		return productList;
	}
	
	public Stockproduct getOnepoducts(String id) {
		
		Stockproduct product = new Stockproduct();

		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement("select * from product where  pid=?;");
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);
			
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				
				product.setPid(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				product.setPname(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				product.setCategory(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				product.setQty(resultSet.getInt(CommonConstants.COLUMN_INDEX_FOUR));
				product.setManufacture(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				product.setPrice(resultSet.getDouble(CommonConstants.COLUMN_INDEX_SIX));
			}

		} catch (SQLException | ClassNotFoundException e) {
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
				e.printStackTrace();
			}
		}
		return product;
	}

	
	public void removeProduct(String productID) {
		// TODO Auto-generated method stub
		
		// Before deleting check whether salary ID is available
		if (productID != null && !productID.isEmpty()) {
			/*
			 * Remove salary query will be retrieved from salaryQuery.xml
			 */
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement("delete from product where pid =?");
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, productID);
				preparedStatement.executeUpdate();
			} catch (SQLException
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
	
	public void updatestockproducts(Stockproduct ID) {
		
		try {
			
			System.out.println("Stockproduct");
			
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement("update product set pname=?,category=?,qty=?,manufacture=?,price=? where pid=?");
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE,ID.getPname());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, ID.getCategory());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_THREE, ID.getQty());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR,ID.getManufacture() );
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_FIVE, ID.getPrice());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, ID.getPid());
			
			System.out.println(ID.getPid());
			
			preparedStatement.execute();
		} catch (SQLException
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


