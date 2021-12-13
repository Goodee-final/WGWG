package com.min.edu.ctrl.approval;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.approval.IApprovalService;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;

@Controller
public class ApprovalController {
	
	   private Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   @Autowired
	   private IApprovalService approvalServiceImpl;
	   
	   
	   @GetMapping(value="/docList.do")
	   public String doclist(Model model) {
		  //session.setAttribute("userid", "USER25");
		  //session.setMaxInactiveInterval(120);  //세션이 저장되는 시간(초)
		  //session을 삭제하는 방법 두가지
		  //1. session 객체 자체를 삭제
		  //2. session 객체 하나의 값은 삭제 remove("userid")
		  
	      logger.info("ApprovalController 전체글 조회 List");
	      List<Approval_Doc> doclists = approvalServiceImpl.selectAllDoc();
	      model.addAttribute("doclists", doclists);
	      return "/approval/doclist";
	   }
	   
//	   @RequestMapping(value="/docinsert.do", method = {RequestMethod.GET, RequestMethod.POST})
//	   public String docinsert(Model model) {
//		  //session.setAttribute("userid", "USER25");
//		  //session.setMaxInactiveInterval(120);  //세션이 저장되는 시간(초)
//		  //session을 삭제하는 방법 두가지
//		  //1. session 객체 자체를 삭제
//		  //2. session 객체 하나의 값은 삭제 remove("userid")
//		  
//	      logger.info("ApprovalController 기안하기 문서 작성");
//	      return "/approval/docinsert";
//	   }
	   
	   @GetMapping(value="/appline.do")
	   public String appline(Model model) {
		  
	      logger.info("ApprovalController 결재라인 등록");
	      List<Department> deptlists = approvalServiceImpl.selectAllDept();
	      List<Emp> emplists = approvalServiceImpl.selectAllEmp();
	      model.addAttribute("deptlists", deptlists);
	      model.addAttribute("emplists", emplists);
	      return "/approval/appline";
	   }
	   
	   
	   
//	   @PostMapping("/replyBoard.do")
//	   public String replyBoard(Answerboard_VO vo, HttpSession session) {
//		   String writer = (String) session.getAttribute("userid");
//		   logger.info("BoardController 답글달기 replyBoard : {}", vo);
//		   logger.info("BoardController 답글달기 replyBoard : {}", writer);
//		   vo.setId(writer);
//		   int cnt = answerboardServiceImpl.reply(vo);
//		   if(cnt > 0) {
//			   return "redirect:/boardList.do";
//		   }else {
//				return "index.jsp";
//		   } 
//	   }
}
