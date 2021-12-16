package com.min.edu.ctrl.sign;

import org.slf4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.min.edu.model.approval.IApprovalService;
import com.min.edu.model.sign.ISignDao;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.sign.Sign;

@Controller
public class SignController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private ISignDao dao;
	
	@Autowired
	private IApprovalService approvalServiceImpl;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/signlist.do", method = RequestMethod.GET)
	public String signList(Model model) {
		session.setAttribute("loc", "./signlist.do");
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
		session.setAttribute("loc", "./signdraw.do");
		
		return "sign/signdraw";
	}

	@RequestMapping(value = "/signinsert.do", method = RequestMethod.GET)
	public String signDownload(HttpServletRequest request) throws IOException {
		
		session.setAttribute("loc","./signinsert.do");
		return "sign/signinsert";
	}
	
	
	@RequestMapping(value = "/signdelete.do", method = RequestMethod.GET)
	public String signDelete(HttpServletRequest req) {
		
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

		session.setAttribute("loc", "./signlist.do");
		return "redirect:/";
		
	}
	
	   //완료 문서함
	   @GetMapping(value="/completedoc.do")
	   public String docListComplete(Model model) {
		   
		   logger.info("완료 문서함");
		   Approval_Doc doc = new Approval_Doc();
		   int empno = 1;
		   doc.setEmp_no(empno);
		   doc.setApp_doc_st("완료");
		   //송신
		   List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		   
		   //수신경우

		   List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);
		   
		   model.addAttribute("doclist1",doclist1);
		   model.addAttribute("doclist2",doclist2);
		   session.setAttribute("loc", "./completedoc.do");
		   
		   return "/approval/compldoclist";
	   }
	   
	
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String index(Model model) {
		//System.out.println(loc);
		//session.setAttribute("loc",loc);
		return "common/home";
	}
}
