package com.min.edu.ctrl.approval;

import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.min.edu.model.approval.IApprovalService;
import com.min.edu.model.emp.EmpServiceImpl;
import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.form.IFormService;
import com.min.edu.model.sign.ISignDao;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.approval.Approver;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.emp.Position;
import com.min.edu.vo.form.Form;
import com.min.edu.vo.form.FormClassification;
import com.min.edu.vo.notice.NoticePageVO;
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
	      List<Department> deptlists = approvalServiceImpl.selectAllDept();
	      List<Emp> emplists = approvalServiceImpl.selectAllEmp();
	      List<Position> plists = approvalServiceImpl.selectAllPosition();
	      model.addAttribute("deptlists", deptlists);
	      model.addAttribute("plists", plists);
	      model.addAttribute("emplists", emplists);
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
	      
	      return "/approval/appline";
	   }

	@Autowired
	ISignDao signdao;

	// 문서 상세 화면으로 이동
	@GetMapping(value = "/detailmove.do")
	public String detailmove(Model model, HttpServletRequest req) {
		int docno = Integer.parseInt(req.getParameter("docno"));
		String docBox = req.getParameter("docBox");
		System.out.println("문서함 위치: " + docBox);

		session.setAttribute("loc", "./docdetail.do?docno=" + docno + "&docBox=" + docBox);
		return "redirect:/";
	}

	// 문서 상세 화면
	@GetMapping(value = "/docdetail.do")
	public String docdetail(Model model, HttpServletRequest req) {
		int docno = Integer.parseInt(req.getParameter("docno"));
		String docBox = req.getParameter("docBox");
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

//		for (int i = 0; i < str.length; i++) {
//			System.out.println("i번째 문자: " + str[i]);
//
//			Emp emp = approvalServiceImpl.selectEmpInfo(Integer.parseInt(str[i]));
//			String name = emp.getEmp_nm();
//			System.out.println("회원번호: " + str[i] + ", 회원이름 : " + name);
//			str[i] = name;
//		}

		// 서명 정보
		List<Sign> signlist = signdao.selectSignList(1);

		model.addAttribute("signlist", signlist);
		model.addAttribute("empinfo", empinfo);
		model.addAttribute("refName", str);
		model.addAttribute("detaildoc", detaildoc);
		model.addAttribute("docBox", docBox);
		session.setAttribute("loc", "./docdetail.do?docno=" + docno);
		return "/approval/docdetail";
	}

	
	// 승인시 로직
	@GetMapping(value = "/approve.do")
	public String approve(HttpServletRequest req) {
		int signNo = Integer.parseInt(req.getParameter("signNo"));
		System.out.println("singno : " + signNo);
		String signimg;
		int docno = Integer.parseInt(req.getParameter("docNo"));
		int empno = 2;
		

		boolean flag = false;

		// 현재시간
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String nowTime = format.format(date);

		
		// 라인에 싸인 정보 저장
		if(signNo == 0) {
			//기본이미지
			signimg = "approve.PNG";
		}else {
			Sign sign = signdao.selectSignOne(signNo);
			signimg = sign.getSign_img();
		}

		// 내 결재 대기 상태 n로 변경
		Approval_Doc doc = approvalServiceImpl.selectOneDoc(docno);
		Approval_line appline = doc.getAlvo();
		int lineNo = approvalServiceImpl.selectOneDoc(docno).getApp_line_no();
		appline.setApp_line_no(lineNo);
	
		String jsonObj = appline.getApproval();
		

		Gson gson = new Gson();

		JsonParser parse = new JsonParser();
		JsonElement element = parse.parse(jsonObj);

		int dataCNT = element.getAsJsonObject().get("APPROVAL").getAsJsonArray().size();
		Approver approver = null;
		String approval = "{\"APPROVAL\":[";
		for (int i = 0; i < dataCNT; i++) {

			JsonObject temp = element.getAsJsonObject().get("APPROVAL").getAsJsonArray().get(i).getAsJsonObject();
			JsonElement empJson1 = temp.get("emp_no");
			JsonElement empJson2 = temp.get("approval_st");
			JsonElement empJson3 = temp.get("reason");
			JsonElement empJson4 = temp.get("approval_dt");
			JsonElement empJson5 = temp.get("waiting");
			JsonElement empJson6 = temp.get("signimg");
			

			System.out.println(
					"Json정보 : " + empJson1 + ", " + empJson2 + ", " + empJson3 + ", " + empJson4 + ", " + empJson5);

			
			// JSONARRAY에서 결재자 회원번호와 로그인한 회원번호 동일시
			if (empJson1.getAsInt() == empno) {

				// APPROVAL[i].approval_st(승인여부) 값을 -> '승인'으로 변경
				approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
						"승인", // 승인 여부
						empJson3.getAsString(), // 반려 사유
						nowTime, // 결재일
						"n", // 대기 여부
						signimg
				);
				
				flag = true;	//대기 상태 넘기기
				
				System.out.println("결재자 승인 업데이트");

			} else {
				// 다음 결재자가 존재 O
				if (flag) {
					approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
							empJson2.getAsString(), // 승인 여부
							empJson3.getAsString(), // 반려 사유
							empJson4.getAsString(), // 결재일
							"y", // 대기 여부
							empJson6.getAsString() // 결재일
							
					);
					flag = false;
					System.out.println("다음결재자 에게 대기상태 넘김");
				} else {

					approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
							empJson2.getAsString(), // 승인 여부
							empJson3.getAsString(), // 반려 사유
							empJson4.getAsString(), // 결재일
							empJson5.getAsString(), // 대기 여부
							empJson6.getAsString() // 전자서명
					);
				}
			}

			String appJson = gson.toJson(approver);
			System.out.println(appJson);

			// 마지막 결재자일시
			if (i == dataCNT - 1) {
				approval += appJson + "]}";

				appline.setApproval(approval);
				System.out.println("업데이트 된 결재자 리스트 : " + appline.getApproval());
			} else {
				approval += appJson + ",";
				System.out.println();
				System.out.println("변경후: " + approval);

			}

			System.out.println();

		}
		
		//결재라인 db 업데이트
		approvalServiceImpl.updateApproval(appline);

		//결재 처음 진행시
		if(doc.getApp_doc_st() == "대기") {
			doc.setApp_doc_st("진행");
			approvalServiceImpl.updateDocSt(doc);
		}
		
		// 모든 결재자가 결재 승인시 -> 결재문서상태:완료 (db)업데이트
		if (flag) {

			doc.setApp_doc_no(docno);
			doc.setApp_doc_st("완료");
//			System.out.println(doc.getApp_doc_no());
//			System.out.println(doc.getApp_doc_st());
			approvalServiceImpl.updateDocSt(doc);
		}

		return "redirect:/";
	}

	// 결재 반려시 로직
	@GetMapping(value = "/docReturn.do")
	public String docReturn(HttpServletRequest req) {

		int docno = Integer.parseInt(req.getParameter("docNo"));
		String reason = req.getParameter("reason");

		// 현재시간
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String nowTime = format.format(date);

		// 내 결재 대기 상태 n로 변경
		Approval_line appline = approvalServiceImpl.selectOneDoc(docno).getAlvo();
		int lineNo = approvalServiceImpl.selectOneDoc(docno).getApp_line_no();
		appline.setApp_line_no(lineNo);
		
		String jsonObj = appline.getApproval();
		
		
		Gson gson = new Gson();

		JsonParser parse = new JsonParser();
		JsonElement element = parse.parse(jsonObj);

		int dataCNT = element.getAsJsonObject().get("APPROVAL").getAsJsonArray().size();
		Approver approver = null;
		String approval = "{\"APPROVAL\":[";
		for (int i = 0; i < dataCNT; i++) {

			JsonObject temp = element.getAsJsonObject().get("APPROVAL").getAsJsonArray().get(i).getAsJsonObject();
			JsonElement empJson1 = temp.get("emp_no");
			JsonElement empJson2 = temp.get("approval_st");
			JsonElement empJson3 = temp.get("reason");
			JsonElement empJson4 = temp.get("approval_dt");
			JsonElement empJson5 = temp.get("waiting");
			JsonElement empJson6 = temp.get("signimg");

			System.out.println(
					"Json정보 : " + empJson1 + ", " + empJson2 + ", " + empJson3 + ", " + empJson4 + ", " + empJson5);

			// 1은 세션에 있는 회원 번호
			// JSONARRAY에서 결재자 회원번호와 로그인한 회원번호 동일시
			if (empJson1.getAsInt() == 2) {

				// APPROVAL[i].approval_st(승인여부) 값을 -> '반려'로 변경
				approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
						"반려", // 승인 여부
						reason, // 반려 사유
						nowTime, // 결재일
						"n", // 대기 여부
						"fail.PNG"
				);

				System.out.println("결재자 승인 업데이트");

			} else {

				approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
						empJson2.getAsString(), // 승인 여부
						empJson3.getAsString(), // 반려 사유
						empJson4.getAsString(), // 결재일
						empJson5.getAsString(), // 대기 여부
						empJson6.getAsString() // 대기 여부
				);

			}
			
			String appJson = gson.toJson(approver);
			System.out.println(appJson);
			
		
			
			//마지막 결재자일시
			if(i == dataCNT-1) {
				approval +=  appJson + "]}";
				
				appline.setApproval(approval);
				System.out.println("업데이트 된 결재자 리스트 : "+appline.getApproval());
			}else {
				approval += appJson + ",";
//				System.out.println();
//				System.out.println("변경후: " + approval);
				
			}
			
			
		}

		String appJson = gson.toJson(approver);
		System.out.println(appJson);
		
		appline.setApproval(approval);
		
		//결재라인 db 업데이트
		approvalServiceImpl.updateApproval(appline);
		
		
		//결재 문서 상태 반려로 변경
		Approval_Doc doc = new Approval_Doc();
		doc.setApp_doc_no(docno);
		doc.setApp_doc_st("반려");
