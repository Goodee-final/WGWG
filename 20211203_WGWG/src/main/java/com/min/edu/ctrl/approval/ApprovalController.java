package com.min.edu.ctrl.approval;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.min.edu.model.worklog.IWorkLogService;
import com.min.edu.vo.approval.Approval_Doc;
import com.min.edu.vo.approval.Approval_Page;
import com.min.edu.vo.approval.Approval_line;
import com.min.edu.vo.approval.Approver;
import com.min.edu.vo.approval.Reference;
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

	@RequestMapping(value = "/mydoclist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String doclist(Model model, HttpServletRequest request) {

		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		
		String active = "3";
		if (request.getParameter("active") == null) {
			active = "3";
		} else {
			active = request.getParameter("active");
		}

		logger.info("ApprovalController 전체글 조회 List");

		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				active);
		doc.setPaging(paging);
		List<Approval_Doc> doclists = approvalServiceImpl.selectmyAllDoc(doc);
		paging.setTotal(approvalServiceImpl.selectTotalPagingAll(doc));
		
		
//		if(active.equals("3")) { doc.setApp_doc_st("진행"); doclists =
//		approvalServiceImpl.selectListDocSt(doc);
//		paging.setTotal(approvalServiceImpl.selectTotalPaging(doc)); }else
		 
		if (active.equals("4")) {
			doc.setApp_doc_st("진행");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("5")) {
			doc.setApp_doc_st("완료");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("6")) {
			doc.setApp_doc_st("반려");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));

		} else {
			paging.setTotal(approvalServiceImpl.selectTotalPagingAll(doc));
			doc.setPaging(paging);
		}

		System.out.println(paging);


		model.addAttribute("paging", paging);
		model.addAttribute("doclists", doclists);

		session.setAttribute("loc", "./mydoclist.do");

		return "/approval/mydoclist";
	}

	@GetMapping(value = "/docinsert.do")
	public String docinsert(Model model) {
		logger.info("ApprovalController 기안하기 문서 작성");
		int empno = (Integer) session.getAttribute("loginEmp");
		Emp empinfo = approvalServiceImpl.selectEmpInfo(empno);
		
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

	@PostMapping(value = "/appline.do")
	@ResponseBody
	public String appline(@RequestParam(value = "arr[]") int[] arr, Model model) {
		logger.info("ApprovalController 결재라인 등록");
		System.out.println("ajax 전달값 : " + arr);
		int[] applinenum = arr;
		System.out.println("applinenum : " + applinenum);
		model.addAttribute("appline", applinenum);

		Gson gson = new Gson();

		Approver approver = null;

		String approval = "{\"APPROVAL\":[";
		String appJson = null;

		for (int i = 0; i < applinenum.length; i++) {

			if (i == 0) {
				approver = new Approver(applinenum[i], // 결재자 회원번호
						"", // 승인 여부
						"", // 반려 사유
						"", // 결재일
						"y", // 대기 여부
						"");
			} else {
				approver = new Approver(applinenum[i], // 결재자 회원번호
						"", // 승인 여부
						"", // 반려 사유
						"", // 결재일
						"n", // 대기 여부
						"");

			}

			appJson = gson.toJson(approver);
			System.out.println(appJson);

			if (i != applinenum.length - 1) {
				approval += appJson + ",";
			}
		}

		// 마지막 결재자일시
		approval += appJson + "]}";

		return approval;
	}

	@PostMapping(value = "/docinsert.do")
	public String docapproval(Model model, HttpServletRequest req, @RequestParam String form_num, @RequestParam String app_line) {
		logger.info("ApprovalController 기안하기 문서 작성");
		System.out.println("form_num : " + form_num);
		int form_no = Integer.parseInt(form_num);
		String app_doc_title = req.getParameter("app_doc_title");
		String app_doc_content = req.getParameter("app_doc_content");
		String state = req.getParameter("doc_state");
		int emp_no = Integer.parseInt(req.getParameter("emp_no"));
		String ref_emp_no = req.getParameter("ref_emp_no");
		// 결재라인 등록
		Approval_line appline = new Approval_line(app_line);
		int app_line_no = approvalServiceImpl.insertappline(appline);
		Approval_Doc doc = new Approval_Doc(app_doc_title, ref_emp_no, app_doc_content, app_line_no, emp_no, form_no);
    if(state.equals("임시저장")) {
			doc.setApp_doc_st("임시저장");
		}else {
			doc.setApp_doc_st("진행");
		}
		approvalServiceImpl.insertDoc(doc);
		System.out.println("문서" + doc);
    session.setAttribute("loc", "");
		return "redirect:/home.do";
	}
	
	@GetMapping(value = "ingdoclist.do")
	public String ingdoclist(Model model) {
		logger.info("ApprovalController 결재 대기함 까꿍");
		
		return "/approval/ingdoclist";
	}


	@Autowired
	ISignDao signdao;

	// 문서 상세 화면
	@GetMapping(value = "/docdetail.do")
	public String docdetail(Model model, HttpServletRequest req) {
		int empno = (Integer) session.getAttribute("loginEmp");
		int docno = Integer.parseInt(req.getParameter("docno"));
		String docBox = req.getParameter("docBox");
		logger.info("문서 상세 보기 화면");
		System.out.println("문서번호: " + docno);

		// 문서번호로 상세보기
		Approval_Doc detaildoc = approvalServiceImpl.selectOneDoc(docno);

		System.out.println(detaildoc);
		System.out.println("form 이름 : " + detaildoc.getFvo().getForm_nm());
		System.out.println(detaildoc.getFvo().getForm_no());

		// 결재자 정보
		System.out.println("라인넘버: " + detaildoc.getApp_line_no());
		List<Approver> approver = approvalServiceImpl.selectSignList(detaildoc.getApp_line_no());
		System.out.println(approver);

		List<Emp> appInfo = new ArrayList<Emp>();
		for (Approver app : approver) {
			appInfo.add(approvalServiceImpl.selectEmpInfo(app.getEmp_no()));
		}

		// 작성자 회원 정보
		Emp empinfo = approvalServiceImpl.selectEmpInfo(detaildoc.getEmp_no());

		// 참조인 배열
		String ref = detaildoc.getRef_emp_no();
		System.out.println(ref);

		String[] str = null;

		if (ref != null) {
			str = ref.split(",");

			for (int i = 0; i < str.length; i++) {
				System.out.println("i번째 문자: " + str[i]);

				Emp emp = approvalServiceImpl.selectEmpInfo(Integer.parseInt(str[i]));
				String name = emp.getEmp_nm();
				System.out.println("회원번호: " + str[i] + ", 회원이름 : " + name);
				str[i] = name;
			}
		}

		List<String> reflist = null;

		// 서명 정보
		List<Sign> signlist = signdao.selectSignList(empno);

		model.addAttribute("signlist", signlist);
		model.addAttribute("empinfo", empinfo);
		model.addAttribute("refName", str);
		model.addAttribute("detaildoc", detaildoc);
		model.addAttribute("docBox", docBox);
		model.addAttribute("approver", approver);
		model.addAttribute("appInfo", appInfo);
		session.setAttribute("loc", "./docdetail.do?docno=" + docno);
		return "/approval/docdetail";
	}

	// 승인시 로직
	@ResponseBody
	@RequestMapping(value = "/approve.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> approve(HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();

		int signNo = Integer.parseInt(req.getParameter("signNo"));
		System.out.println("singno : " + signNo);
		String signimg;
		int docno = Integer.parseInt(req.getParameter("docNo"));
		// int empno = 2;
		System.out.println("사인 : " + signNo + "문서번호 : " + docno);
		int empno = (Integer) session.getAttribute("loginEmp");

		System.out.println("sign번호 : " + signNo + " docNo는 " + docno);
		boolean flag = false;

		// 현재시간
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH24:mm");
		String nowTime = format.format(date);

		// 라인에 싸인 정보 저장
		if (signNo == 0) {
			// 기본이미지
			signimg = "approve.PNG";
		} else {
			Sign sign = signdao.selectSignOne(signNo);
			signimg = sign.getSign_img();
		}

		// 내 결재 대기 상태 n로 변경
		Approval_Doc doc = approvalServiceImpl.selectOneDoc(docno);

		int lineNo = approvalServiceImpl.selectOneDoc(docno).getApp_line_no();

		Approval_line appline = approvalServiceImpl.selectLine(doc.getApp_line_no());

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
						signimg);

				flag = true; // 대기 상태 넘기기

				System.out.println("결재자 승인 업데이트");

			} else {
				// 다음 결재자가 존재 O
				if (flag) {
					approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
							empJson2.getAsString(), // 승인 여부
							empJson3.getAsString(), // 반려 사유
							empJson4.getAsString(), // 결재일
							"y", // 대기 여부
							empJson6.getAsString() // 전자서명

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

		// 결재라인 db 업데이트
		approvalServiceImpl.updateApproval(appline);

		// 결재 처음 진행시
		if (doc.getApp_doc_st() == "대기") {
			doc.setApp_doc_st("진행");
			approvalServiceImpl.updateDocSt(doc);
		}

		// 모든 결재자가 결재 승인시 -> 결재문서상태:완료 (db)업데이트
		if (flag) {

			doc.setApp_doc_no(docno);
			doc.setApp_doc_st("완료");
			approvalServiceImpl.updateDocSt(doc);
		}
		map.put("docBox", "개인");
		map.put("docno", docno);

		return map;
	}

	// 결재 반려시 로직
	@GetMapping(value = "/docReturn.do")
	public String docReturn(HttpServletRequest req) {

		int docno = Integer.parseInt(req.getParameter("docNo"));
		String reason = req.getParameter("reason");
		int empno = (Integer) session.getAttribute("loginEmp");
		
		// 현재시간
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH24:mm");
		String nowTime = format.format(date);

		// 내 결재 대기 상태 n로 변경
		int lineNo = approvalServiceImpl.selectOneDoc(docno).getApp_line_no();
		Approval_line appline = approvalServiceImpl.selectLine(lineNo);

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
			if (empJson1.getAsInt() == empno) {

				// APPROVAL[i].approval_st(승인여부) 값을 -> '반려'로 변경
				approver = new Approver(empJson1.getAsInt(), // 결재자 회원번호
						"반려", // 승인 여부
						reason, // 반려 사유
						nowTime, // 결재일
						"n", // 대기 여부
						"fail.PNG");

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

			// 마지막 결재자일시
			if (i == dataCNT - 1) {
				approval += appJson + "]}";

				appline.setApproval(approval);
				System.out.println("업데이트 된 결재자 리스트 : " + appline.getApproval());
			} else {
				approval += appJson + ",";
//				System.out.println();
//				System.out.println("변경후: " + approval);

			}

		}

		String appJson = gson.toJson(approver);
		System.out.println(appJson);

		appline.setApproval(approval);

		// 결재라인 db 업데이트
		approvalServiceImpl.updateApproval(appline);

		// 결재 문서 상태 반려로 변경
		Approval_Doc doc = new Approval_Doc();
		doc.setApp_doc_no(docno);
		doc.setApp_doc_st("반려");
//		System.out.println(doc.getApp_doc_no());
//		System.out.println(doc.getApp_doc_st());
		approvalServiceImpl.updateDocSt(doc);

		return "redirect:/home.do";
	}
	
		// 진행 문서함
		@GetMapping(value = "/progressdoc.do")
		@PostMapping(value = "/progressdoc.do")
		public String docListProgress(Model model, HttpServletRequest request) {

			logger.info("진행 문서함");
			Approval_Doc doc = new Approval_Doc();
			int empno = (Integer) session.getAttribute("loginEmp");
			doc.setEmp_no(empno);
			doc.setApp_doc_st("진행");
			String active;

			if (request.getParameter("active") != null) {
				
				active = request.getParameter("active");
			} else {
				active = "1";
			}
			Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
					request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
					request.getParameter("active"));
			doc.setPaging(paging);

			System.out.println(paging);
			// 송신
			List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
			// 수신경우
			List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);

			if (active.equals("2")) {
				paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
				System.out.println("paging 마지막 번호: " + paging.getTotal());
			} else {
				paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
				System.out.println("paging 마지막 번호: " + paging.getTotal());
			}

			model.addAttribute("doclist1", doclist1);
			model.addAttribute("doclist2", doclist2);
			model.addAttribute("paging", paging);

			session.setAttribute("loc", "./progressdoc.do");

			return "/approval/ingdoclist";
		}
	

	// 완료 문서함
	@GetMapping(value = "/completedoc.do")
	@PostMapping(value = "/completedoc.do")
	public String docListComplete(Model model, HttpServletRequest request) {

		logger.info("완료 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("완료");
		String active;

		if (request.getParameter("active") != null) {

			active = request.getParameter("active");
		} else {
			active = "1";
		}
		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				request.getParameter("active"));
		doc.setPaging(paging);

		System.out.println(paging);
		// 송신
		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		// 수신경우
		List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);

		if (active.equals("2")) {

			paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
			System.out.println("paging 마지막 번호: " + paging.getTotal());
		} else {

			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
			System.out.println("paging 마지막 번호: " + paging.getTotal());
		}

		
		
		for (Approval_Doc Doc1 : doclist1) {
			Doc1.setEmp_nm(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		for (Approval_Doc Doc2 : doclist2) {
			Doc2.setEmp_nm(approvalServiceImpl.selectEmpInfo(Doc2.getEmp_no()).getEmp_nm());
			System.out.println(approvalServiceImpl.selectEmpInfo(Doc2.getEmp_no()).getEmp_nm());
		}	


		model.addAttribute("doclist1", doclist1);
		model.addAttribute("doclist2", doclist2);
		model.addAttribute("paging", paging);

		session.setAttribute("loc", "./completedoc.do");

		return "/approval/compldoclist";
	}

	
	
	
	@RequestMapping(value="/progdoclist.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String progdoclist(Model model, HttpServletRequest request) {

		  
		  Approval_Doc doc = new Approval_Doc();
		  int empno = (Integer)session.getAttribute("loginEmp");
		  doc.setEmp_no(empno);

		  String active = "7";
		  if(request.getParameter("active") == null) {
			  active = "7";
		  }else {
			  active = request.getParameter("active");
		  }
		  
	      logger.info("ApprovalController 진행 상태글 조회 List");
	      
	      Approval_Page paging = new Approval_Page(
	               request.getParameter("index"),
	               request.getParameter("pageStartNum"),
	               request.getParameter("listCnt"),
	               request.getParameter("app_chk"),
	               request.getParameter("searchKeyword"),
	               active
	            );
		doc.setPaging(paging);
		List<Approval_Doc> doclists = approvalServiceImpl.selectmyAllDoc(doc);
		paging.setTotal(approvalServiceImpl.selectTotalPagingAll(doc));
		
		doc.setApp_doc_st("진행");
		
		if(active.equals("7")) {
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		}else if(active.equals("8")) {
			
			doclists = approvalServiceImpl.selectListDocStApp(doc);
			
			paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
		}
		
		System.out.println(paging);
	      
		  model.addAttribute("paging",paging);
	      model.addAttribute("doclists", doclists);
	      
	      session.setAttribute("loc", "./approval/progdoclist");
	      
	      return "/approval/progdoclist";
	}
	

	// 문서 삭제
	@GetMapping(value = "/docDelte.do")
	public String docDelete(HttpServletRequest req) {
		System.out.println(req.getParameter("docno"));
		int docno = Integer.parseInt(req.getParameter("docno"));

		Approval_Doc doc = new Approval_Doc();
		doc.setApp_doc_no(docno);
		doc.setApp_doc_st("삭제");
		approvalServiceImpl.updateDocSt(doc);

		return "redirect:/home.do";
	}

	// 임시저장 문서함
	@GetMapping(value = "/tempdoc.do")
	public String tmepdoc(Model model, HttpServletRequest request) {

		logger.info("임시 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("임시저장");
		String active = "0";

		if (request.getParameter("active") != null) {

			active = request.getParameter("active");
		} else {
			active = "1";
		}
		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				request.getParameter("active"));
		doc.setPaging(paging);

		System.out.println(paging);

		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
		model.addAttribute("doclist1", doclist1);
		model.addAttribute("paging", paging);
		session.setAttribute("loc", "./tempdoc.do");
		return "/approval/tempdoc";
	}

	// 참조 문서함
	@GetMapping(value = "/refdoclist.do")
	public String refdoclist(Model model, HttpServletRequest request) {

		logger.info("참조 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("참조");
		String active = "0";

		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				request.getParameter("active"));
		doc.setPaging(paging);

		System.out.println(paging);

		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListRef(doc);
		paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
		for (Approval_Doc Doc1 : doclist1) {
			Doc1.setEmp_nm(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		
		model.addAttribute("doclist1", doclist1);
		model.addAttribute("paging", paging);

		session.setAttribute("loc", "./refdoclist.do");
		return "/approval/refdoclist";
	}

	@GetMapping(value = "/waitdoclist.do")
	public String waitdoclist(Model model, HttpServletRequest request) {
		logger.info("대기 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
//		doc.setApp_doc_st("대기");
		String active = "0";

		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				request.getParameter("active"));
		doc.setPaging(paging);

		System.out.println(paging);

		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListWait(doc);
		for (Approval_Doc Doc1 : doclist1) {
			Doc1.setEmp_nm(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
			System.out.println(approvalServiceImpl.selectEmpInfo(Doc1.getEmp_no()).getEmp_nm());
		}	
		
		paging.setTotal(approvalServiceImpl.selectTotalPagingWait(doc));
		model.addAttribute("doclist1", doclist1);
		model.addAttribute("paging", paging);

		session.setAttribute("loc", "./waitdoclist.do");
		return "/approval/waitdoclist";
	}

	// 문서 상세 화면으로 이동"docno":no, "docBox":docBox
	@ResponseBody
	@RequestMapping(value = "/detailAjax.do", method = RequestMethod.POST)
	public Map<String, Object> detailAjax(Model model, String docno, String docBox) {

		System.out.println("문서함 위치: " + docBox);

		System.out.println("ajax 요청 도착!" + docno + ", " + docBox);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("docno", docno);
		map.put("docBox", docBox);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/reqAjax.do", method = RequestMethod.POST)
	public Map<String, String> reqAjax(String title, String toggle) {
		System.out.println("ajax 요청 도착!" + title + ", " + toggle);
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("toggle", toggle);

		return map;
	}

	@GetMapping(value = "/searchdoclist.do")
	public String searchdoclist2(String title, String toggle, Model model) {

		logger.info("완료 문서함");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("완료");

		List<Approval_Doc> searchlist1 = new ArrayList<Approval_Doc>();
		List<Approval_Doc> searchlist2 = new ArrayList<Approval_Doc>();

		// 송신
		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		for (Approval_Doc doc1 : doclist1) {
			if (doc1.getApp_doc_title().contains(title)) {
				searchlist1.add(doc1);
			}
		}

		// 수신경우

		List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);

		for (Approval_Doc doc2 : doclist2) {
			if (doc2.getApp_doc_title().contains(title)) {
				searchlist2.add(doc2);
			}
		}

		model.addAttribute("doclist1", searchlist1);
		model.addAttribute("doclist2", searchlist2);

		return "/approval/compldoclist";
	}

	@ResponseBody
	@RequestMapping(value = "/page.do", method = RequestMethod.POST)
	public Map<String, Object> pagingAjax(HttpServletRequest request) {
		int index = Integer.parseInt(request.getParameter("index"));
		int pageStartNum = Integer.parseInt(request.getParameter("pageStartNum"));
		int listCnt = Integer.parseInt(request.getParameter("listCnt"));
		String app_chk = request.getParameter("app_chk");
		String searchKeyword = request.getParameter("searchKeyword");
		String active = request.getParameter("active");

		Gson gson = new Gson();

		System.out.println("ajax 전송 완료! ");
		System.out.println(index + " " + pageStartNum + " " + listCnt + " " + app_chk + " " + searchKeyword
				+ " active: " + active);

		Map<String, Object> map = new HashMap<String, Object>();

		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
//		doc.setApp_doc_st("완료");

		;

		logger.info("ApprovalController 전체글 조회 List");

		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				request.getParameter("active"));

		int pageCnt = paging.getPageCnt();
		int total = paging.getTotal();

		doc.setPaging(paging);
		List<Approval_Doc> doclist = approvalServiceImpl.selectmyAllDoc(doc);
		List<Approval_Doc> doclists = new ArrayList<Approval_Doc>();
		paging.setTotal(approvalServiceImpl.selectTotalPagingAll(doc));

		System.out.println(paging);

		if (active.equals("1")) {
			doc.setApp_doc_st("완료");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));

		} else if (active.equals("2")) {
			doc.setApp_doc_st("완료");
			doclists = approvalServiceImpl.selectListDocStApp(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
		} else if (active.equals("4")) {
			doc.setApp_doc_st("진행");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("5")) {
			doc.setApp_doc_st("완료");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("6")) {
			doc.setApp_doc_st("반려");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else {
			doclists = doclist;
		}

		int count = paging.getCount();

		String json = gson.toJson(paging);

		map.put("doclists", doclists);
		map.put("paging", json);
		map.put("pageCnt", pageCnt);
		map.put("index", index);
		map.put("pageStartNum", pageStartNum);
		map.put("listCnt", listCnt);
		map.put("total", total);
		map.put("pageCnt", pageCnt);
		map.put("app_chk", app_chk);
		map.put("searchkeyword", searchKeyword);
		map.put("active", active);
		map.put("count", count);

		return map;
	}

	@RequestMapping(value = "/feedback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> feedback(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<String, Object>();

		String docno = req.getParameter("docNo");
		String feedback = req.getParameter("feedback");
		int empno = (Integer) session.getAttribute("loginEmp");

		Reference ref = new Reference(docno, empno, feedback);
		approvalServiceImpl.updatefeedback(ref);

		List<Map<String, Object>> feedList = approvalServiceImpl.selectfeedback(Integer.parseInt(docno));
		for (Map<String, Object> map2 : feedList) {
			String feedIcon = (String) map2.get("feedback");
			int cnt = (Integer) map2.get("cnt");
			map.put(feedIcon, cnt);
		}

		return map;
	}

	@RequestMapping(value = "/updateForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateForm(Model model, HttpServletRequest req) {
		logger.info("ApprovalController 기안하기 문서 작성");
		int empno = (Integer) session.getAttribute("loginEmp");
		Emp empinfo = approvalServiceImpl.selectEmpInfo(empno);
		model.addAttribute("empinfo", empinfo);
		List<Department> deptlists = approvalServiceImpl.selectAllDept();
		List<Emp> emplists = approvalServiceImpl.selectAllEmp();
		List<Position> plists = approvalServiceImpl.selectAllPosition();

		int docno = Integer.parseInt(req.getParameter("docno"));

		logger.info("문서 상세 보기 화면");
		System.out.println("문서번호: " + docno);

		// 문서번호로 상세보기
		Approval_Doc detaildoc = approvalServiceImpl.selectOneDoc(docno);

		System.out.println(detaildoc);
		System.out.println("form 이름 : " + detaildoc.getFvo().getForm_nm());
		System.out.println(detaildoc.getFvo().getForm_no());

		// 결재자 정보
		System.out.println("라인넘버: " + detaildoc.getApp_line_no());
		List<Approver> approver = approvalServiceImpl.selectSignList(detaildoc.getApp_line_no());
		System.out.println(approver);

		List<Emp> appInfo = new ArrayList<Emp>();
		for (Approver app : approver) {
			appInfo.add(approvalServiceImpl.selectEmpInfo(app.getEmp_no()));
		}

		// 참조인 배열
		String ref = detaildoc.getRef_emp_no();
		System.out.println(ref);

		String[] str = null;

		if (ref != null) {
			str = ref.split(",");

			for (int i = 0; i < str.length; i++) {
				System.out.println("i번째 문자: " + str[i]);

				Emp emp = approvalServiceImpl.selectEmpInfo(Integer.parseInt(str[i]));
				String name = emp.getEmp_nm();
				System.out.println("회원번호: " + str[i] + ", 회원이름 : " + name);
				str[i] = name;
			}
		}

		List<String> reflist = null;

		// 서명 정보
		List<Sign> signlist = signdao.selectSignList(empno);

		model.addAttribute("signlist", signlist);
		model.addAttribute("empinfo", empinfo);
		model.addAttribute("refName", str);
		model.addAttribute("detaildoc", detaildoc);
		model.addAttribute("deptlists", deptlists);
		model.addAttribute("plists", plists);
		model.addAttribute("emplists", emplists);
		model.addAttribute("approver", approver);
		model.addAttribute("appInfo", appInfo);
		session.setAttribute("loc", "./updateForm.do?docno=" + docno);

		return "/approval/updateForm";
	}

	
	@RequestMapping(value="/updateDoc.do", method = {RequestMethod.POST})
	public String updateDoc(HttpServletRequest req) {
		
		 logger.info("ApprovalController 기안하기 문서 작성");
	    
	      int app_line_no = Integer.parseInt(req.getParameter("app_line_no"));
	      String app_doc_title = req.getParameter("app_doc_title");
	      String app_doc_content = req.getParameter("app_doc_content");
	  	  int docno = Integer.parseInt(req.getParameter("docno"));
	  	  //String refNo = req.getParameter("refNo");
	  	  String refNo = "1,2,3";
	      
	      String appState = req.getParameter("appState");
	      
	      Approval_Doc doc = new Approval_Doc();
	      doc.setApp_doc_content(app_doc_content);
	      doc.setApp_doc_no(docno);
	      doc.setApp_line_no(app_line_no);
	      doc.setRef_emp_no(refNo);
	      doc.setApp_doc_st(appState);
	      approvalServiceImpl.updateDoc(doc);
	      System.out.println("문서"+doc);
	      
		session.setAttribute("loc", "./mydoclist.do");
		return "redirect:/home.do";
	}
	

}
