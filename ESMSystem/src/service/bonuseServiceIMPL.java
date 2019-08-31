package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import model.Bonuse;
import model.Salary;
import utill.CommonConstants;
import utill.CommonUtil;
import utill.DBConnectionUtil;
import utill.QueryUtil;

public class bonuseServiceIMPL implements bonuseService {
	private static Connection connection;

	private PreparedStatement preparedStatement;

	@Override
	public void addBounce(Bonuse bouns) {

		bouns.setAmount(((double) bouns.getRate() * (1.0 / 100.0)) * getSalary(bouns.getEid()));
		System.out.println("getAmount" + bouns.getAmount());

		bouns.setBid(CommonUtil.generateBounceIDs(getBounceIDs()));
		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in salaryQuery.xml file and use insert_salary key to
			 * extract value of it
			 */
			preparedStatement = connection
					.prepareStatement("insert into bounce(bid,eid,type,rate,amount) values(?,?,?,?,?);");

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, bouns.getBid());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, bouns.getEid());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, bouns.getType());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_FOUR, bouns.getRate());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_FIVE, bouns.getAmount());

			// Add salary
			preparedStatement.execute();

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

	}

	public ArrayList<Bonuse> getbounce() {
		ArrayList<Bonuse> BonuseList = new ArrayList<Bonuse>();

		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(" select * from bounce b, salary s where s.salaryID=b.eid;");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Bonuse bonuse = new Bonuse();
				bonuse.setBid(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				bonuse.setEid(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				bonuse.setType(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				bonuse.setRate(resultSet.getInt(CommonConstants.COLUMN_INDEX_FOUR));
				bonuse.setAmount(resultSet.getDouble(CommonConstants.COLUMN_INDEX_FIVE));
				bonuse.setEname(resultSet.getString(8));
				bonuse.setSalary(resultSet.getDouble(11));
				bonuse.setNetsalary(bonuse.getAmount()+bonuse.getSalary());

				BonuseList.add(bonuse);
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

		return BonuseList;
	}

	public void bounceUpdate(Bonuse bonus) {
		bonus.setAmount(((double) bonus.getRate() * (1.0 / 100.0)) * getSalary(bonus.getEid()));
		System.out.println("getAmount" + bonus.getAmount());

		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in salaryQuery.xml file and use insert_salary key to
			 * extract value of it
			 */
			preparedStatement = connection
					.prepareStatement("update bounce set eid=?,type=?,rate=?,amount=? where bid=?;");

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, bonus.getEid());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, bonus.getType());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_THREE, bonus.getRate());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_FOUR, bonus.getAmount());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, bonus.getBid());

			preparedStatement.execute();

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

	}

	public void bounceDelete(String id) {

		try {
			connection = DBConnectionUtil.getDBConnection();
			/*
			 * Query is available in salaryQuery.xml file and use insert_salary key to
			 * extract value of it
			 */
			preparedStatement = connection.prepareStatement("delete from bounce where bid=?;");

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			// Add salary
			preparedStatement.execute();

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
	}

	public Bonuse selectBounce(String id) {
		Bonuse bonuse = new Bonuse();

		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement("select * from bounce where bid=?;");

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				bonuse.setBid(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				bonuse.setEid(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				bonuse.setType(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				bonuse.setRate(resultSet.getInt(CommonConstants.COLUMN_INDEX_FOUR));
				bonuse.setAmount(resultSet.getDouble(CommonConstants.COLUMN_INDEX_FIVE));
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
		return bonuse;
	}

	private double getSalary(String id) {
		double salary = 0;
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement("select amount from salary where salaryID=?;");

			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			resultSet.first();

			salary = resultSet.getDouble(CommonConstants.COLUMN_INDEX_ONE);

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

		return salary;
	}

	private ArrayList<String> getBounceIDs() {

		ArrayList<String> arrayList = new ArrayList<String>();
		/*
		 * List of salary IDs will be retrieved from salaryQuery.xml
		 */
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement("select * from bounce;");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
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
		return arrayList;
	}

}
