package com.min.edu.ctrl.sign;

import org.slf4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.min.edu.model.sign.ISignDao;
import com.min.edu.vo.sign.Sign;

@Controller
public class SignController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private ISignDao dao;

	@RequestMapping(value = "/signlist.do", method = RequestMethod.GET)
	public String signList(Model model) {
		logger.info("signlist로 이동");

		// 로그인된 회원의 전자서명 리스트 조회
		List<Sign> signList = dao.selectSignList(1);// 회원번호 들어감
		model.addAttribute("signList",signList);
		System.out.println(signList.toString());
		return "sign/signlist";
	}

	@RequestMapping(value = "/signdraw.do", method = RequestMethod.GET)
	public String signDraw() {
		logger.info("signdraw로 이동");
		
		return "sign/signdraw";
	}

	@RequestMapping(value = "/signinsert.do", method = RequestMethod.GET)
	public String signDownload(HttpServletRequest request) throws IOException {

	
		return "sign/signinsert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signdelete.do", method = RequestMethod.GET)
	public ResponseEntity<String> signDelete(HttpServletRequest req) {
		
		Sign sign = dao.selectSignOne(Integer.parseInt(req.getParameter("sign_no")));
		String fileName = sign.getSign_img();
		logger.info("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		dao.deleteSign(sign.getSign_no());

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
	@RequestMapping(value ="/completedoc.do", method = RequestMethod.GET)
	public String completedoc() {
		
		return "approval/compldoclist";
	}
}
