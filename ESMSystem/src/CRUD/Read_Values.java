package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DB_Connection;
import common.User_Bean;

public class Read_Values {
	
	public static void main(String[] args) {
		Read_Values obj_values = new Read_Values();
		
		obj_values.get_values();
	}
	
	public List<User_Bean> get_values() {
		DB_Connection obj = new DB_Connection();
		Connection connection = obj.get_connection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<User_Bean> list = new ArrayList<User_Bean>();
		
		try {
			String query = "select * from paid_bills";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				User_Bean obj_User_Bean = new User_Bean();
				System.out.println(rs.getString("bill_ID"));
				System.out.println(rs.getString("bill_type"));
				System.out.println(rs.getString("month"));
				System.out.println(rs.getString("date"));
				System.out.println(rs.getString("amount"));
				System.out.println(rs.getString("paidBy"));
				System.out.println("");
				
				obj_User_Bean.setBill_ID(rs.getString("bill_ID"));
				obj_User_Bean.setBill_type(rs.getString("bill_type"));
				obj_User_Bean.setMonth(rs.getString("month"));
				obj_User_Bean.setDate(rs.getString("date"));
				obj_User_Bean.setAmount(rs.getString("amount"));
				obj_User_Bean.setPaidBy(rs.getString("paidBy"));
				
				list.add(obj_User_Bean);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			
			System.out.println("some erro in Read page");
		}
		return list;
		
		
	}

}
