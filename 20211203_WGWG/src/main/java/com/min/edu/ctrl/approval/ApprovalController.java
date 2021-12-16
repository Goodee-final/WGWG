package com.min.edu.ctrl.approval;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.min.edu.vo.form.Form;

@Controller
public class ApprovalController {
	
	   private Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   @Autowired
	   private IApprovalService approvalServiceImpl;
	   
	   @Autowired
	   private HttpSession session;
	  
	   
	   
	   
	   @GetMapping(value="/mydoclist.do")
	   public String doclist(Model model) {
		  //session.setAttribute("userid", "USER25");
		  //session.setMaxInactiveInterval(120);  //세션이 저장되는 시간(초)
		  
	      logger.info("ApprovalController 전체글 조회 List");
	      List<Approval_Doc> doclists = approvalServiceImpl.selectmyAllDoc(1);
	      
	      model.addAttribute("doclists", doclists);
	      return "/approval/mydoclist";
	   }
	   
		@PostMapping(value = "/mydoclist.do")
		public String searchdoclist(String title, Model model) {
			int empno = 1;
			logger.info("ApprovalController 문서 제목 검색 List");
			System.out.println(title);
			List<Approval_Doc> doclists = approvalServiceImpl.searchdoclist(title, empno);
			model.addAttribute("doclists", doclists);
			return "/approval/mydoclist";
		}
	   
	   @GetMapping(value="/docinsert.do")
	   public String docinsert(Model model) {
		   
	      logger.info("ApprovalController 기안하기 문서 작성");
	      Emp empinfo = approvalServiceImpl.selectEmpInfo(7);
	      model.addAttribute("empinfo", empinfo);
	      return "/approval/docinsert";
	   }
	   
	   @GetMapping(value="/appline.do")
	   public String appline(Model model) {
		  
	      logger.info("ApprovalController 결재라인 등록");
	      List<Department> deptlists = approvalServiceImpl.selectAllDept();
	      List<Emp> emplists = approvalServiceImpl.selectAllEmp();
	      model.addAttribute("deptlists", deptlists);
	      model.addAttribute("emplists", emplists);
	      return "/approval/appline";
	   }
	  
	   
//	   //완료 문서함
//	   @GetMapping(value="completedoc.do")
//	   public String docListComplete(Model model) {
//		   
//		   logger.info("완료 문서함");
//		   Approval_Doc doc = new Approval_Doc();
//		   int empno = 1;
//		   doc.setEmp_no(empno);
//		   doc.setApp_doc_st("완료");
//		   //송신
//		   List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
//		   
//		   //수신경우
//
//		   List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);
//		   
//		   model.addAttribute("doclist1",doclist1);
//		   model.addAttribute("doclist1",doclist2);
//		   
//		   return "/approval/compldoclist";
//	   }
	   
	   //문서 상세 화면
	   @GetMapping(value="/docdetail.do")
	   public String docdetail(Model model,HttpServletRequest req) {
		   int docno = Integer.parseInt(req.getParameter("docno"));
		   System.out.println(docno);
		   //수정하기
		   //Approval_Doc doc = approvalServiceImpl.selectOneDoc(docno);
		   
		   //model.addAttribute("doc",doc);
		   session.setAttribute("loc", "./docdetail.do");
		   return "/approval/docdetail";
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
