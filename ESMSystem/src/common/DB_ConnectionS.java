package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

public class DB_ConnectionS {
	
public static void main(String[] args){
		
		DB_ConnectionS obj = new DB_ConnectionS();
	
			System.out.println(obj.get_connection());
		
	}
	
	public static Connection get_connection() {
		
		Connection connection = null;
		
		try {
			
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/esmsystem","root","root123");
		
	} catch (Exception e) {
		System.out.println(e);
	}
	
 		return connection;
		
		
	}


}
