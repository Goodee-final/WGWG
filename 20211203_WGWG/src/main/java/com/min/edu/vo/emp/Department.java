package com.min.edu.vo.emp;

import org.springframework.stereotype.Component;

@Component
public class Department {

	private int dept_no;
	private String dept_nm;

	@Override
	public String toString() {
		return "Department [dept_no=" + dept_no + ", dept_nm=" + dept_nm + "]";
	}

	public Department() {
		super();
	}
	
	public Department(int dept_no, String dept_nm) {
		super();
		this.dept_no = dept_no;
		this.dept_nm = dept_nm;
	}

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

}