//		System.out.println(doc.getApp_doc_no());
//		System.out.println(doc.getApp_doc_st());
		approvalServiceImpl.updateDocSt(doc);

		return "redirect:/";
	}

	// 완료 문서함
	@GetMapping(value = "/completedoc.do")
	@PostMapping(value = "/completedoc.do")
	public String docListComplete(Model model, HttpServletRequest request) {

		logger.info("완료 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = 1;
		doc.setEmp_no(empno);
		doc.setApp_doc_st("완료");
		
		Approval_Page paging = new Approval_Page(
	               request.getParameter("index"),
	               request.getParameter("pageStartNum"),
	               request.getParameter("listCnt"),
	               request.getParameter("notice_chk"),
	               request.getParameter("searchKeyword")
	            );
		doc.setPaging(paging);
		// 송신
		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		// 수신경우

		List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);

		model.addAttribute("doclist1", doclist1);
		model.addAttribute("doclist2", doclist2);
		model.addAttribute("paging", paging);
		session.setAttribute("loc", "./completedoc.do");

		return "/approval/compldoclist";
	}
	
	
	@GetMapping(value="/docDelte.do")
	public String docDelete(HttpServletRequest req) {
		int docno = Integer.parseInt(req.getParameter("docno"));
		
		Approval_Doc doc = new Approval_Doc();
		doc.setApp_doc_no(docno);
		doc.setApp_doc_st("삭제");
		approvalServiceImpl.updateDocSt(doc);
		
		
		return "redirect:/";
	}

	@GetMapping(value = "/tempdoc.do")
	public String tmepdoc(Model model) {

		logger.info("임시 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = 1;
		doc.setEmp_no(empno);
		doc.setApp_doc_st("임시저장");

//		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		List<Approval_Doc> doclist1 = new ArrayList<Approval_Doc>();
		model.addAttribute("doclist1", doclist1);
		session.setAttribute("loc", "./tempdoc.do");
		return "/approval/tempdoc";
	}
	
	
	//참조 문서함
	@GetMapping(value="/refdoclist.do")
	public String refdoclist(Model model) {
		
		session.setAttribute("loc", "./refdoclist.do");
		return "/approval/refdoclist";
	}
	
	// 문서 상세 화면으로 이동"docno":no, "docBox":docBox
	@ResponseBody
	@RequestMapping(value="/detailAjax.do", method=RequestMethod.POST)
	public Map<String,Object>  detailAjax(Model model, String docno, String docBox) {
		
		System.out.println("문서함 위치: " + docBox);

		System.out.println("ajax 요청 도착!" + docno + ", "  + docBox);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("docno", docno);
		map.put("docBox", docBox);
	
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/reqAjax.do", method=RequestMethod.POST)
	public Map<String,String> reqAjax(String title, String toggle){
		System.out.println("ajax 요청 도착!" + title + ", "  + toggle);
		Map<String,String> map = new HashMap<String,String>();
		map.put("title", title);
		map.put("toggle", toggle);
	
		return map;
	}

	@GetMapping(value = "/searchdoclist.do")
	public String searchdoclist2(String title, String toggle, Model model) {
		
		logger.info("완료 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = 1;
		doc.setEmp_no(empno);
		doc.setApp_doc_st("완료");
		
		List<Approval_Doc> searchlist1 = new ArrayList<Approval_Doc>();
		List<Approval_Doc> searchlist2 = new ArrayList<Approval_Doc>();
		
		// 송신
		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		for (Approval_Doc doc1 : doclist1) {
			if(doc1.getApp_doc_title().contains(title)) {
				searchlist1.add(doc1);
			}
		}

		// 수신경우

		List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);
		
		
		for (Approval_Doc doc2 : doclist2) {
			if(doc2.getApp_doc_title().contains(title)) {
				searchlist2.add(doc2);
			}
		}
		
		model.addAttribute("doclist1", searchlist1);
		model.addAttribute("doclist2", searchlist2);
		
		return "/approval/compldoclist";
	}
	
	@ResponseBody
	@RequestMapping(value = "/pagingAjax.do", method = RequestMethod.POST)
	public Map<String, Object> pagingAjax(HttpServletRequest request) {
		String index = request.getParameter("index");
		String pageStartNum = request.getParameter("pageStartNum");
		String listCnt = request.getParameter("listCnt");
		String app_chk = request.getParameter("app_chk");
		String searchKeyword = request.getParameter("searchKeyword");
	
		System.out.println("ajax 전송 완료! ");
		System.out.println(index +" " + pageStartNum  +" " +listCnt  +" " +app_chk  +" " +searchKeyword);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("index", index);
		map.put("pageStartNum", pageStartNum);
		map.put("listCnt", listCnt);
		map.put("app_chk", app_chk);
		map.put("searchKeyword", searchKeyword);
		
		return map;
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
