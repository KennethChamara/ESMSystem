package service;

import java.util.ArrayList;

import model.CommonSupplProduct;
import model.ProductDetails;
import model.SupplierDetails;




public interface SupplierAnalyseService {
	
	public void addsupplier( SupplierDetails supplides);

	public ArrayList<SupplierDetails> getSupplierdetailsList(); 
	
	public void addproductdetails(ProductDetails prodDeta);
	
	public ArrayList<ProductDetails> getProductdetailsList(); 
	
	public void addCommonTableDetails(CommonSupplProduct comeen);
	
	public SupplierDetails getsupplierById(String ID);
	
	public void updateSupplierdetails(SupplierDetails ID);
	
	public void deleteallrelatedsupplierById (SupplierDetails ID);
	
	public void deletesupplierById(String ID);
	
	public void deletecommontablesupplierById(String ID);
	
	public ProductDetails getproductById(String ID); 
	
	public void updateproductsdetails(ProductDetails ID);
	
	public void deleteallrelatedproductById (ProductDetails ID);
	
	public void deleteproductById(String ID);
	
	public void deletecommontableproductById(String ID);
	
	
	//public void generatesupplierdetailsforpdf();
	

}
