package utill;

import java.util.ArrayList;

public class GenerateSupplierID {
	public static String generateSupplierID(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = "SUPL00" + next;
		while(arrayList.contains(id)) {
			next++;
			id = "SUPL00" + next;
		}
		return id;
	}

}
	
	
	

