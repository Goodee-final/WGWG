package com.min.edu.vo.approval;

import com.min.edu.vo.form.Form;

public class Approval_Doc {
	
	private int app_doc_no;
	private String app_doc_st;
	private String app_doc_reg_dt;
	private String app_doc_title;
	private String ref_emp_no;
	private String app_doc_content;
	private int app_line_no;
	private int app_file_no;
	private int emp_no;
	private int form_no;
	
	private Form fvo;
	private Approval_line alvo;
	
	public Approval_Doc() {
		super();
	}

	public Approval_Doc(int app_doc_no, String app_doc_st, String app_doc_reg_dt, String app_doc_title, int emp_no, int form_no) {
		super();
		this.app_doc_no = app_doc_no;
		this.app_doc_st = app_doc_st;
		this.app_doc_reg_dt = app_doc_reg_dt;
		this.app_doc_title = app_doc_title;
		this.emp_no = emp_no;
		this.form_no = form_no;
	}

	public Approval_Doc(int app_doc_no, String app_doc_st, String app_doc_reg_dt, String app_doc_title,
			String ref_emp_no, String app_doc_content, int app_line_no, int app_file_no, int emp_no, int form_no) {
		super();
		this.app_doc_no = app_doc_no;
		this.app_doc_st = app_doc_st;
		this.app_doc_reg_dt = app_doc_reg_dt;
		this.app_doc_title = app_doc_title;
		this.ref_emp_no = ref_emp_no;
		this.app_doc_content = app_doc_content;
		this.app_line_no = app_line_no;
		this.app_file_no = app_file_no;
		this.emp_no = emp_no;
		this.form_no = form_no;
	}

	public Approval_Doc(int app_doc_no, String app_doc_st, String app_doc_reg_dt, String app_doc_title,
			String ref_emp_no, String app_doc_content, int app_line_no, int app_file_no, int emp_no, int form_no,
			Form fvo, Approval_line alvo) {
		super();
		this.app_doc_no = app_doc_no;
		this.app_doc_st = app_doc_st;
		this.app_doc_reg_dt = app_doc_reg_dt;
		this.app_doc_title = app_doc_title;
		this.ref_emp_no = ref_emp_no;
		this.app_doc_content = app_doc_content;
		this.app_line_no = app_line_no;
		this.app_file_no = app_file_no;
		this.emp_no = emp_no;
		this.form_no = form_no;
		this.fvo = fvo;
		this.alvo = alvo;
	}
	

	public int getApp_doc_no() {
		return app_doc_no;
	}

	public void setApp_doc_no(int app_doc_no) {
		this.app_doc_no = app_doc_no;
	}

	public String getApp_doc_st() {
		return app_doc_st;
	}

	public void setApp_doc_st(String app_doc_st) {
		this.app_doc_st = app_doc_st;
	}

	public String getApp_doc_reg_dt() {
		return app_doc_reg_dt;
	}

	public void setApp_doc_reg_dt(String app_doc_reg_dt) {
		this.app_doc_reg_dt = app_doc_reg_dt;
	}

	public String getApp_doc_title() {
		return app_doc_title;
	}

	public void setApp_doc_title(String app_doc_title) {
		this.app_doc_title = app_doc_title;
	}

	public String getRef_emp_no() {
		return ref_emp_no;
	}

	public void setRef_emp_no(String ref_emp_no) {
		this.ref_emp_no = ref_emp_no;
	}

	public String getApp_doc_content() {
		return app_doc_content;
	}

	public void setApp_doc_content(String app_doc_content) {
		this.app_doc_content = app_doc_content;
	}

	public int getApp_line_no() {
		return app_line_no;
	}

	public void setApp_line_no(int app_line_no) {
		this.app_line_no = app_line_no;
	}

	public int getApp_file_no() {
		return app_file_no;
	}

	public void setApp_file_no(int app_file_no) {
		this.app_file_no = app_file_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getForm_no() {
		return form_no;
	}

	public void setForm_no(int form_no) {
		this.form_no = form_no;
	}

	public Form getFvo() {
		return fvo;
	}

	public void setFvo(Form fvo) {
		this.fvo = fvo;
	}

	public Approval_line getAlvo() {
		return alvo;
	}

	public void setAlvo(Approval_line alvo) {
		this.alvo = alvo;
	}
	
	

	@Override
	public String toString() {
		return "Approval_Doc [app_doc_no=" + app_doc_no + ", app_doc_st=" + app_doc_st + ", app_doc_reg_dt="
				+ app_doc_reg_dt + ", app_doc_title=" + app_doc_title + ", emp_no=" + emp_no + ", form_no=" + form_no
				+ "]";
	}
	
}
