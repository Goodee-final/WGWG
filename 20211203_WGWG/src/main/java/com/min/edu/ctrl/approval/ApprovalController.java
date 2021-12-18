package com.min.edu.ctrl.approval;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.model.approval.IApprovalService;
import com.min.edu.model.emp.EmpServiceImpl;
import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.form.IFormService;
import com.min.edu.model.sign.ISignDao;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;
import com.min.edu.vo.sign.Sign;

@Controller
public class ApprovalController {
	
	   private Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   @Autowired
	   private IApprovalService approvalServiceImpl;
	   
	   @Autowired
	   private IFormService formservice;
	   
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
	      List<Form> formList = formservice.selectForm();
	      model.addAttribute("formList", formList);
	      return "/approval/docinsert";
	   }
	   
	   @PostMapping(value="/docinsert.do")
	   public String docapproval(Model model, @RequestParam String content) {
	      logger.info("ApprovalController 기안하기 문서 작성");
	      Emp empinfo = approvalServiceImpl.selectEmpInfo(7);
	      model.addAttribute("empinfo", empinfo);
	      System.out.println("양식 태그"+content);
	      return "/approval/mydoclist";
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

	@Autowired
	ISignDao signdao;

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

	// 문서 상세 화면으로 이동
	@GetMapping(value = "/detailmove.do")
	public String detailmove(HttpServletRequest req) {
		int docno = Integer.parseInt(req.getParameter("docno"));

		session.setAttribute("loc", "./docdetail.do?docno=" + docno);
		return "redirect:/";
	}

	// 문서 상세 화면
	@GetMapping(value = "/docdetail.do")
	public String docdetail(Model model, HttpServletRequest req) {
		int docno = Integer.parseInt(req.getParameter("docno"));
		logger.info("문서 상세 보기 화면");
		System.out.println("문서번호: " + docno);

		// 문서번호로 상세보기
		Approval_Doc detaildoc = approvalServiceImpl.selectOneDoc(docno);

		System.out.println(detaildoc);
		System.out.println("form 이름 : " + detaildoc.getFvo().getForm_nm());
		System.out.println(detaildoc.getFvo().getForm_no());

		// 작성자 회원 정보
		Emp empinfo = approvalServiceImpl.selectEmpInfo(detaildoc.getEmp_no());

		// 참조인 배열
		String ref = detaildoc.getRef_emp_no();

		String[] str = ref.split(",");
		List<String> reflist = null;

		for (int i = 0; i < str.length; i++) {
			System.out.println("i번째 문자: " + str[i]);

			Emp emp = approvalServiceImpl.selectEmpInfo(Integer.parseInt(str[i]));
			String name = emp.getEmp_nm();
			System.out.println("회원번호: " + str[i] + ", 회원이름 : " + name);
			str[i] = name;
		}

		// 서명 정보
		List<Sign> signlist = signdao.selectSignList(1);

		model.addAttribute("signlist", signlist);
		model.addAttribute("empinfo", empinfo);
		model.addAttribute("refName", str);
		model.addAttribute("detaildoc", detaildoc);
		session.setAttribute("loc", "./docdetail.do?docno=" + docno);
		return "/approval/docdetail";
	}

	@GetMapping(value = "/approve.do")
	public String approve(HttpServletRequest req) {
		int signNo = Integer.parseInt(req.getParameter("signNo"));
		Sign sign = signdao.selectSignOne(signNo);

		
		//라인에 싸인 정보 저장
		
		//내 결재 대기 상태 n로 변경
		
		//다음 결재자가 있는지 확인 후 
		
		//있으면 다음 결재자 대기 상태 y로 변경
		
		//없으면 문서 상태 완료로 변경
		
		
		return "redirect:/";
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
