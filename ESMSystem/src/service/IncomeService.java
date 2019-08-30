package service;


	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.util.ArrayList;
	import java.util.List;

	import model.Income;

	public class IncomeService {
		public static Connection getConnection() {
			Connection con=null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ESMSystem", "root", "12345");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return con;
		}
		
		
		
		
		public static int save(Income i) {
			int status=0;
			
			try {
				Connection con = IncomeService.getConnection();
				PreparedStatement ps = con.prepareStatement("insert into income_details(incName,intType,incAmount) values (?,?,?)");
				
				ps.setString(1,i.getIname());
				ps.setString(2,i.getItype());
				ps.setDouble(3,i.getIamount());
				
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			return status;
		}
		public static int update(Income i) {
			int status=0;
			
			try {
				Connection con = IncomeService.getConnection();
				PreparedStatement ps = con.prepareStatement("update income_details set incName=?,intType=?,incAmount=? where incID=?");
				
				ps.setString(1,i.getIname());
				ps.setString(2,i.getItype());
				ps.setDouble(3,i.getIamount());
				ps.setInt(4,i.getId());
				
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			return status;
		}
		
		public static int delete(int id) {
			int status=0;
			
			try {
				Connection con = IncomeService.getConnection();
				PreparedStatement ps = con.prepareStatement("delete from income_details where incID=?");
				ps.setInt(1,id);
				
				
				status=ps.executeUpdate();
			
				con.close();
			}catch(Exception ex) {
				System.out.println(ex);
			}
			return status;
		}
		public static Income getIncomeById(int incID) {
			Income i = new Income();
			
			try {
				Connection con = IncomeService.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from income_details where incID=?");
				ps.setInt(1,incID);
				
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					i.setID(rs.getInt(1));
					i.setIname(rs.getString(2));
					i.setItype(rs.getString(3));
					i.setIamount(rs.getDouble(4));
				}
				
				con.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			return i;
		}

		public static List<Income> getAllIncomes(){
			List<Income> list = new ArrayList<Income>();
			
			try {
				Connection con = IncomeService.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from income_details");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					Income i = new Income();
					
					i.setID(rs.getInt(1));
					i.setIname(rs.getString(2));
					i.setItype(rs.getString(3));
					i.setIamount(rs.getDouble(4));
					
					list.add(i);
				}
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
}
