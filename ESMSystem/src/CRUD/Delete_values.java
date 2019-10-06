package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Delete_values {
	
	public void delete_value(String bill_ID) {
		DB_Connection obj = new DB_Connection();
		Connection connection = obj.get_connection();
		
		PreparedStatement ps = null;
		
		
		try {
			String query = "delete from paid_bills where bill_ID=?";
			ps = connection.prepareStatement(query);
			ps.setString(1, bill_ID);;
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e);
			
			System.out.println("some erro in Read page");
		}
		
		
	}

}
