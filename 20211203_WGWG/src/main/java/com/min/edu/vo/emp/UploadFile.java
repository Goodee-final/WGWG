package com.min.edu.vo.emp;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile implements Serializable {

	private static final long serialVersionUID = -1609432493059811766L;
	
	private String filename; //파일명
	private MultipartFile file;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	

}
