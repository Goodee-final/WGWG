package com.min.edu.vo.chat;

public class ChatRoom {

	private int chat_room_no;
	private String chat_room_nm;
	private String chat_room_reg_dt;
	private String chat_members;

	public ChatRoom() {
		super();
	}

	@Override
	public String toString() {
		return "ChatRoom [chat_room_no=" + chat_room_no + ", chat_room_nm=" + chat_room_nm + ", chat_room_reg_dt="
				+ chat_room_reg_dt + ", chat_members=" + chat_members + "]";
	}

	public int getChat_room_no() {
		return chat_room_no;
	}

	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}

	public String getChat_room_nm() {
		return chat_room_nm;
	}

	public void setChat_room_nm(String chat_room_nm) {
		this.chat_room_nm = chat_room_nm;
	}

	public String getChat_room_reg_dt() {
		return chat_room_reg_dt;
	}

	public void setChat_room_reg_dt(String chat_room_reg_dt) {
		this.chat_room_reg_dt = chat_room_reg_dt;
	}

	public String getChat_members() {
		return chat_members;
	}

	public void setChat_members(String chat_members) {
		this.chat_members = chat_members;
	}

}
