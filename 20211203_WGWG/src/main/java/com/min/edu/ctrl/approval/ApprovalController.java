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

		logger.info("ApprovalController ????????? ?????? List");

		Approval_Page paging = new Approval_Page(request.getParameter("index"), request.getParameter("pageStartNum"),
				request.getParameter("listCnt"), request.getParameter("app_chk"), request.getParameter("searchKeyword"),
				active);
		doc.setPaging(paging);
		List<Approval_Doc> doclists = approvalServiceImpl.selectmyAllDoc(doc);
		paging.setTotal(approvalServiceImpl.selectTotalPagingAll(doc));
		
		
//		if(active.equals("3")) { doc.setApp_doc_st("??????"); doclists =
//		approvalServiceImpl.selectListDocSt(doc);
//		paging.setTotal(approvalServiceImpl.selectTotalPaging(doc)); }else
		 
		if (active.equals("4")) {
			doc.setApp_doc_st("??????");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("5")) {
			doc.setApp_doc_st("??????");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("6")) {
			doc.setApp_doc_st("??????");
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
		logger.info("ApprovalController ???????????? ?????? ??????");
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
		logger.info("ApprovalController ???????????? ??????");
		System.out.println("ajax ????????? : " + arr);
		int[] applinenum = arr;
		System.out.println("applinenum : " + applinenum);
		model.addAttribute("appline", applinenum);

		Gson gson = new Gson();

		Approver approver = null;

		String approval = "{\"APPROVAL\":[";
		String appJson = null;

		for (int i = 0; i < applinenum.length; i++) {

			if (i == 0) {
				approver = new Approver(applinenum[i], // ????????? ????????????
						"", // ?????? ??????
						"", // ?????? ??????
						"", // ?????????
						"y", // ?????? ??????
						"");
			} else {
				approver = new Approver(applinenum[i], // ????????? ????????????
						"", // ?????? ??????
						"", // ?????? ??????
						"", // ?????????
						"n", // ?????? ??????
						"");

			}

			appJson = gson.toJson(approver);
			System.out.println(appJson);

			if (i != applinenum.length - 1) {
				approval += appJson + ",";
			}
		}

		// ????????? ???????????????
		approval += appJson + "]}";

		return approval;
	}

	@PostMapping(value = "/docinsert.do")
	public String docapproval(Model model, HttpServletRequest req, @RequestParam String form_num, @RequestParam String app_line) {
		logger.info("ApprovalController ???????????? ?????? ??????");
		System.out.println("form_num : " + form_num);
		int form_no = Integer.parseInt(form_num);
		String app_doc_title = req.getParameter("app_doc_title");
		String app_doc_content = req.getParameter("app_doc_content");
		String state = req.getParameter("doc_state");
		int emp_no = Integer.parseInt(req.getParameter("emp_no"));
		String ref_emp_no = req.getParameter("ref_emp_no");
		// ???????????? ??????
		Approval_line appline = new Approval_line(app_line);
		int app_line_no = approvalServiceImpl.insertappline(appline);
		Approval_Doc doc = new Approval_Doc(app_doc_title, ref_emp_no, app_doc_content, app_line_no, emp_no, form_no);
    if(state.equals("????????????")) {
			doc.setApp_doc_st("????????????");
		}else {
			doc.setApp_doc_st("??????");
		}
		approvalServiceImpl.insertDoc(doc);
		System.out.println("??????" + doc);
    session.setAttribute("loc", "");
		return "redirect:/home.do";
	}
	
	@GetMapping(value = "ingdoclist.do")
	public String ingdoclist(Model model) {
		logger.info("ApprovalController ?????? ????????? ??????");
		
		return "/approval/ingdoclist";
	}


	@Autowired
	ISignDao signdao;

	// ?????? ?????? ??????
	@GetMapping(value = "/docdetail.do")
	public String docdetail(Model model, HttpServletRequest req) {
		int empno = (Integer) session.getAttribute("loginEmp");
		int docno = Integer.parseInt(req.getParameter("docno"));
		String docBox = req.getParameter("docBox");
		logger.info("?????? ?????? ?????? ??????");
		System.out.println("????????????: " + docno);

		// ??????????????? ????????????
		Approval_Doc detaildoc = approvalServiceImpl.selectOneDoc(docno);

		System.out.println(detaildoc);
		System.out.println("form ?????? : " + detaildoc.getFvo().getForm_nm());
		System.out.println(detaildoc.getFvo().getForm_no());

		// ????????? ??????
		System.out.println("????????????: " + detaildoc.getApp_line_no());
		List<Approver> approver = approvalServiceImpl.selectSignList(detaildoc.getApp_line_no());
		System.out.println(approver);

		List<Emp> appInfo = new ArrayList<Emp>();
		for (Approver app : approver) {
			appInfo.add(approvalServiceImpl.selectEmpInfo(app.getEmp_no()));
		}

		// ????????? ?????? ??????
		Emp empinfo = approvalServiceImpl.selectEmpInfo(detaildoc.getEmp_no());

		// ????????? ??????
		String ref = detaildoc.getRef_emp_no();
		System.out.println(ref);

		String[] str = null;

		if (ref != null) {
			str = ref.split(",");

			for (int i = 0; i < str.length; i++) {
				System.out.println("i?????? ??????: " + str[i]);

				Emp emp = approvalServiceImpl.selectEmpInfo(Integer.parseInt(str[i]));
				String name = emp.getEmp_nm();
				System.out.println("????????????: " + str[i] + ", ???????????? : " + name);
				str[i] = name;
			}
		}

		List<String> reflist = null;

		// ?????? ??????
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

	// ????????? ??????
	@ResponseBody
	@RequestMapping(value = "/approve.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> approve(HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();

		int signNo = Integer.parseInt(req.getParameter("signNo"));
		System.out.println("singno : " + signNo);
		String signimg;
		int docno = Integer.parseInt(req.getParameter("docNo"));
		// int empno = 2;
		System.out.println("?????? : " + signNo + "???????????? : " + docno);
		int empno = (Integer) session.getAttribute("loginEmp");

		System.out.println("sign?????? : " + signNo + " docNo??? " + docno);
		boolean flag = false;

		// ????????????
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH24:mm");
		String nowTime = format.format(date);

		// ????????? ?????? ?????? ??????
		if (signNo == 0) {
			// ???????????????
			signimg = "approve.PNG";
		} else {
			Sign sign = signdao.selectSignOne(signNo);
			signimg = sign.getSign_img();
		}

		// ??? ?????? ?????? ?????? n??? ??????
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
					"Json?????? : " + empJson1 + ", " + empJson2 + ", " + empJson3 + ", " + empJson4 + ", " + empJson5);

			// JSONARRAY?????? ????????? ??????????????? ???????????? ???????????? ?????????
			if (empJson1.getAsInt() == empno) {

				// APPROVAL[i].approval_st(????????????) ?????? -> '??????'?????? ??????
				approver = new Approver(empJson1.getAsInt(), // ????????? ????????????
						"??????", // ?????? ??????
						empJson3.getAsString(), // ?????? ??????
						nowTime, // ?????????
						"n", // ?????? ??????
						signimg);

				flag = true; // ?????? ?????? ?????????

				System.out.println("????????? ?????? ????????????");

			} else {
				// ?????? ???????????? ?????? O
				if (flag) {
					approver = new Approver(empJson1.getAsInt(), // ????????? ????????????
							empJson2.getAsString(), // ?????? ??????
							empJson3.getAsString(), // ?????? ??????
							empJson4.getAsString(), // ?????????
							"y", // ?????? ??????
							empJson6.getAsString() // ????????????

					);
					flag = false;
					System.out.println("??????????????? ?????? ???????????? ??????");
				} else {

					approver = new Approver(empJson1.getAsInt(), // ????????? ????????????
							empJson2.getAsString(), // ?????? ??????
							empJson3.getAsString(), // ?????? ??????
							empJson4.getAsString(), // ?????????
							empJson5.getAsString(), // ?????? ??????
							empJson6.getAsString() // ????????????
					);
				}
			}

			
			String appJson = gson.toJson(approver);
			System.out.println(appJson);

			// ????????? ???????????????
			if (i == dataCNT - 1) {
				approval += appJson + "]}";
				appline.setApproval(approval);
				System.out.println("???????????? ??? ????????? ????????? : " + appline.getApproval());
			} else {
				approval += appJson + ",";
				System.out.println();
				System.out.println("?????????: " + approval);
			}

			System.out.println();

		}

		// ???????????? db ????????????
		approvalServiceImpl.updateApproval(appline);

		// ?????? ?????? ?????????
		if (doc.getApp_doc_st() == "??????") {
			doc.setApp_doc_st("??????");
			approvalServiceImpl.updateDocSt(doc);
		}

		// ?????? ???????????? ?????? ????????? -> ??????????????????:?????? (db)????????????
		if (flag) {

			doc.setApp_doc_no(docno);
			doc.setApp_doc_st("??????");
			approvalServiceImpl.updateDocSt(doc);
		}
		map.put("docBox", "??????");
		map.put("docno", docno);

		return map;
	}

	// ?????? ????????? ??????
	@GetMapping(value = "/docReturn.do")
	public String docReturn(HttpServletRequest req) {

		int docno = Integer.parseInt(req.getParameter("docNo"));
		String reason = req.getParameter("reason");
		int empno = (Integer) session.getAttribute("loginEmp");
		
		// ????????????
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH24:mm");
		String nowTime = format.format(date);

		// ??? ?????? ?????? ?????? n??? ??????
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
					"Json?????? : " + empJson1 + ", " + empJson2 + ", " + empJson3 + ", " + empJson4 + ", " + empJson5);

			// 1??? ????????? ?????? ?????? ??????
			// JSONARRAY?????? ????????? ??????????????? ???????????? ???????????? ?????????
			if (empJson1.getAsInt() == empno) {

				// APPROVAL[i].approval_st(????????????) ?????? -> '??????'??? ??????
				approver = new Approver(empJson1.getAsInt(), // ????????? ????????????
						"??????", // ?????? ??????
						reason, // ?????? ??????
						nowTime, // ?????????
						"n", // ?????? ??????
						"fail.PNG");

				System.out.println("????????? ?????? ????????????");

			} else {

				approver = new Approver(empJson1.getAsInt(), // ????????? ????????????
						empJson2.getAsString(), // ?????? ??????
						empJson3.getAsString(), // ?????? ??????
						empJson4.getAsString(), // ?????????
						empJson5.getAsString(), // ?????? ??????
						empJson6.getAsString() // ?????? ??????
				);

			}

			String appJson = gson.toJson(approver);
			System.out.println(appJson);

			// ????????? ???????????????
			if (i == dataCNT - 1) {
				approval += appJson + "]}";

				appline.setApproval(approval);
				System.out.println("???????????? ??? ????????? ????????? : " + appline.getApproval());
			} else {
				approval += appJson + ",";
//				System.out.println();
//				System.out.println("?????????: " + approval);

			}

		}

		String appJson = gson.toJson(approver);
		System.out.println(appJson);

		appline.setApproval(approval);

		// ???????????? db ????????????
		approvalServiceImpl.updateApproval(appline);

		// ?????? ?????? ?????? ????????? ??????
		Approval_Doc doc = new Approval_Doc();
		doc.setApp_doc_no(docno);
		doc.setApp_doc_st("??????");
