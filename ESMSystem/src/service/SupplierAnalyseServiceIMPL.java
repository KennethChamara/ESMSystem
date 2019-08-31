package service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.CommonSupplProduct;
import model.ProductDetails;
import model.SupplierDetails;
import utill.DBConnectionUtil;






public class SupplierAnalyseServiceIMPL implements SupplierAnalyseService {
	


	private static Connection connection;	//create connection attribute

	private static Connection connection2;
	

	private static PreparedStatement preparedStatement;	

	private ResultSet resultSet;

	
	private static PreparedStatement preparedStatement2;	

	private ResultSet resultSet2;
	private ResultSet resultSet3;

	


	static {
		createTable();
	}

public static void createTable() {
	try {
		connection = DBConnectionUtil.getDBConnection();//create connection
		
		/*create assignment table if not exist*/
		preparedStatement = connection.prepareStatement("create table IF NOT EXISTS Vacancy (vacancyId int not null, vacancycategory varchar(55),Duedate varchar(55),Description varchar(55),image longblob, primary key(vacancyId)");
		
		
		
		
		preparedStatement.execute();


	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			connection.close();//close the connection
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}


public void addsupplier(SupplierDetails supplidesc){

	
		

		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Supplierdetails values(?,?,?,?,?,?);");//implementation of insert query
			
			preparedStatement.setString(1, supplidesc.getSupplierId());//setting values
			preparedStatement.setString(2, supplidesc.getCompanyName());//setting values
			preparedStatement.setString(3, supplidesc.getFullName());//setting values
			preparedStatement.setString(4, supplidesc.getAddress());//setting values
			preparedStatement.setString(5,supplidesc.getPhonenumber());
			preparedStatement.setString(6,supplidesc.getEmailaddress());
			
 
			preparedStatement.execute();//executing query

			connection.close();//finally close the databse connection

		} catch (SQLException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

public ArrayList<SupplierDetails> getSupplierdetailsList() {
	 
	ArrayList<SupplierDetails> SuppList = new ArrayList<>();//create ArrayList object to add assignments
	
	
	
	try {
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement = connection.prepareStatement("select * from Supplierdetails");//select all assignment in constantvalues class and "select_all_assignment" is static variable inside the constant values class

		resultSet = preparedStatement.executeQuery();//execute the select_all_assignment query

		
		
		while (resultSet.next()) {
			SupplierDetails  supp= new SupplierDetails ();	//create Assignment object
			supp.setSupplierId(resultSet.getString(1));/*setting all data to Assignment object taking from database*/
			supp.setCompanyName(resultSet.getString(2));
			supp.setFullName(resultSet.getString(3));
			supp.setAddress(resultSet.getString(4));
			supp.setPhonenumber(resultSet.getString(5));
			supp.setEmailaddress(resultSet.getString(6));
			
			
			SuppList.add(supp);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	return SuppList; //return assignmentList object

}
public void addproductdetails (ProductDetails prodDeta)
{


	try {
		connection = DBConnectionUtil.getDBConnection();
		String supId = prodDeta.getPsupplierName();
		preparedStatement2= connection.prepareStatement("select SupplierId from Supplierdetails where companyName='"+supId.trim()+"'");
		//preparedStatement2.setString(1, prodDeta.getPsupplierName());
		resultSet2 = preparedStatement2.executeQuery();
		
		CommonSupplProduct common=new CommonSupplProduct();
	
		
		
		if(resultSet2.next())
		{
			String SuppId=resultSet2.getString(1);
			common.setSupplierId(SuppId);
			
		}
		
			
			common.setProductId(prodDeta.getProductId());
			
			
			preparedStatement = connection.prepareStatement("insert into purchasedproduct values(?,?,?,?,?);");//implementation of insert query
			
			
			preparedStatement.setString(1, prodDeta.getProductId());//setting values
			
			preparedStatement.setString(2, prodDeta.getProductName());//setting values
			preparedStatement.setInt(3, prodDeta.getQuantity());//setting values
			preparedStatement.setDouble(4,prodDeta.getDiscount());
			preparedStatement.setDouble(5,prodDeta.getUnitprice());
			

			preparedStatement.execute();//executing query
		
		
			
		connection.close();
		addCommonTableDetails(common);
		
		//connection.close();//finally close the databse connection

	} catch (SQLException e) {

		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}
public ArrayList<ProductDetails> getProductdetailsList()
{
	
	ArrayList<ProductDetails> ProductList = new ArrayList<>();

	
	try {
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement = connection.prepareStatement("select * from purchasedproduct");

		resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			ProductDetails  product= new ProductDetails ();
			product.setProductId(resultSet.getString(1));
			
			product.setProductName(resultSet.getString(2));
			product.setQuantity(resultSet.getInt(3));
			product.setDiscount(resultSet.getDouble(4));
			product.setUnitprice(resultSet.getDouble(5));
			
			
			ProductList.add(product);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	return ProductList; 

}

public void addCommonTableDetails(CommonSupplProduct comeen)
{
	

	try {
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement = connection.prepareStatement("insert into Supplierproduct values(?,?);");
		
		preparedStatement.setString(1, comeen.getSupplierId());
		preparedStatement.setString(2, comeen.getProductId());
	

		preparedStatement.execute();

		connection.close();

	} catch (SQLException e) {

		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
	



//return Marks object after setting all the values only taking studentId as argument
public SupplierDetails getsupplierById(String ID) {
	
	SupplierDetails mks = new SupplierDetails();		//create Marks object
	
	try {
		connection = DBConnectionUtil.getDBConnection();
	
	preparedStatement = connection.prepareStatement("select * from Supplierdetails where  SupplierId=?;");    //select query that takes all values from marks tables 
	
	preparedStatement.setString(1, ID);

	resultSet = preparedStatement.executeQuery();	//execute the query
	
	resultSet.first();
	
	mks.setSupplierId(resultSet.getString(1));	
 												
	mks.setCompanyName(resultSet.getString(2));
	mks.setFullName(resultSet.getString(3));	
	mks.setAddress(resultSet.getString(4));
	mks.setPhonenumber(resultSet.getString(5));
	mks.setEmailaddress(resultSet.getString(6));
	
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return mks;			
}



public void updateSupplierdetails(SupplierDetails ID) {
	try {
		connection = DBConnectionUtil.getDBConnection();	//create connection
		
		preparedStatement = connection.prepareStatement("update Supplierdetails set  companyName=?,FullName=?, Address=?,phoneNumber=?,EmailAddress=?  where SupplierId=?;");//update query that set values to marks table
		
		preparedStatement.setString(1,ID.getCompanyName());
		preparedStatement.setString(2, ID.getFullName());
		preparedStatement.setString(3, ID.getAddress());
		preparedStatement.setString(4, ID.getPhonenumber());
		preparedStatement.setString(5, ID.getEmailaddress());
		preparedStatement.setString(6, ID.getSupplierId());
		
		preparedStatement.execute();		//execute query
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}

public void deleteallrelatedsupplierById (SupplierDetails ID)
{

	
	try {
		connection = DBConnectionUtil.getDBConnection();
		String supId = ID.getSupplierId();
		preparedStatement2= connection.prepareStatement("select COUNT(CommonSupplierId) from supplierproduct where  CommonSupplierId='"+supId.trim()+"'");
		
		resultSet2 = preparedStatement2.executeQuery();
		
		//CommonSupplProduct common=new CommonSupplProduct();
	
		resultSet2.first();
	
		int count=resultSet2.getInt(1);
		//common.setSupplierId(supId);
		if(count==0)
		{
			deletesupplierById(supId);
		}
		else
		{
			deletecommontablesupplierById(supId);
			deletesupplierById(supId);
		}
		
	} catch (SQLException e) {

		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}


public void deletesupplierById(String ID) {
	try {
				//create connection
		
		preparedStatement = connection.prepareStatement("delete from supplierdetails where SupplierId=?;");
		
		preparedStatement.setString(1, ID);	//set studentId
		
		preparedStatement.execute();	//execute query
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
	public void deletecommontablesupplierById(String ID) {
		try {
		
			connection2 = DBConnectionUtil.getDBConnection();
			preparedStatement2 = connection2.prepareStatement("delete from supplierproduct where CommonSupplierId=?;");
			
			//preparedStatement= connection.prepareStatement("select SupplierId from Supplierdetails where companyName='"+supId.trim()+"'");
			
			preparedStatement2.setString(1, ID);	//set studentId
			
			preparedStatement2.execute();	//execute query
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
	
	
	public ProductDetails getproductById(String ID) {
		
		ProductDetails mks = new ProductDetails();		//create Marks object
		
		try {
			connection = DBConnectionUtil.getDBConnection();
		
		preparedStatement = connection.prepareStatement("select * from purchasedproduct where  productId=?;");    //select query that takes all values from marks tables 
		
		preparedStatement.setString(1, ID);

		resultSet = preparedStatement.executeQuery();	//execute the query
		
		resultSet.first();
		
		mks.setProductId(resultSet.getString(1));	
	 												
		mks.setProductName(resultSet.getString(2));
		mks.setQuantity(resultSet.getInt(3));	
		mks.setDiscount(resultSet.getDouble(4));
		mks.setUnitprice(resultSet.getDouble(5));
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return mks;			
	}

	public void updateproductsdetails(ProductDetails ID) {
		try {
			connection = DBConnectionUtil.getDBConnection();	//create connection
			
			preparedStatement = connection.prepareStatement("update purchasedproduct set  ProductName=?,purchasedquantity=?, discount=?,unitPrice=?  where productId=?;");
			
			preparedStatement.setString(1,ID.getProductName());
			preparedStatement.setInt(2, ID.getQuantity());
			preparedStatement.setDouble(3, ID.getDiscount());
			preparedStatement.setDouble(4, ID.getUnitprice());
			preparedStatement.setString(5, ID.getProductId());
			
			
			preparedStatement.execute();		//execute query
			
			
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}

public void deleteallrelatedproductById (ProductDetails ID)
{

	
	try {
		connection = DBConnectionUtil.getDBConnection();
		String prdId = ID.getProductId();
		preparedStatement2= connection.prepareStatement("select COUNT(CommonProductId) from supplierproduct where  CommonProductId='"+prdId.trim()+"'");
		
		resultSet2 = preparedStatement2.executeQuery();
		
		//CommonSupplProduct common=new CommonSupplProduct();
	
		resultSet2.first();
	
		int count=resultSet2.getInt(1);
		//common.setSupplierId(supId);
		if(count==0)
		{
			deleteproductById(prdId);
		}
		else
		{
			deletecommontableproductById(prdId);
			deletesupplierById(prdId);
		}
		
	} catch (SQLException e) {

		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}
public void deleteproductById(String ID) {
	try {
				//create connection
		
		preparedStatement = connection.prepareStatement("delete from purchasedproduct where productId =?;");
		
		preparedStatement.setString(1, ID);	//set studentId
		
		preparedStatement.execute();	//execute query
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
public void deletecommontableproductById(String ID) {
	try {
	
		connection2 = DBConnectionUtil.getDBConnection();
		preparedStatement2 = connection2.prepareStatement("delete from supplierproduct where CommonProductId=?;");
		
		//preparedStatement= connection.prepareStatement("select SupplierId from Supplierdetails where companyName='"+supId.trim()+"'");
		
		preparedStatement2.setString(1, ID);	//set studentId
		
		preparedStatement2.execute();	//execute query
		
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			connection2.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
	
	
	
	
}













	






