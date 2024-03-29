package utill;



public class CommonConstants {
	
	/** Constant for config.properties key for query file path */
	public static final String QUERY_XML = "queryFilePath";

	/** Constant for file path of config.properties */
	public static final String PROPERTY_FILE = "config.properties";

	/** Constant for query tag in salaryQuery.xml */
	public static final String TAG_NAME = "query";

	/** Constant for query id in salaryQuery.xml */
	public static final String ATTRIB_ID = "id";
	
	/** Constant for employee id prefix */
	public static final String SALARY_ID_PREFIX = "S300";

	/** Constant for comma */
	public static final String COMMA = ",";

	/** Constant for url key of MySQL database in config.properties */
	public static final String URL = "url";

	/** Constant for user name key of MySQL database in config.properties */
	public static final String USERNAME = "username";

	/** Constant for password key of MySQL database in config.properties */
	public static final String PASSWORD = "password";

	/** Constant for driver name key of MySQL database in config.properties */
	public static final String DRIVER_NAME = "driverName";

	/** Constant for query id of drop_table in salaryQuery.xml */
	public static final String QUERY_ID_DROP_TABLE = "drop_table";

	/** Constant for query id of create_table in salaryQuery.xml */
	public static final String QUERY_ID_CREATE_TABLE = "create_salary_table";

	/** Constant for query id of insert salary in salaryQuery.xml */
	public static final String QUERY_ID_INSERT_SALARY = "insert_salary";

	/** Constant for query id of get an salary in salaryQuery.xml */
	public static final String QUERY_ID_GET_SALARY = "salary_by_id";

	/** Constant for query id of get an salary in salaryQuery.xml */
	public static final String QUERY_ID_SEARCH_SALARY = "search_salary";
	
	public static final String QUERY_ID_SEARCH_SALARY_MONTHLY = "search_salary_M";

	
	/** Constant for query id of get all salary in salaryQuery.xml */
	public static final String QUERY_ID_ALL_SALARY = "all_salarys";

	/** Constant for query id of remove a salary in salaryQuery.xml */
	public static final String QUERY_ID_REMOVE_SALARY = "remove_salary";

	/** Constant for query id of update a salary in salaryQuery.xml */
	public static final String QUERY_ID_UPDATE_EMPLOYEE = "update_salary";

	/** Constant for query id of get all salary ids in salaryQuery.xml */
	public static final String QUERY_ID_GET_SALARY_IDS = "salary_ids";
	
	
	//                            Leave Constants
	//==========================================================================================================
	
	
	public static final String LEAVE_ID_PREFIX = "LV00";
	
	public static final String QUERY_ID_GET_LEAVES_IDS = "leave_ids";
	
	public static final String QUERY_ID_DROP_TABLE_LEAVES = "drop_leaves";
	
	public static final String QUERY_ID_CREATE_TABLE_LEAVES = "create_leaves";
	
	public static final String QUERY_ID_ADD_LEAVES = "add_leaves";
	
	public static final String QUERY_ID_UPDATE_LEAVES = "update_requested_leaves";
	
	public static final String QUERY_ID_GET_REQUSETED_LEAVES = "get_requested_leaves";
	
	public static final String QUERY_ID_GET_REQUSETED_LEAVES_OF_A_EMPLOYEE = "get_requested_leaves_ofAemp";
	
	public static final String QUERY_ID_GET_APPROVED_LEAVES = "get_approved_leaves";
	
	public static final String QUERY_ID_APPROV_LEAVE = "approve_leave";
	
	public static final String QUERY_ID_DELETE_LEAVE = "delete_leave";
	
	public static final String QUERY_ID_SELECT_LEAVE = "select_leave";
	
	//                              Attendance Constants
	//============================================================================================================
	public static final String QUERY_ID_CREATE_TABLE_ATTENDANCE = "create_attendance";
	
	public static final String QUERY_ID_DROP_TABLE_ATTENDANCE = "drop_attendance";
	
	public static final String QUERY_ID_GET_EMPLOYEE_IDS = "employee_ids";
	
	public static final String QUERY_ID_GET_ATTENDANCE_IDS = "get_attendance_ids";
	
	public static final String QUERY_GET_TODAY_ATTENDANCE = "getAll_attendance";
	
	public static final String QUERY_ID_GET_ATTENDANCE = "getAll_attendance";
	
	public static final String QUERY_ID_GET_DATES = "get_dates_of_leaves";
	
	public static final String QUERY_ID_GET_ATTENDANCE_INSERT = "insert_attendance";
	
	public static final String QUERY_ID_GET_ATTENDANCE_STATE_CHANGE = "state_change";
	
	public static final String QUERY_ID_GET_ATTENDANCE_SINGLE = "getSingleMonthlyAttendance";
	
	public static final String QUERY_ID_GET_ATTENDANCE_MONTHLY_ATTENDANCE = "getMonthlyAttendance";
	
	public static final String QUERY_ID_GET_ATTENDANCE_MONTHLY_PRESENT = "getPresentDatesOFaMonth";
	
	public static final String QUERY_ID_GET_ATTENDANCE_ENTER_ONE = "enterAttendancOne";
	
	public static final String QUERY_ID_GET_ATTENDANCE_ENTER_TWO = "enterAttendancTwo";
	
	public static final String QUERY_ID_GET_ATTENDANCE_ON_LEAVE = "onleave";
	
	public static final String ATTENDANCE_ID_PREFIX = "A0";
	
	
	
	// Constant ============================================================================================================
	
	/** Constant for Column index one */
	public static final int COLUMN_INDEX_ONE = 1;
	
	/** Constant for Column index two */
	public static final int COLUMN_INDEX_TWO = 2;
	
	/** Constant for Column index three */
	public static final int COLUMN_INDEX_THREE = 3;
	
	/** Constant for Column index four */
	public static final int COLUMN_INDEX_FOUR = 4;
	
	/** Constant for Column index five */
	public static final int COLUMN_INDEX_FIVE = 5;
	
	/** Constant for Column index six */
	public static final int COLUMN_INDEX_SIX = 6;
	
	/** Constant for Column index seven */
	public static final int COLUMN_INDEX_SEVEN = 7;
	
	/** Constant for Column index eight */
	public static final int COLUMN_INDEX_EIGHT = 8;
	
	/** Constant for Column index nine */
	public static final int COLUMN_INDEX_NINE = 9;
	
	/** Constant for Column index ten */
	public static final int COLUMN_INDEX_TEN = 10;
	
	public static final int COLUMN_INDEX_ELEVEN = 11;
	
	public static final int COLUMN_INDEX_TWELVE = 12;
	
	public static final int COLUMN_INDEX_THIRTEEN = 13;
	
	public static final int COLUMN_INDEX_FOURTEEN = 14;
	
	public static final int COLUMN_INDEX_FIFTEEN = 15;
	


}
