package com.min.edu.vo.schedule;

import java.util.List;

public class ScheduleVO {
	private int schedule_no;
	private String schedule_title;
	private String schedule_content;
	private String schedule_startday;
	private String schedule_endday;
	private String allday;
	private String schedule_chk;
	private int emp_no;
	private List<SharedScheduleVO> sharedschedule;
	
	public ScheduleVO() {		
	}

	public ScheduleVO(int schedule_no, String schedule_title, String schedule_content, String schedule_startday,
			String schedule_endday, String allday, String schedule_chk, int emp_no,
			List<SharedScheduleVO> sharedschedule) {
		super();
		this.schedule_no = schedule_no;
		this.schedule_title = schedule_title;
		this.schedule_content = schedule_content;
		this.schedule_startday = schedule_startday;
		this.schedule_endday = schedule_endday;
		this.allday = allday;
		this.schedule_chk = schedule_chk;
		this.emp_no = emp_no;
		this.sharedschedule = sharedschedule;
	}

	@Override
	public String toString() {
		return "ScheduleVO [schedule_no=" + schedule_no + ", schedule_title=" + schedule_title + ", schedule_content="
				+ schedule_content + ", schedule_startday=" + schedule_startday + ", schedule_endday=" + schedule_endday
				+ ", allday=" + allday + ", schedule_chk=" + schedule_chk + ", emp_no=" + emp_no + ", sharedschedule="
				+ sharedschedule + "]";
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public String getSchedule_title() {
		return schedule_title;
	}

	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}

	public String getSchedule_content() {
		return schedule_content;
	}

	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}

	public String getSchedule_startday() {
		return schedule_startday;
	}

	public void setSchedule_startday(String schedule_startday) {
		this.schedule_startday = schedule_startday;
	}

	public String getSchedule_endday() {
		return schedule_endday;
	}

	public void setSchedule_endday(String schedule_endday) {
		this.schedule_endday = schedule_endday;
	}

	public String getAllday() {
		return allday;
	}

	public void setAllday(String allday) {
		this.allday = allday;
	}

	public String getSchedule_chk() {
		return schedule_chk;
	}

	public void setSchedule_chk(String schedule_chk) {
		this.schedule_chk = schedule_chk;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public List<SharedScheduleVO> getSharedschedule() {
		return sharedschedule;
	}

	public void setSharedschedule(List<SharedScheduleVO> sharedschedule) {
		this.sharedschedule = sharedschedule;
	}
	
	
}
