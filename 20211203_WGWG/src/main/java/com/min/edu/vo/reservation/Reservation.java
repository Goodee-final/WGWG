package com.min.edu.vo.reservation;

import com.min.edu.vo.emp.Emp;

public class Reservation {

	private int res_no;
	private String res_title;
	private String res_dt;
	private String res_et;
	private int room_no;
	private int emp_no;
	
	private Emp eDto;
	private Room rDto;
	
	
	public Reservation() {
		
	}

	public Reservation(int res_no, String res_title, String res_dt, int room_no, int emp_no) {
		this.res_no = res_no;
		this.res_title = res_title;
		this.res_dt = res_dt;
		this.room_no = room_no;
		this.emp_no = emp_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getRes_title() {
		return res_title;
	}

	public void setRes_title(String res_title) {
		this.res_title = res_title;
	}

	public String getRes_dt() {
		return res_dt;
	}

	public void setRes_dt(String res_dt) {
		this.res_dt = res_dt;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	
	
	public String getRes_et() {
		return res_et;
	}

	public void setRes_et(String res_et) {
		this.res_et = res_et;
	}

	@Override
	public String toString() {
		return "Reservation [res_no=" + res_no + ", res_title=" + res_title + ", res_dt=" + res_dt + ", room_no="
				+ room_no + ", emp_no=" + emp_no + "]";
	}
	
}
