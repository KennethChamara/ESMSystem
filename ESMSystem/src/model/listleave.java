package model;

public class listleave extends leave {
	private String name;
	private String possion;

	public listleave() {
		super();
		this.name = null;
		this.possion = null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPossion() {
		return possion;
	}

	public void setPossion(String possion) {
		this.possion = possion;
	}

}
