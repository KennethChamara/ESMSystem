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

import model.Attendance;
import model.Attendancelist;
import model.listleave;
import utill.CommonConstants;
import utill.CommonUtil;
import utill.DBConnectionUtil;
import utill.QueryUtil;

public class AttendenceServiceIMPL implements AttendenceService {
	private static Connection connection;

	private PreparedStatement preparedStatement;

	private static Statement statement;

	static {
		// create table or drop if exist
		if (!createSalaryTable()) {

			System.out.println("ATTENDANCE table is created");
		} else {

			System.out.println("ATTENDANCE table exists");
		}
	}

	public static boolean createSalaryTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();

			// statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE_ATTENDANCE));

			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE_ATTENDANCE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return true;
	}

	@Override
	public void insertAttendence(Attendance attendance) {
		if (isAttendanceEntered() == false) {
			enterAttendanc();
		}
		// String id = CommonUtil.generateAttendanceIDs(getAttendanceIDs());
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-y");

			Date Date_;

			Date_ = sdf.parse(attendance.getDate());

			java.sql.Date sqlDate = new java.sql.Date(Date_.getTime());

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(
					"update attendance set state='present',intime=?,outTime=? where E_ID=? and _date='2019-09-20';");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, attendance.getIntime());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, attendance.getOuttime());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, attendance.getEmployeeID());
			// preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FOUR,sqlDate);

			preparedStatement.execute();

		} catch (SQLException | ClassNotFoundException | ParseException e) {
			e.printStackTrace();
		} finally {
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

	public void StateChange(String id) {
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection
					.prepareStatement("update attendance set state='absent',intime=null,outTime=null where A_ID=?;");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			preparedStatement.execute();

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
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

	public ArrayList<Attendance> getOneDayAllAttendance() {
		ArrayList<Attendance> ListAttendance = new ArrayList<Attendance>();
		try {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_ATTENDANCE));

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Attendance attendance = new Attendance();

				attendance.setAttendanceID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				attendance.setEmployeeID(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				attendance.setState(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				attendance.setIntime(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				attendance.setOuttime(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				attendance.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));

				ListAttendance.add(attendance);

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

		return ListAttendance;

	}

	public ArrayList<Attendancelist> getMonthlyAttendance(int month) {
		ArrayList<String> list = getEmployeeIDs();
		ArrayList<Attendancelist> ListAttendance = new ArrayList<Attendancelist>();
		// System.out.println("enterAttendanc() is called");
		for (String ID : list) {
			String Aid = CommonUtil.generateAttendanceIDs(getAttendanceIDs());
			try {
				connection = DBConnectionUtil.getDBConnection();

				preparedStatement = connection.prepareStatement(
						"SELECT E_ID,empName,empDesignation,count(A_ID) as number FROM attendance a,employees e where DATE_FORMAT(_date, \"%m\")=? and E_ID=? and a.E_ID=e.empID and state='present';");

				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, month);
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, ID);

				ResultSet resultSet = preparedStatement.executeQuery();
				
				resultSet.first();
				
				Attendancelist attendance = new Attendancelist();
				
				attendance.setEmployeeID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				attendance.setEmployeeName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				attendance.setEmployeePossion(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				attendance.setNoOfdate(resultSet.getInt(CommonConstants.COLUMN_INDEX_FOUR));

				ListAttendance.add(attendance);
				
				

			} catch (ClassNotFoundException | SQLException e) {
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

		return ListAttendance;
	}

	public ArrayList<String> getEmployeeIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();
		/*
		 * 
		 */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_EMPLOYEE_IDS));
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

	private ArrayList<String> getAttendanceIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();
		/*
		 * 
		 */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_ATTENDANCE_IDS));
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

	private boolean isAttendanceEntered() {

		boolean val = false;
		// System.out.println("isAttendanceEntered() is called");
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_GET_TODAY_ATTENDANCE));
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.first()) {
				// System.out.println("true");
				val = true;
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
		return val;

	}

	private void enterAttendanc() {
		ArrayList<String> list = getEmployeeIDs();
		// System.out.println("enterAttendanc() is called");
		for (String ID : list) {
			String Aid = CommonUtil.generateAttendanceIDs(getAttendanceIDs());
			try {
				connection = DBConnectionUtil.getDBConnection();

				preparedStatement = connection
						.prepareStatement("insert into attendance(A_ID,E_ID,_date) values(?,?,date(now()));");

				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, Aid);
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, ID);

				preparedStatement.execute();

			} catch (ClassNotFoundException | SQLException e) {
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

	}

}
