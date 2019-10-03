package service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
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
		if (!createAttendanceTable()) {

			System.out.println("ATTENDANCE table is created");
		} else {

			System.out.println("ATTENDANCE table exists");
		}
	}

	public static boolean createAttendanceTable() {

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
		// String id = CommonUtil.generateAttendanceIDs(getAttendanceIDs());
		try {
		
			java.sql.Date sqlDate = getsqldate(attendance.getDate());
			
			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection.prepareStatement(
					"update attendance set state='present',intime=?,outTime=? where E_ID=? and _date=?;");
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, attendance.getIntime());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, attendance.getOuttime());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, attendance.getEmployeeID());
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_FOUR,sqlDate);

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

	public ArrayList<Attendance> getOneDayAllAttendance(String DATE) {
		
		if (isAttendanceEntered(DATE) == false) {
			enterAttendanc(DATE);
		}
		
		ArrayList<Attendance> ListAttendance = new ArrayList<Attendance>();
		
		try {
			
			java.sql.Date sqlDate = getsqldate(DATE);

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_ATTENDANCE));
			
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_ONE,sqlDate);

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
	
	public ArrayList<Attendance> getSingleMonthlyAttendance(String ID,int month){
		ArrayList<Attendance> ListAttendance = new ArrayList<Attendance>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = connection
					.prepareStatement("select _date,intime,outTime,state from attendance where DATE_FORMAT(_date, \"%m\")=? and E_ID=? order by _date;");
			
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE,month);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO,ID);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Attendance attendance = new Attendance();

				attendance.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				if(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO) == null)
					attendance.setIntime("--");
				else
					attendance.setIntime(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				
				if(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE) == null)
					attendance.setOuttime("--");
				else
					attendance.setOuttime(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				
				attendance.setState(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));

				ListAttendance.add(attendance);

			}

		} catch (SQLException | ClassNotFoundException e) {
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
			try {
				connection = DBConnectionUtil.getDBConnection();

				preparedStatement = connection.prepareStatement("select E_ID,empName,empDesignation,A_ID FROM attendance a,employees e where E_ID=? and a.E_ID=e.empID;");
				
				//preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, month);
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, ID);

				ResultSet resultSet = preparedStatement.executeQuery();

				resultSet.first();

				Attendancelist attendance = new Attendancelist();

				attendance.setEmployeeID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				attendance.setEmployeeName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				attendance.setEmployeePossion(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				
				resultSet.close();
				preparedStatement.close();
				
				attendance.setNoOfdate_present(getPresentDatesOFaMonth(ID,month,"present"));
				attendance.setNoOfdate_absent(getPresentDatesOFaMonth(ID,month,"absent"));

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
	
	public double getSingleMonthlyAttendancePrnt(String ID,int month) {
		
		double input = (double)getPresentDatesOFaMonth(ID,month,"present")/(double)(getPresentDatesOFaMonth(ID,month,"absent")+getPresentDatesOFaMonth(ID,month,"present")) * 100.0;
		
		BigDecimal bd = new BigDecimal(input).setScale(2, RoundingMode.HALF_UP);
		return bd.doubleValue();
			
	}
	
	public int getPresentDatesOFaMonth(String ID,int month,String state) {
		int count = 0;
		// System.out.println("enterAttendanc() is called");
			try {
				connection = DBConnectionUtil.getDBConnection();

				preparedStatement = connection.prepareStatement(" select count(A_ID) as number FROM attendance a,employees e where DATE_FORMAT(_date, \"%m\")=? and E_ID=? and a.E_ID=e.empID and state=?;");
				
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, month);
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, ID);
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, state);

				ResultSet resultSet = preparedStatement.executeQuery();

				resultSet.first();

				count = resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE);
				
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
			return count;
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

	private boolean isAttendanceEntered(String date) {

		boolean val = false;
		// System.out.println("isAttendanceEntered() is called");
		try {
			java.sql.Date sqlDate = getsqldate(date);
			
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_GET_TODAY_ATTENDANCE));
			
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_ONE,sqlDate);
			
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

	private void enterAttendanc(String date) {
		ArrayList<String> list = getEmployeeIDs();
		System.out.println("enterAttendanc() is called");
		String quary;
		for (String ID : list) {
			String Aid = CommonUtil.generateAttendanceIDs(getAttendanceIDs());
			try {
				if(onleave(ID,date)) {
					quary = "insert into attendance(A_ID,E_ID,state,_date) values(?,?,'leave',?);";
				} else {
					quary = "insert into attendance(A_ID,E_ID,_date) values(?,?,?);";
				}
				java.sql.Date sqlDate = getsqldate(date);
				
				connection = DBConnectionUtil.getDBConnection();

				preparedStatement = connection.prepareStatement(quary);

				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, Aid);
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, ID);
				preparedStatement.setDate(CommonConstants.COLUMN_INDEX_THREE,sqlDate);

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
	
	private boolean onleave(String EID,String date) {

		boolean val = false;
		// System.out.println("isAttendanceEntered() is called");
		try {
			java.sql.Date sqlDate = getsqldate(date);
			
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection
					.prepareStatement("select leavesID from leaves where startDate  >= ? and endDate <= ? and employeeID =?;");
			
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_ONE,sqlDate);
			preparedStatement.setDate(CommonConstants.COLUMN_INDEX_TWO,sqlDate);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, EID);
			
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.first()) {
				// System.out.println("true");
				val = true;
			}

		} catch (SQLException | ClassNotFoundException e) {
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
	
	private java.sql.Date getsqldate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");

		Date Date_;
		java.sql.Date sqlDate = null;
		try {
			Date_ = sdf.parse(date);
		
			sqlDate = new java.sql.Date(Date_.getTime());
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sqlDate;
	}

}
