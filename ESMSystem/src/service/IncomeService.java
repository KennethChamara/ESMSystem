package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Income;
import model.IncomeCalc;

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
	
	static {
		createTable();
	}
	public static void createTable() {
		try {
			Connection con = IncomeService.getConnection();
			PreparedStatement ps = con.prepareStatement("create table IF NOT EXISTS income_details(incID int(10) auto_increment not null primary key,incName varchar(100),intType varchar(20),incAmount double,incDate date,incMonth varchar(10))");
			
			ps.executeUpdate();
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	
	public static int save(Income i) {
		int status=0;
		
		try {
			Connection con = IncomeService.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into income_details(incName,intType,incAmount,incDate,incMonth) values (?,?,?,?,?)");
			
			SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy");
			Date date = sdf.parse(i.getIdate());
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			ps.setString(1,i.getIname());
			ps.setString(2,i.getItype());
			ps.setDouble(3,i.getIamount());
			ps.setDate(4,sqlDate);
			ps.setString(5,i.getImonth());
			
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
			PreparedStatement ps = con.prepareStatement("update income_details set incName=?,intType=?,incAmount=?,incDate=?,incMonth=? where incID=?");
			
			SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy");
			Date date = sdf.parse(i.getIdate());
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			ps.setString(1,i.getIname());
			ps.setString(2,i.getItype());
			ps.setDouble(3,i.getIamount());
			ps.setDate(4,sqlDate);
			ps.setString(5,i.getImonth());
			ps.setInt(6,i.getId());
			
			
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
				i.setIdate(rs.getString(5));
				i.setImonth(rs.getString(6));
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
				i.setIdate(rs.getString(5));
				i.setImonth(rs.getString(6));
				
				list.add(i);
			}
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public static List<IncomeCalc> getOrderdIncomes(){
		List<IncomeCalc> list = new ArrayList<IncomeCalc>();
		
		try {
			Connection con = IncomeService.getConnection();
			PreparedStatement ps = con.prepareStatement("select distinct intType, month(incDate) as mon,year(incDate) as yea,(select sum(incAmount)from income_details t2 where t2.intType=t.intType and month(t2.incDate) = month(t.incDate) and year(t2.incDate) = year(t.incDate)) as Sum from income_details t");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				IncomeCalc i = new IncomeCalc();
				
				i.setType(rs.getString(1));
				i.setMonth(rs.getString(2));
				i.setYear(rs.getString(3));
				i.setTotal(rs.getDouble(4));
				
				list.add(i);
			}
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public static List<IncomeCalc> getTotalIncomes(){
		List<IncomeCalc> list = new ArrayList<IncomeCalc>();
		
		try {
			Connection con = IncomeService.getConnection();
			PreparedStatement ps = con.prepareStatement(" select distinct month(incDate) as month,year(incDate) as year,(select sum(incAmount) from income_details t2 where month(t2.incDate) = month(t.incDate) and year(t2.incDate) = year(t.incDate)) as Sum from income_details t");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				IncomeCalc i = new IncomeCalc();
				
				i.setMonth(rs.getString(1));
				i.setYear(rs.getString(2));
				i.setTotal(rs.getDouble(3));
				
				list.add(i);
			}
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}

