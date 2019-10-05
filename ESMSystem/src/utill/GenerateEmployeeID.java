package utill;

import java.util.ArrayList;

public class GenerateEmployeeID {
	
	public static String GenerateEmpID (ArrayList<String> arrayList) {
		
		String id;
		int next = arrayList.size();
		next++;
		id = "Emp00" + next;
		while(arrayList.contains(id)) {
			next++;
			id = "Emp00" + next;
		}
		return id;
	}

}
