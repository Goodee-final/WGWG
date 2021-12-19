package com.min.edu.vo.attendence;

import java.util.Map;

import com.min.edu.vo.emp.Emp;

public class WorkRecord {

	private int emp_no;
//	private Map<String, Object> work_log;
	private String work_log;
	
	private Emp edto;
	
	
	
	public WorkRecord() {
		super();
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getWork_log() {
		return work_log;
	}
	public void setWork_log(String work_log) {
		this.work_log = work_log;
	}
	
	public Emp getEdto() {
		return edto;
	}
//	public Map<String, Object> getWork_log() {
//		return work_log;
//	}
//	public void setWork_log(Map<String, Object> work_log) {
//		this.work_log = work_log;
//	}
	public void setEdto(Emp edto) {
		this.edto = edto;
	}
	@Override
	public String toString() {
		return "WorkRecord [emp_no=" + emp_no + ", work_log=" + work_log + ", edto=" + edto + "]";
	}
	
	
}
