package service;

import java.util.ArrayList;

import model.Attendance;

public interface AttendenceService {
	
	public void insertAttendence(Attendance attendence);
	public ArrayList<String> getEmployeeIDs();
	public ArrayList<Attendance> getOneDayAllAttendance();
	public void StateChange(String id);

}
