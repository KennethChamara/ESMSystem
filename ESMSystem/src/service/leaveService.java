package service;

import java.util.ArrayList;

import model.leave;
import model.listleave;

public interface leaveService {
	public void addLeaves(leave leaveOne);
	public ArrayList<listleave> getleves(int val);
	public ArrayList<leave> getRequestedlevesOfAemployee(String ID);
	public void ApproveLeave(String id);	
	public void updateLeave(leave leaveOne);
	public void DeleteLeave(String id);
	public listleave selectLeave(String id);
}
