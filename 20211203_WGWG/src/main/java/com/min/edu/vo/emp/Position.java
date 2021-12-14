package com.min.edu.vo.emp;

public class Position {

	private int position_no;
	private String position_nm;
	
	
	public Position() {
		super();
	}

	public Position(int position_no, String position_nm) {
		super();
		this.position_no = position_no;
		this.position_nm = position_nm;
	}

	public int getPosition_no() {
		return position_no;
	}

	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}

	public String getPosition_nm() {
		return position_nm;
	}

	public void setPosition_nm(String position_nm) {
		this.position_nm = position_nm;
	}

	@Override
	public String toString() {
		return "Position [position_no=" + position_no + ", position_nm=" + position_nm + "]";
	}
	
}
