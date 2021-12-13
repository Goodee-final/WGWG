package com.min.edu.vo.notice;

import java.io.Serializable;

public class NoticeFileVO implements Serializable{
	
	private static final long serialVersionUID = -804838335135574636L;
	private int notice_file_no;
	private String notice_file_nm;
	private String notice_file_save_nm;
	private int notice_file_size;
	private String notice_file_reg_dt;
	private int notice_no;
	public NoticeFileVO() {
	}
	public NoticeFileVO(int notice_file_no, String notice_file_nm, String notice_file_save_nm, int notice_file_size,
			String notice_file_reg_dt, int notice_no) {
		super();
		this.notice_file_no = notice_file_no;
		this.notice_file_nm = notice_file_nm;
		this.notice_file_save_nm = notice_file_save_nm;
		this.notice_file_size = notice_file_size;
		this.notice_file_reg_dt = notice_file_reg_dt;
		this.notice_no = notice_no;
	}
	
	
	@Override
	public String toString() {
		return "NoticeFileVO [notice_file_no=" + notice_file_no + ", notice_file_nm=" + notice_file_nm
				+ ", notice_file_save_nm=" + notice_file_save_nm + ", notice_file_size=" + notice_file_size
				+ ", notice_file_reg_dt=" + notice_file_reg_dt + ", notice_no=" + notice_no + "]";
	}
	
	public int getNotice_file_no() {
		return notice_file_no;
	}
	public void setNotice_file_no(int notice_file_no) {
		this.notice_file_no = notice_file_no;
	}
	public String getNotice_file_nm() {
		return notice_file_nm;
	}
	public void setNotice_file_nm(String notice_file_nm) {
		this.notice_file_nm = notice_file_nm;
	}
	public String getNotice_file_save_nm() {
		return notice_file_save_nm;
	}
	public void setNotice_file_save_nm(String notice_file_save_nm) {
		this.notice_file_save_nm = notice_file_save_nm;
	}
	public int getNotice_file_size() {
		return notice_file_size;
	}
	public void setNotice_file_size(int notice_file_size) {
		this.notice_file_size = notice_file_size;
	}
	public String getNotice_file_reg_dt() {
		return notice_file_reg_dt;
	}
	public void setNotice_file_reg_dt(String notice_file_reg_dt) {
		this.notice_file_reg_dt = notice_file_reg_dt;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	
	
}
