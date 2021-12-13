package com.min.edu.vo.worklog;

public class WorkLog {

	private int worklog_no;
	private String worklog_reg_dt;
	private String worklog_modify_dt;
	private String worklog_content;
	private int emp_no;

	public WorkLog() {
		super();
	}

	@Override
	public String toString() {
		return "WorkLog [worklog_no=" + worklog_no + ", worklog_reg_dt=" + worklog_reg_dt + ", worklog_modify_dt="
				+ worklog_modify_dt + ", worklog_content=" + worklog_content + ", emp_no=" + emp_no + "]";
	}

	public int getWorklog_no() {
		return worklog_no;
	}

	public void setWorklog_no(int worklog_no) {
		this.worklog_no = worklog_no;
	}

	public String getWorklog_reg_dt() {
		return worklog_reg_dt;
	}

	public void setWorklog_reg_dt(String worklog_reg_dt) {
		this.worklog_reg_dt = worklog_reg_dt;
	}

	public String getWorklog_modify_dt() {
		return worklog_modify_dt;
	}

	public void setWorklog_modify_dt(String worklog_modify_dt) {
		this.worklog_modify_dt = worklog_modify_dt;
	}

	public String getWorklog_content() {
		return worklog_content;
	}

	public void setWorklog_content(String worklog_content) {
		this.worklog_content = worklog_content;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

}
