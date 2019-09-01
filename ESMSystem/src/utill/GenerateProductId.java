package utill;

import java.util.ArrayList;

import model.ProductDetails;

public class GenerateProductId {
	public static String generateProductId(ArrayList<ProductDetails> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = "ProD00" + next;
		while(arrayList.contains(id)) {
			next++;
			id = "ProD00" + next;
		}
		return id;
	}

}
	