package com.min.edu.vo.chat;

public class ChatMember {

	private int mem_no;
	private String chat_member_st;
	private String chat_member_join_dt;
	private int emp_no;

	public ChatMember() {
		super();
	}

	@Override
	public String toString() {
		return "ChatMember [mem_no=" + mem_no + ", chat_member_st=" + chat_member_st + ", chat_member_join_dt="
				+ chat_member_join_dt + ", emp_no=" + emp_no + "]";
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getChat_member_st() {
		return chat_member_st;
	}

	public void setChat_member_st(String chat_member_st) {
		this.chat_member_st = chat_member_st;
	}

	public String getChat_member_join_dt() {
		return chat_member_join_dt;
	}

	public void setChat_member_join_dt(String chat_member_join_dt) {
		this.chat_member_join_dt = chat_member_join_dt;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

}
