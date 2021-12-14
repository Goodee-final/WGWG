package com.min.edu.vo.schedule;



public class SharedScheduleVO {
	private int shared_schedule_no;
	private int emp_no;
	private String schedule_chk;
	private int schedule_no;
	public SharedScheduleVO() {
	}
	public SharedScheduleVO(int shared_schedule_no, int emp_no, String schedule_chk, int schedule_no) {
		super();
		this.shared_schedule_no = shared_schedule_no;
		this.emp_no = emp_no;
		this.schedule_chk = schedule_chk;
		this.schedule_no = schedule_no;
	}
	@Override
	public String toString() {
		return "SharedScheduleVO [shared_schedule_no=" + shared_schedule_no + ", emp_no=" + emp_no + ", schedule_chk="
				+ schedule_chk + ", schedule_no=" + schedule_no + "]";
	}
	public int getShared_schedule_no() {
		return shared_schedule_no;
	}
	public void setShared_schedule_no(int shared_schedule_no) {
		this.shared_schedule_no = shared_schedule_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getSchedule_chk() {
		return schedule_chk;
	}
	public void setSchedule_chk(String schedule_chk) {
		this.schedule_chk = schedule_chk;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	
}
