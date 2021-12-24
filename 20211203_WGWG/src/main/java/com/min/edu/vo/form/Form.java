package com.min.edu.vo.form;

import java.util.List;

public class Form {

	private int form_no;
	private String form_nm;
	private String form_reg_dt;
	private String template;
	private int form_class_no;
	
	public Form(String form_nm, String template, int form_class_no) {
		super();
		this.form_nm = form_nm;
		this.template = template;
		this.form_class_no = form_class_no;
	}
	private FormClassification fcdto;
	
	public Form() {
		super();
	}


	public int getForm_no() {
		return form_no;
	}
	public void setForm_no(int form_no) {
		this.form_no = form_no;
	}
	public String getForm_nm() {
		return form_nm;
	}
	public void setForm_nm(String form_nm) {
		this.form_nm = form_nm;
	}
	public String getForm_reg_dt() {
		return form_reg_dt;
	}
	public void setForm_reg_dt(String form_reg_dt) {
		this.form_reg_dt = form_reg_dt;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public FormClassification getFcdto() {
		return fcdto;
	}
	public void setFcdto(FormClassification fcdto) {
		this.fcdto = fcdto;
	}
	@Override
	public String toString() {
		return "Form [form_no=" + form_no + ", form_nm=" + form_nm + ", form_reg_dt=" + form_reg_dt + ", template="
				+ template + ", fcdto=" + fcdto + "]";
	}
	
	
}
