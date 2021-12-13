package com.min.edu;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.http.HttpHeaders;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String uploadForm(MultipartFile file, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {

	
		logger.info("orinalName" + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		if(file == null || file.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =  response.getWriter();
			out.println("<script>alert('이미지 파일을 선택해 주세요'); location.href='./signinsert.do'</script>");
			out.flush();
			return null;
		}
		
		String saveName = uploadFile(file);
		
		System.out.println("파일 이름은 : " + saveName);
		

		//로그인한 회원 번호 select하기
		int empno = 1;
		Sign sign = new Sign(empno, saveName, Long.toString(file.getSize()));
		signdao.insertSign(sign);
		
		model.addAttribute("savedFileName", saveName);
		model.addAttribute("loc","./signlist.do");
		return "forward:/";
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


	@ResponseBody
	@RequestMapping(value = "/deleteFile.do", method = RequestMethod.GET)
	public ResponseEntity<String> deleteFile(String fileName, HttpServletResponse response) throws IOException {

		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =  response.getWriter();
		out.println("<script>alert('이미지 파일을 선택해 주세요'); location.href='./signinsert.do'</script>");
		out.flush();
		return null;
	}

}
