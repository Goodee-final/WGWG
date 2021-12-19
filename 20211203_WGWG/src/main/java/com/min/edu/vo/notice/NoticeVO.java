package com.min.edu.vo.notice;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO implements Serializable{	
	
	private static final long serialVersionUID = 8452466079810478174L;
	
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_reg_dt;
	private String notice_chk;
	private int emp_no;
	private int notice_cnt;
	private NoticeFileVO noticefile;
	private MultipartFile file;
	
	
	public NoticeVO() {		
	}

	

	


	public NoticeVO(int notice_no, String notice_title, String notice_content, String notice_reg_dt, String notice_chk,
			int emp_no, int notice_cnt, NoticeFileVO noticefile, MultipartFile file) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_reg_dt = notice_reg_dt;
		this.notice_chk = notice_chk;
		this.emp_no = emp_no;
		this.notice_cnt = notice_cnt;
		this.noticefile = noticefile;
		this.file = file;
	}






	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_reg_dt=" + notice_reg_dt + ", notice_chk=" + notice_chk + ", emp_no="
				+ emp_no + ", notice_cnt=" + notice_cnt + ", noticefile=" + noticefile + ", file=" + file + "]";
	}






	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_reg_dt() {
		return notice_reg_dt;
	}

	public void setNotice_reg_dt(String notice_reg_dt) {
		this.notice_reg_dt = notice_reg_dt;
	}

	public String getNotice_chk() {
		return notice_chk;
	}

	public void setNotice_chk(String notice_chk) {
		this.notice_chk = notice_chk;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	public int getNotice_cnt() {
		return notice_cnt;
	}

	public void setNotice_cnt(int notice_cnt) {
		this.notice_cnt = notice_cnt;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public NoticeFileVO getNoticefile() {
		return noticefile;
	}
	public void setNoticefile(NoticeFileVO noticefile) {
		this.noticefile = noticefile;
	}


	
}
