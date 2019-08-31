package service;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.LoginBean;
import utill.DBConnectionUtil;

public class LoginDao {

	public String authenticateUser(LoginBean loginBean) {
		String userName = loginBean.getUsername();
		String password = loginBean.getPassword();

		Connection con = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		String userNameDB = "";
		String passwordDB = "";
		String roleDB = "";

		try {
			con = DBConnectionUtil.getDBConnection();
			statement = con.prepareStatement("select username,password,role from login");
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				userNameDB = resultSet.getString("username");
				passwordDB = resultSet.getString("password");
				roleDB = resultSet.getString("role");

				if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("admin"))
					return "Admin_Role";
				else if (userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("user"))
					return "User_Role";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Invalid user credentials";
	}

}
