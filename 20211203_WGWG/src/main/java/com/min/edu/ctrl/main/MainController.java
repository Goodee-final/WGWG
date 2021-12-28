package com.min.edu.ctrl.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.approval.IApprovalService;
import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.main.IMainService;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.notice.NoticeVO;

@Controller
public class MainController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEmpService empService;
	
	@Autowired
	private IMainService mainService;
	
	@Autowired
	private IApprovalService appService;
	
	@Autowired
	private IApprovalService approvalServiceImpl;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		//테스트할 때 index페이지부터 보여주기 위한 주소
		List<NoticeVO> noticeList = mainService.selectmainnotice();
		model.addAttribute("noticeList", noticeList);
		logger.info("로그인한 사원번호{}",session.getAttribute("loginEmp"));
		int emp_no = (Integer)session.getAttribute("loginEmp");
		Emp emp = appService.selectEmpInfo(emp_no);

		Approval_Doc doc = new Approval_Doc();
		Approval_Page paging = new Approval_Page();
		paging.setListCnt(3);
		doc.setPaging(paging);
		doc.setEmp_no(emp_no);
		
		System.out.println(paging);
		
		
		List<Approval_Doc> doclist = approvalServiceImpl.selectListWait(doc);
		for (Approval_Doc Doc1 : doclist) {
			Doc1.setEmp_nm(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
//			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		
	    model.addAttribute("emp",emp);
	    model.addAttribute("doclist",doclist);
//	    session.setAttribute("loc", "./main.do");
		return "index";
	}
	
	

	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String mainDo(Model model, HttpSession session) {
		List<NoticeVO> noticeList = mainService.selectmainnotice();
		model.addAttribute("noticeList", noticeList);
		logger.info("로그인한 사원번호{}",session.getAttribute("loginEmp"));
	    int emp_no = (Integer)session.getAttribute("loginEmp");
	    Emp emp = appService.selectEmpInfo(emp_no);
	    model.addAttribute("emp",emp);
	    
	    session.setAttribute("loc", "./main.do");
	
		return "common/main";
	}
	
}
