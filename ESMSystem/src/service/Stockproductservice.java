package service;

import java.util.ArrayList;

import model.Salary;
import model.Stockproduct;

public interface Stockproductservice {

	void addProduct(Stockproduct product);
	public ArrayList<Stockproduct> getpoducts();
	public void updatestockproducts(Stockproduct ID);
	public Stockproduct getOnepoducts(String id);
}