//		System.out.println(doc.getApp_doc_no());
//		System.out.println(doc.getApp_doc_st());
		approvalServiceImpl.updateDocSt(doc);

		return "redirect:/home.do";
	}
	
		// ?????? ?????????
		@GetMapping(value = "/progressdoc.do")
		@PostMapping(value = "/progressdoc.do")
		public String docListProgress(Model model, HttpServletRequest request) {

			logger.info("?????? ?????????");
			Approval_Doc doc = new Approval_Doc();
			int empno = (Integer) session.getAttribute("loginEmp");
			doc.setEmp_no(empno);
			doc.setApp_doc_st("??????");
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
			// ??????
			List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
			// ????????????
			List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);

			if (active.equals("2")) {
				paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
				System.out.println("paging ????????? ??????: " + paging.getTotal());
			} else {
				paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
				System.out.println("paging ????????? ??????: " + paging.getTotal());
			}

			model.addAttribute("doclist1", doclist1);
			model.addAttribute("doclist2", doclist2);
			model.addAttribute("paging", paging);

			session.setAttribute("loc", "./progressdoc.do");

			return "/approval/ingdoclist";
		}
	

	// ?????? ?????????
	@GetMapping(value = "/completedoc.do")
	@PostMapping(value = "/completedoc.do")
	public String docListComplete(Model model, HttpServletRequest request) {

		logger.info("?????? ?????????");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("??????");
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
		// ??????
		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		// ????????????
		List<Approval_Doc> doclist2 = approvalServiceImpl.selectListDocStApp(doc);

		if (active.equals("2")) {

			paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
			System.out.println("paging ????????? ??????: " + paging.getTotal());
		} else {

			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
			System.out.println("paging ????????? ??????: " + paging.getTotal());
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
		  
	      logger.info("ApprovalController ?????? ????????? ?????? List");
	      
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
		
		doc.setApp_doc_st("??????");
		
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
	

	// ?????? ??????
	@GetMapping(value = "/docDelte.do")
	public String docDelete(HttpServletRequest req) {
		System.out.println(req.getParameter("docno"));
		int docno = Integer.parseInt(req.getParameter("docno"));

		Approval_Doc doc = new Approval_Doc();
		doc.setApp_doc_no(docno);
		doc.setApp_doc_st("??????");
		approvalServiceImpl.updateDocSt(doc);

		return "redirect:/home.do";
	}

	// ???????????? ?????????
	@GetMapping(value = "/tempdoc.do")
	public String tmepdoc(Model model, HttpServletRequest request) {

		logger.info("?????? ?????????");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("????????????");
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

	// ?????? ?????????
	@GetMapping(value = "/refdoclist.do")
	public String refdoclist(Model model, HttpServletRequest request) {

		logger.info("?????? ?????????");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("??????");
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
		logger.info("?????? ?????????");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
//		doc.setApp_doc_st("??????");
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

	// ?????? ?????? ???????????? ??????"docno":no, "docBox":docBox
	@ResponseBody
	@RequestMapping(value = "/detailAjax.do", method = RequestMethod.POST)
	public Map<String, Object> detailAjax(Model model, String docno, String docBox) {

		System.out.println("????????? ??????: " + docBox);

		System.out.println("ajax ?????? ??????!" + docno + ", " + docBox);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("docno", docno);
		map.put("docBox", docBox);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/reqAjax.do", method = RequestMethod.POST)
	public Map<String, String> reqAjax(String title, String toggle) {
		System.out.println("ajax ?????? ??????!" + title + ", " + toggle);
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("toggle", toggle);

		return map;
	}

	@GetMapping(value = "/searchdoclist.do")
	public String searchdoclist2(String title, String toggle, Model model) {

		logger.info("?????? ?????????");
		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
		doc.setApp_doc_st("??????");

		List<Approval_Doc> searchlist1 = new ArrayList<Approval_Doc>();
		List<Approval_Doc> searchlist2 = new ArrayList<Approval_Doc>();

		// ??????
		List<Approval_Doc> doclist1 = approvalServiceImpl.selectListDocSt(doc);
		for (Approval_Doc doc1 : doclist1) {
			if (doc1.getApp_doc_title().contains(title)) {
				searchlist1.add(doc1);
			}
		}

		// ????????????

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

		System.out.println("ajax ?????? ??????! ");
		System.out.println(index + " " + pageStartNum + " " + listCnt + " " + app_chk + " " + searchKeyword
				+ " active: " + active);

		Map<String, Object> map = new HashMap<String, Object>();

		Approval_Doc doc = new Approval_Doc();
		int empno = (Integer) session.getAttribute("loginEmp");
		doc.setEmp_no(empno);
//		doc.setApp_doc_st("??????");

		;

		logger.info("ApprovalController ????????? ?????? List");

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
			doc.setApp_doc_st("??????");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));

		} else if (active.equals("2")) {
			doc.setApp_doc_st("??????");
			doclists = approvalServiceImpl.selectListDocStApp(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPagingApp(doc));
		} else if (active.equals("4")) {
			doc.setApp_doc_st("??????");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("5")) {
			doc.setApp_doc_st("??????");
			doclists = approvalServiceImpl.selectListDocSt(doc);
			paging.setTotal(approvalServiceImpl.selectTotalPaging(doc));
		} else if (active.equals("6")) {
			doc.setApp_doc_st("??????");
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
		logger.info("ApprovalController ???????????? ?????? ??????");
		int empno = (Integer) session.getAttribute("loginEmp");
		Emp empinfo = approvalServiceImpl.selectEmpInfo(empno);
		model.addAttribute("empinfo", empinfo);
		List<Department> deptlists = approvalServiceImpl.selectAllDept();
		List<Emp> emplists = approvalServiceImpl.selectAllEmp();
		List<Position> plists = approvalServiceImpl.selectAllPosition();

		int docno = Integer.parseInt(req.getParameter("docno"));

		logger.info("?????? ?????? ?????? ??????");
		System.out.println("????????????: " + docno);

		// ??????????????? ????????????
		Approval_Doc detaildoc = approvalServiceImpl.selectOneDoc(docno);

		System.out.println(detaildoc);
		System.out.println("form ?????? : " + detaildoc.getFvo().getForm_nm());
		System.out.println(detaildoc.getFvo().getForm_no());

		// ????????? ??????
		System.out.println("????????????: " + detaildoc.getApp_line_no());
		List<Approver> approver = approvalServiceImpl.selectSignList(detaildoc.getApp_line_no());
		System.out.println(approver);

		List<Emp> appInfo = new ArrayList<Emp>();
		for (Approver app : approver) {
			appInfo.add(approvalServiceImpl.selectEmpInfo(app.getEmp_no()));
		}

		// ????????? ??????
		String ref = detaildoc.getRef_emp_no();
		System.out.println(ref);

		String[] str = null;

		if (ref != null) {
			str = ref.split(",");

			for (int i = 0; i < str.length; i++) {
				System.out.println("i?????? ??????: " + str[i]);

				Emp emp = approvalServiceImpl.selectEmpInfo(Integer.parseInt(str[i]));
				String name = emp.getEmp_nm();
				System.out.println("????????????: " + str[i] + ", ???????????? : " + name);
				str[i] = name;
			}
		}

		List<String> reflist = null;

		// ?????? ??????
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
		
		 logger.info("ApprovalController ???????????? ?????? ??????");
	    
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
	      System.out.println("??????"+doc);
	      
		session.setAttribute("loc", "./mydoclist.do");
		return "redirect:/home.do";
	}
	

}
