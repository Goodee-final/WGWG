package com.min.edu.vo.emp;

import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Component;

@Component
public class Emp {

	@NotNull(message = "사원번호를 입력해주세요.")
	private int emp_no;
	
	private String emp_nm;
	
	@NotNull(message = "비밀번호를 입력해주세요.")
	private String pw;
	private String email;
	private String photo;
	private String address;
	private String tel;
	private String hiredate;
	private String work_st;
	private int position_no;
	private int dept_no;
	
	
	public Emp() {}
	
	public Emp(int emp_no, String emp_nm, String pw, String email, String photo, String address, String tel,
			String hiredate, String work_st, int position_no, int dept_no) {
		this.emp_no = emp_no;
		this.emp_nm = emp_nm;
		this.pw = pw;
		this.email = email;
		this.photo = photo;
		this.address = address;
		this.tel = tel;
		this.hiredate = hiredate;
		this.work_st = work_st;
		this.position_no = position_no;
		this.dept_no = dept_no;
	}
	
	
	
	public Emp(String emp_nm, String email, String photo, String address, String tel, String hiredate, String work_st,
			int position_no, int dept_no) {
		super();
		this.emp_nm = emp_nm;
		this.email = email;
		this.photo = photo;
		this.address = address;
		this.tel = tel;
		this.hiredate = hiredate;
		this.work_st = work_st;
		this.position_no = position_no;
		this.dept_no = dept_no;
	}

	@Override
	public String toString() {
		return "Emp [emp_no=" + emp_no + ", emp_nm=" + emp_nm + ", pw=" + pw + ", email=" + email + ", photo=" + photo
				+ ", address=" + address + ", tel=" + tel + ", hiredate=" + hiredate + ", work_st=" + work_st
				+ ", position_no=" + position_no + ", dept_no=" + dept_no + "]";
	}
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getWork_st() {
		return work_st;
	}
	public void setWork_st(String work_st) {
		this.work_st = work_st;
	}
	public int getPosition_no() {
		return position_no;
	}
	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	
	

}
