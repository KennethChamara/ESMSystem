package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DB_Connection;
import common.User_Bean;

public class Edit_values {
	
	public User_Bean get_values_of_user(String bill_ID) {
		DB_Connection obj = new DB_Connection();
		Connection connection = obj.get_connection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		User_Bean obj_User_Bean = new User_Bean();
		
		
		try {
			String query = "select * from paid_bills where bill_ID=?";
			ps = connection.prepareStatement(query);
			ps.setString(1, bill_ID);;
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				
				obj_User_Bean.setBill_ID(rs.getString("bill_ID"));
				obj_User_Bean.setBill_type(rs.getString("bill_type"));
				obj_User_Bean.setMonth(rs.getString("month"));
				obj_User_Bean.setDate(rs.getString("date"));
				obj_User_Bean.setAmount(rs.getString("amount"));
				obj_User_Bean.setPaidBy(rs.getString("paidBy"));
				

			}
			
		} catch (Exception e) {
			System.out.println(e);
			
			System.out.println("some erro in Read page");
		}
		return obj_User_Bean;
		
		
	}
	
	
	public void edit_user(User_Bean obj_User_Bean) {
		DB_Connection obj = new DB_Connection();
		Connection connection = obj.get_connection();
		
		PreparedStatement ps = null;
		
		
		try {
			String query = "update paid_bills set bill_type=?,month=?,date=?,amount=?,paidBy=? where bill_ID=?";
			ps = connection.prepareStatement(query);
			ps.setString(1, obj_User_Bean.getBill_type());;
			ps.setString(2, obj_User_Bean.getMonth());;
			ps.setString(3, obj_User_Bean.getDate());;
			ps.setString(4, obj_User_Bean.getAmount());;
			ps.setString(5, obj_User_Bean.getPaidBy());;
			ps.setString(6, obj_User_Bean.getBill_ID());;
			ps.executeUpdate();
			

			
		} catch (Exception e) {
			System.out.println(e);
			
			System.out.println("some erro in Read page");
		}
		
		
	}

}
