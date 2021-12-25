package com.min.edu.vo.worklog;

import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;

public class WorkLog {

	private int worklog_no;
	private String worklog_reg_dt;
	private String worklog_modify_dt;
	private String worklog_content;
	private String worklog_delflag;
	private int emp_no;
	private String worklog_title;

	private Emp emp;
	private Position position;

	@Override
	public String toString() {
		return "WorkLog [worklog_no=" + worklog_no + ", worklog_reg_dt=" + worklog_reg_dt + ", worklog_modify_dt="
				+ worklog_modify_dt + ", worklog_content=" + worklog_content + ", worklog_delflag=" + worklog_delflag
				+ ", emp_no=" + emp_no + ", worklog_title=" + worklog_title + ", emp=" + emp + ", position=" + position
				+ "]";
	}

	public WorkLog() {
		super();
	}

	public WorkLog(int worklog_no, String worklog_content) {
		super();
		this.worklog_no = worklog_no;
		this.worklog_content = worklog_content;
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

	public String getWorklog_delflag() {
		return worklog_delflag;
	}

	public void setWorklog_delflag(String worklog_delflag) {
		this.worklog_delflag = worklog_delflag;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getWorklog_title() {
		return worklog_title;
	}

	public void setWorklog_title(String worklog_title) {
		this.worklog_title = worklog_title;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

}
