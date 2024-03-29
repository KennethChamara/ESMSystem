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
import utill.MailUtill;
import utill.QueryUtil;

public class leaveSeviceIMPL implements leaveService {
	private static Connection connection;

	private PreparedStatement preparedStatement;

	private static Statement statement;

	static {
		// create table or drop if exist
		createSalaryTable();
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
			// statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE_LEAVES));
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

			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");

			Date startdate = sdf.parse(leaveOne.getStartDate());

			Date endDate = sdf.parse(leaveOne.getEndDate());

			int nofdays = ((int) ((endDate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24))) + 1;

			java.sql.Date sqlDate = new java.sql.Date(startdate.getTime());

			java.sql.Date sqlDate2 = new java.sql.Date(endDate.getTime());

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ADD_LEAVES));

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, leaveOne.getEmployeeID());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_THREE, nofdays);
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

	public ArrayList<listleave> getleves(int val) {
		ArrayList<listleave> Listleave = new ArrayList<listleave>();
		String quary = null;

		try {
			if (val == 1)
				quary = QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_REQUSETED_LEAVES);
			else if (val == 2)
				quary = QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_APPROVED_LEAVES);
			else
				return null;

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(quary);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				listleave Leave = new listleave();
				Leave.setEmployeeID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				Leave.setName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				Leave.setPossion(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				Leave.setLeaveID(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				Leave.setNoOfDate(resultSet.getInt(CommonConstants.COLUMN_INDEX_NINE));
				Leave.setStartDate(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				Leave.setEndDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				Leave.setLeaveType(resultSet.getString(CommonConstants.COLUMN_INDEX_TWELVE));
				Leave.setReason(resultSet.getString(CommonConstants.COLUMN_INDEX_THIRTEEN));

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

	public ArrayList<leave> getRequestedlevesOfAemployee(String ID) {
		ArrayList<leave> Listleave = new ArrayList<leave>();
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_REQUSETED_LEAVES_OF_A_EMPLOYEE));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, ID);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				leave Leave = new leave();
				Leave.setLeaveID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				Leave.setStartDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				Leave.setEndDate(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				Leave.setLeaveType(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				Leave.setReason(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));

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

	public void updateLeave(leave leaveOne) {
		try {

			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");

			Date startdate = sdf.parse(leaveOne.getStartDate());

			Date endDate = sdf.parse(leaveOne.getEndDate());

			int nofdays = ((int) ((endDate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24))) + 1;

			java.sql.Date sqlDate = new java.sql.Date(startdate.getTime());

			java.sql.Date sqlDate2 = new java.sql.Date(endDate.getTime());

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_LEAVES));

			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, nofdays);
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_TWO, sqlDate);
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_THREE, sqlDate2);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, leaveOne.getLeaveType());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, leaveOne.getReason());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, leaveOne.getLeaveID());

			preparedStatement.execute();

		} catch (SQLException | ClassNotFoundException | SAXException | IOException | ParserConfigurationException
				| ParseException e) {
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

	public void ApproveLeave(String id) {

		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_APPROV_LEAVE));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			preparedStatement.execute();

			// System.out.println("Leave avishkashyaman");

			SendEmail(id, "Approved");

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

	public void SendEmail(String id, String state) {
		MailUtill test = new MailUtill();
		String message, email, subject;
		try {
			
			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_DATES));
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.first();

			message = "Leave request on " + resultSet.getString(CommonConstants.COLUMN_INDEX_ONE) + " is " + state;
			subject = "Leave request on " + resultSet.getString(CommonConstants.COLUMN_INDEX_ONE) + " to "
					+ resultSet.getString(CommonConstants.COLUMN_INDEX_TWO) + " is " + state
					+ " contact your manager for futher details.. thank you";
			email = resultSet.getString(CommonConstants.COLUMN_INDEX_THREE);

			test.SendEmail("avishkashyaman@gmail.com", message, subject);

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
				Leave.setPossion(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				Leave.setLeaveID(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				Leave.setNoOfDate(resultSet.getInt(CommonConstants.COLUMN_INDEX_NINE));
				Leave.setStartDate(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				Leave.setEndDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				Leave.setLeaveType(resultSet.getString(CommonConstants.COLUMN_INDEX_TWELVE));
				Leave.setReason(resultSet.getString(CommonConstants.COLUMN_INDEX_THIRTEEN));
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
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_LEAVES_IDS));
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
