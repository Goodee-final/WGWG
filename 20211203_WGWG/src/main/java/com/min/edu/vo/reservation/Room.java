package com.min.edu.vo.reservation;

public class Room {

	private int room_no;
	private String room_nm;
	
	public Room() {

	}

	public Room(String room_nm, int room_no) {
		this.room_nm = room_nm;
		this.room_no = room_no;
	}

	public String getRoom_nm() {
		return room_nm;
	}

	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	@Override
	public String toString() {
		return "Room [room_nm=" + room_nm + ", room_no=" + room_no + "]";
	}
	
}
