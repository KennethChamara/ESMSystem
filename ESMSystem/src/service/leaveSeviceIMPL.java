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

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;



import model.leave;
import model.listleave;
import utill.CommonConstants;
import utill.CommonUtil;
import utill.DBConnectionUtil;
import utill.QueryUtil;

public class leaveSeviceIMPL implements leaveService {
	private static Connection connection;

	private PreparedStatement preparedStatement;

	private static Statement statement;

	static {
		// create table or drop if exist
		if (createSalaryTable()) {

			System.out.println("Leave table is created");
		} else {

			System.out.println("Leave table exists");
		}
	}

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
	public static boolean createSalaryTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			// Drop table if already exists and as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE_LEAVES));
			// Create new salary table as per SQL query available in
			// Query.xml
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE_LEAVES));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return true;
	}

	public void addLeaves(leave leaveOne) {
		String id = CommonUtil.generateLeaveIDs(getLeaveIDs());

		try {

			SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-y");

			Date startdate;

			Date endDate;

			startdate = sdf.parse(leaveOne.getStartDate());

			endDate = sdf.parse(leaveOne.getEndDate());

			java.sql.Date sqlDate = new java.sql.Date(startdate.getTime());

			java.sql.Date sqlDate2 = new java.sql.Date(endDate.getTime());

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ADD_LEAVES));

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, leaveOne.getEmployeeID());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_THREE, leaveOne.getNoOfDate());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FOUR, sqlDate);
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FIVE, sqlDate2);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, leaveOne.getLeaveType());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, leaveOne.getReason());

			preparedStatement.execute();

		} catch (ClassNotFoundException | SQLException | ParseException | SAXException | IOException
				| ParserConfigurationException e) {
			e.printStackTrace();
			// System.out.println("sql error");
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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
				// System.out.println("sql error 2");
			}
		}

	}

	public ArrayList<listleave> getleves() {
		ArrayList<listleave> Listleave = new ArrayList<listleave>();
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_LEAVES));

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				listleave Leave = new listleave();
				Leave.setEmployeeID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				Leave.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				Leave.setPossion(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				Leave.setNoOfDate(resultSet.getInt(CommonConstants.COLUMN_INDEX_SIX));
				Leave.setStartDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				Leave.setEndDate(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				Leave.setLeaveType(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				Leave.setReason(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));

				Listleave.add(Leave);

			}

		} catch (SQLException | ClassNotFoundException | SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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

		return Listleave;

	}

	public void ApproveLeave(String id) {
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_APPROV_LEAVE));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			preparedStatement.execute();

		} catch (SQLException | ClassNotFoundException | SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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

	public void DeleteLeave(String id) {
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_LEAVE));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			preparedStatement.execute();

		} catch (SQLException | ClassNotFoundException | SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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

	public listleave selectLeave(String id) {
		listleave Leave = new listleave();
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_SELECT_LEAVE));

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Leave.setEmployeeID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				Leave.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				Leave.setPossion(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				Leave.setNoOfDate(resultSet.getInt(CommonConstants.COLUMN_INDEX_SIX));
				Leave.setStartDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				Leave.setEndDate(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				Leave.setLeaveType(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				Leave.setReason(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
			}

		} catch (SQLException | ClassNotFoundException | SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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
		return Leave;

	}

	private ArrayList<String> getLeaveIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();
		/*
		 * List of salary IDs will be retrieved from salaryQuery.xml
		 */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_LEAVES));
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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
		return arrayList;
	}
}
