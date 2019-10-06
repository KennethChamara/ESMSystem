package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DB_Connection;

public class Insert_values {
	
	public void insert_values(String bill_type,String month,String date,String amount,String paidBy) {
		DB_Connection obj = new DB_Connection();
		Connection connection = obj.get_connection();
		
		PreparedStatement ps =null;
		
		try {
			

		
		String query = "insert into paid_bills(bill_type,month,date,amount,paidBy) values(?,?,?,?,?)";
		ps = connection.prepareStatement(query);
		
		ps.setString(1, bill_type);
		ps.setString(2, month);
		ps.setString(3, date);
		ps.setString(4, amount);
		ps.setString(5, paidBy);
		ps.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("some error in insert values");
			System.err.println(e);
			
			
		}
	}

}
