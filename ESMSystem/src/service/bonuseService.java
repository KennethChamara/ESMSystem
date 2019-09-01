package service;

import java.util.ArrayList;

import model.Bonuse;

public interface bonuseService {
	

	public void addBounce(Bonuse bouns);
	public ArrayList<Bonuse> getbounce();
	public Bonuse selectBounce(String id);
	public void bounceUpdate(Bonuse bonus);
	public void bounceDelete(String id);
}
