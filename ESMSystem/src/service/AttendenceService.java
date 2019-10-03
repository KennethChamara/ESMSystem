package service;

import java.util.ArrayList;

import model.Attendance;
import model.Attendancelist;

public interface AttendenceService {
	
	public void insertAttendence(Attendance attendence);
	public ArrayList<String> getEmployeeIDs();
	public ArrayList<Attendance> getOneDayAllAttendance(String DATE);
	public ArrayList<Attendance> getSingleMonthlyAttendance(String ID,int month);
	public void StateChange(String id);
	public ArrayList<Attendancelist> getMonthlyAttendance(int month);
	public double getSingleMonthlyAttendancePrnt(String ID,int month);

}
