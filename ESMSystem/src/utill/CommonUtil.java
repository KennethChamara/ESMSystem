package utill;

import java.io.IOException;
import java.util.ArrayList;
import service.*;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CommonUtil {
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(IsalaryService.class.getName());

	public static final Properties properties = new Properties();

	static {
		try {
			
			// Read the property only once when load the class
			properties.load(QueryUtil.class.getResourceAsStream(CommonConstants.PROPERTY_FILE));
			
		} catch (IOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	public static String generateIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = CommonConstants.SALARY_ID_PREFIX + next;
		if (arrayList.contains(id)) {
			next++;
			id = CommonConstants.SALARY_ID_PREFIX + next;
		}
		return id;
	}
	
	public static String generateLeaveIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = CommonConstants.LEAVE_ID_PREFIX + next;
		while (arrayList.contains(id)) {
			next++;
			id = CommonConstants.LEAVE_ID_PREFIX + next;
		}
		return id;
	}
}
