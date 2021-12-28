package com.min.edu.ctrl.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.approval.IApprovalService;
import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.main.IMainService;

import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;

import com.min.edu.model.worklog.IWorkLogService;

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
	private IWorkLogService workLogService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		//테스트할 때 index페이지부터 보여주기 위한 주소
		List<NoticeVO> noticeList = mainService.selectmainnotice();
		model.addAttribute("noticeList", noticeList);
		logger.info("로그인한 사원번호{}",session.getAttribute("loginEmp"));
		int emp_no = (Integer)session.getAttribute("loginEmp");
		Emp emp = empService.selectEmpByNo(emp_no);

		Approval_Doc doc = new Approval_Doc();
		Approval_Doc doc1 = new Approval_Doc();
		Approval_Page paging = new Approval_Page();
		paging.setListCnt(5);
		doc.setPaging(paging);
		doc1.setPaging(paging);
		doc.setEmp_no(emp_no);
		doc1.setEmp_no(emp_no);
		
		
		System.out.println(paging);
		
		
		List<Approval_Doc> doclist = appService.selectListWait(doc);
		for (Approval_Doc Doc1 : doclist) {
			Doc1.setEmp_nm(appService.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
//			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		
		doc1.setApp_doc_st("진행");
		List<Approval_Doc> doclist1 = appService.selectListDocSt(doc1);
		for (Approval_Doc Doc1 : doclist1) {
			Doc1.setEmp_nm(appService.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
//			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		
	    model.addAttribute("emp",emp);
	    logger.info("*******dept_no : {}",emp.getDept_no());
	    model.addAttribute("doclist",doclist);
	    model.addAttribute("doclist1",doclist1);
//	    session.setAttribute("loc", "./main.do");
		return "index";
	}
	

   @RequestMapping(value="/main.do", method=RequestMethod.GET)
   public String mainDo(Model model, HttpSession session) {
      List<NoticeVO> noticeList = mainService.selectmainnotice();
      model.addAttribute("noticeList", noticeList);
      logger.info("로그인한 사원번호{}",session.getAttribute("loginEmp"));
       int emp_no = (Integer)session.getAttribute("loginEmp");
       Emp emp = workLogService.selectEmpNo(emp_no);
       model.addAttribute("emp",emp);
       
   
		Approval_Doc doc1 = new Approval_Doc();
		Approval_Page paging = new Approval_Page();
		paging.setListCnt(5);
		doc1.setPaging(paging);
		doc1.setEmp_no(emp_no);
		
       
       doc1.setApp_doc_st("진행");
		List<Approval_Doc> doclist1 = appService.selectListDocSt(doc1);
		for (Approval_Doc Doc1 : doclist1) {
			Doc1.setEmp_nm(appService.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
//			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		
	    model.addAttribute("emp",emp);
	
	    model.addAttribute("doclist1",doclist1);
//
       
       session.setAttribute("loc", "./main.do");
   
      return "common/main";
   }
}
