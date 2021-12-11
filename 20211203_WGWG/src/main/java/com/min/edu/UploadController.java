package com.min.edu;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpHeaders;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.min.edu.model.ISignDao;
import com.min.edu.vo.Sign;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Autowired
	ISignDao signdao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/uploadForm.do", method = RequestMethod.GET)
	public void uploadForm() throws Exception {

	}

	@RequestMapping(value = "/uploadForm.do", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model, HttpServletRequest request)
			throws IOException, Exception {

	
		logger.info("orinalName" + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		if(file == null) {
			
		}
		
		String saveName = uploadFile(file);
		
		System.out.println("파일 이름은 : " + saveName);
		
		String db_saveName = "/img/sign/" + saveName; 
		
		int empno = 1;
		Sign sign = new Sign(empno, db_saveName, Long.toString(file.getSize()));
		signdao.insertSign(sign);
		
		model.addAttribute("savedFileName", saveName);
		return "redirect:./signlist.do";
	}

	private String uploadFile(MultipartFile file) throws Exception {

		String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, filename);
		FileCopyUtils.copy(file.getBytes(), target);

		
		return filename;
	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());

		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		String user_imgPath = (String) img_path.getBody();

		logger.info(user_imgPath);
		logger.info("file name : " + user_imgPath);

		return user_imgPath;
	}

//	@ResponseBody
//	@RequestMapping("/displayFile")
//	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
//
//		InputStream in = null;
//		ResponseEntity<byte[]> entity = null;
//
//		logger.info("FILE NAME: " + fileName);
//
//		try {
//
//			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
//
//			MediaType mType = MediaUtils.getMediaType(formatName);
//
//			HttpHeaders headers = new HttpHeaders();
//
//			in = new FileInputStream(uploadPath + fileName);
//
//			if (mType != null) {
//				headers.setContentType(mType);
//			} else {
//
//				fileName = fileName.substring(fileName.indexOf("_") + 1);
//				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//				headers.add("Content-Disposition",
//						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
//			}
//
//			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
//		} finally {
//			in.close();
//		}
//		return entity;
//	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}

