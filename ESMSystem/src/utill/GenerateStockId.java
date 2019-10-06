package utill;

import model.Stockproduct;

import java.util.ArrayList;



public class GenerateStockId {
	public static String generateStockId(ArrayList<Stockproduct> arrayList) {
	
		String id;
		int next = arrayList.size();
		next++;
		id = "StKD00" + next;
		while(arrayList.contains(id)) {
			next++;
			id = "StKD00" + next;
		}
		return id;
	}
		
		
}





















	