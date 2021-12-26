package com.min.edu.vo.chatting;

import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;

public class ChatMember {

	private int mem_no;
	private String chat_member_st;
	private String chat_member_join_dt;
	private int emp_no;

	private Emp empVo;
	private Department deptVo;
	private Position positionVo;

	@Override
	public String toString() {
		return "ChatMember [mem_no=" + mem_no + ", chat_member_st=" + chat_member_st + ", chat_member_join_dt="
				+ chat_member_join_dt + ", emp_no=" + emp_no + ", empVo=" + empVo + ", deptVo=" + deptVo
				+ ", positionVo=" + positionVo + "]";
	}

	public ChatMember() {
		super();
	}

	public ChatMember(int mem_no, String chat_member_st, String chat_member_join_dt, int emp_no, Emp empVo,
			Department deptVo, Position positionVo) {
		super();
		this.mem_no = mem_no;
		this.chat_member_st = chat_member_st;
		this.chat_member_join_dt = chat_member_join_dt;
		this.emp_no = emp_no;
		this.empVo = empVo;
		this.deptVo = deptVo;
		this.positionVo = positionVo;
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

	public Emp getEmpVo() {
		return empVo;
	}

	public void setEmpVo(Emp empVo) {
		this.empVo = empVo;
	}

	public Department getDeptVo() {
		return deptVo;
	}

	public void setDeptVo(Department deptVo) {
		this.deptVo = deptVo;
	}

	public Position getPositionVo() {
		return positionVo;
	}

	public void setPositionVo(Position positionVo) {
		this.positionVo = positionVo;
	}

}
