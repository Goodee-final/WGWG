package com.min.edu.ctrl.worklog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.min.edu.model.form.IFormService;
import com.min.edu.model.worklog.IWorkLogService;
import com.min.edu.vo.emp.Department;
import com.min.edu.vo.emp.Emp;
import com.min.edu.vo.worklog.WorkLog;

@Controller
public class WorkLogController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IWorkLogService workLogService;

	public int emp_no = 9;
//	public int dept_no = 90;

	@Autowired
	private IFormService formService;

	@RequestMapping(value = "/worklogList.do", method = RequestMethod.GET)
//	public String worklogList(Model model,@RequestParam int emp_no,@RequestParam int dept_no) {
	public String worklogList(Model model) {
		logger.info("WorkLogController worklogList 리스트 화면");
		logger.info("업무일지 조회 페이지로 이동");

		int emp_no = 9;
		Emp emp = null;
		emp = workLogService.selectEmpNo(emp_no);
		logger.info("emp selectEmpNo(emp_no) : ", emp.toString());

		model.addAttribute("emp", emp);

//		model.addAttribute("emp_no", emp.getEmp_no());
		logger.info("전달받은 개인 번호 {}", emp.getEmp_no());

		List<WorkLog> worklogmylist = workLogService.selectAllMyWorkLog(emp.getEmp_no());
		model.addAttribute("worklogmylist", worklogmylist);

		model.addAttribute("dept_no", emp.getDept_no());
		logger.info("전달받은 부서 번호 {}", emp.getDept_no());

		List<WorkLog> worklogdeptlist = workLogService.selectAllDeptWorkLog(emp.getDept_no());
		model.addAttribute("worklogdeptlist", worklogdeptlist);

		return "/worklog/worklogList";
	}

//	@RequestMapping(value = "/worklogList.do", method = RequestMethod.GET)
//	public String worklogList(Model model) {
//		Emp e = null;
//		e = workLogService.selectEmpDP(emp_no);
//		logger.info("worklogList의 selectedEmpNo : {}", emp_no);
//		logger.info("e : {}", e);
//		model.addAttribute("emp", e);
//		int dept_no = e.getDept_no();
//		
//		logger.info("전달받은 부서 번호 {}", dept_no);
//		
//		//
////		logger.info("WorkLogController worklogList 리스트 화면");
////		logger.info("업무일지 조회 페이지로 이동");
////		model.addAttribute("emp_no", emp_no);
////		logger.info("전달받은 개인 번호 {}", emp_no);
//
//		List<WorkLog> worklogmylist = workLogService.selectAllMyWorkLog(emp_no);
//		model.addAttribute("worklogmylist", worklogmylist);
//
//		List<WorkLog> worklogdeptlist = workLogService.selectAllDeptWorkLog(dept_no);
//		model.addAttribute("worklogdeptlist", worklogdeptlist);
//
//		return "./worklog/worklogList";
//	}

	// worklogList.jsp 에서 사용할 메소드
	/*
	 * @RequestMapping(value="/worklogList.do", method=RequestMethod.GET) public
	 * String worklogList() { logger.info("WorkLogController worklogList");
	 * logger.info("업무일지 조회 페이지로 이동"); return "./worklog/worklogList"; }
	 * 
	 * @RequestMapping(value = "/worklogMyList.do", method=RequestMethod.POST)
	 * public String worklogMyList(Model model, int emp_no) {
	 * logger.info("WorkLogController worklogList 리스트 화면");
	 * 
	 * model.addAttribute("emp_no", emp_no); logger.info("전달받은 개인 번호 {}", emp_no);
	 * List<WorkLog> worklogmylist = workLogService.selectAllMyWorkLog(emp_no);
	 * model.addAttribute("worklogmylist", worklogmylist);
	 * 
	 * return "./worklog/worklogList"; }
	 * 
	 * @RequestMapping(value = "/worklogDeptList.do", method=RequestMethod.POST)
	 * public String worklogDeptList(Model model, int dept_no) {
	 * logger.info("WorkLogController worklogList 리스트 화면");
	 * logger.info("전달받은 부서 번호 {}", dept_no);
	 * 
	 * model.addAttribute("dept_no", dept_no); List<WorkLog> worklogdeptlist =
	 * workLogService.selectAllDeptWorkLog(dept_no);
	 * model.addAttribute("worklogdeptlist", worklogdeptlist);
	 * 
	 * return "./worklog/worklogList"; }
	 */

	@RequestMapping(value = "/worklogDetail.do", method = RequestMethod.GET)
//	public String worklogDetail(Model model, @RequestParam("no") int worklog_no) {
	public String worklogDetail(Model model, @RequestParam int worklog_no) {

		logger.info("WorkLogController worklogDetail 상세 조회 화면");
		logger.info("전달받은 업무일지 번호 {}", worklog_no);
		WorkLog selectWorklog = workLogService.selectDetailWorkLog(worklog_no);
		model.addAttribute("selectWorklog", selectWorklog);
		return "/worklog/worklogDetail";
	}

	// MAV 이용하기
//	@RequestMapping(value = "/worklogDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView worklogDetail(int worklog_no) {
//		logger.info("WorkLogController worklogDetail 상세 조회 화면");
//		logger.info("전달받은 업무일지 번호 {}", worklog_no);
//		
//		ModelAndView mav = new ModelAndView();
//		// 값과 이동 jsp를 같이 mav 객체에 담아 준다
//		WorkLog selectWorklog = workLogService.selectDetailWorkLog(worklog_no);
//		mav.setViewName("./worklog/worklogDetail");
//		mav.addObject("vo",selectWorklog);
//		return mav;
//	}

	@RequestMapping(value = "/searchWorkLog.do", method = RequestMethod.POST)
	public String searchWorkLog(Model model, @RequestParam String searchWord) {
		logger.info("WorkLogController searchWorkLog 검색");
		logger.info("#######전달받은 검색어 {}", searchWord);
//		logger.info("#######전달받은 기간 검색어 : " + startDate + ", " + endDate);
		List<WorkLog> wordList = workLogService.searchWorkLog(searchWord);
		model.addAttribute("wordList", wordList);

//		날짜 쿼리 만든 거 스크립트 파일에 있으니까 매퍼 만들고 다오랑 서비스 만들어서 연결해놓기
//		그리고 model.addAttribute 하기

		return "/worklog/worklogList";
	}

	@RequestMapping(value = "/searchByDate.do", method = RequestMethod.POST)
	public String searchByDate(Model model, @RequestParam Map<String, Object> map) {
		logger.info("WorkLogController searchWorkLog 검색");

//		map.put("startDate", "startDate");
//		map.put("endDate", "endDate");

		logger.info("#######전달받은 기간 검색어 : " + map);
		logger.info("#######전달받은 기간 검색어 startDate : " + map.get("startDate"));
		logger.info("#######전달받은 기간 검색어 endDate : " + map.get("endDate"));

		String sd = (String) map.get("startDate");
		String[] arrSD = sd.split("-");
		for (String s : arrSD) {
			System.out.println(s);}
		String startDate = arrSD[0]+arrSD[1]+arrSD[2];
		logger.info("####### startDate : " + startDate);
		model.addAttribute("startDate", startDate);
		
		String ed = (String) map.get("endDate");
		String[] arrED = ed.split("-");
		for (String e : arrED) {
			System.out.println(e);}
		String endDate = arrED[0]+arrED[1]+arrED[2];
		logger.info("####### endDate : " + endDate);
		model.addAttribute("endDate", endDate);
		
		
//		model.addAttribute("endDate", endDate);
	List<WorkLog> dateList = new ArrayList<WorkLog>();
	dateList=workLogService.searchByDate(map);
//		List<WorkLog> dateList = new ArrayList<WorkLog>();
//		dateList.add(map)
//		WorkLog worklog
//		map.put(null, dateList)
	model.addAttribute("dateList",dateList);return"/worklog/worklogList";
	}

	@RequestMapping(value = "/worklogInsert.do", method = RequestMethod.GET)
	public String insertWorkLogForm(HttpServletResponse response, Model model) {
		logger.info("WorkLogController insertWorkLogForm 업무일지 작성 화면");
		response.setCharacterEncoding("UTF-8");
		String template = formService.selectTemplate(9);
		model.addAttribute("template", template);
		logger.info("insertWorkLogForm template.toString() : {}", template.toString());

		Emp e = workLogService.selectEmpNo(emp_no);
		logger.info("insertWorkLogForm의 selectedEmpNo : {}", emp_no);
		logger.info("e : {}", e);
		model.addAttribute("emp", e);

		return "/worklog/worklogInsert";
	}

//	@RequestMapping(value = "/insertWL.do", method = RequestMethod.POST)
//	public String insertWorkLog(@RequestParam String worklog_content, @RequestParam int emp_no,
//			HttpServletResponse resp) throws IOException {
//		WorkLog worklog = new WorkLog(worklog_content, emp_no);

	@RequestMapping(value = "/insertWL.do", method = RequestMethod.POST)
	public String insertWorkLog(WorkLog worklog, HttpServletResponse resp) throws IOException {

		logger.info("WorkLogController insertWorkLogForm : {}", worklog);
		int cnt = workLogService.insertWorkLog(worklog);
		if (cnt == 1) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('성공적으로 업무일지가 등록되었습니다.'); location.href='worklogList.do';</script>");
			out.flush();
			logger.info("업무일지 새글 작성 성공");
			return null;
		} else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('새글 입력 실패'); location.href='worklogList.do';</script>");
			out.flush();
			logger.info("업무일지 새글 작성 실패!!");
//			return "./worklog/worklogList.do";
			return null;
		}

	}

	// updateWorkLogContent(WorkLog workLog)
//	@RequestMapping(value = "/worklogModifyForm.do", method = RequestMethod.GET)
//	public ModelAndView worklogModifyForm(@RequestParam int worklog_no, @RequestParam String worklog_content,
//			HttpServletResponse resp) {
	@RequestMapping(value = "/worklogModifyForm.do", method = RequestMethod.GET)
	public ModelAndView worklogModifyForm(@RequestParam int worklog_no, HttpServletResponse resp) {
		logger.info("WorkLogController 수정 worklogDetail -> worklogModify:{}", worklog_no);

		ModelAndView mav = new ModelAndView();

//		resp.setCharacterEncoding("UTF-8");
//		String template = formService.selectTemplate(9);
//		mav.addObject("template", template);
//		logger.info("worklogModifyForm template.toString() : {}", template.toString());

		WorkLog modifyWorklog = workLogService.selectDetailWorkLog(worklog_no);
		mav.setViewName("./worklog/worklogModify");
		mav.addObject("vo", modifyWorklog);

		return mav;
	}

	@PostMapping("/worklogModify.do")
	public String worklogModify(WorkLog worklog, HttpServletResponse resp) throws IOException {
		logger.info("WorkLogController 수정 worklogModify : {}", worklog);
		logger.info("modify 내용!!!!!!!!!!", worklog.getWorklog_content());
		int cnt = workLogService.updateWorkLogContent(worklog);
		if (cnt == 1) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('수정 성공!'); location.href='worklogList.do'; </script>");
			out.flush();
			return null;
		} else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('수정 실패!'); location.href='worklogList.do'; </script>");
			out.flush();
			return null;
		}
	}

	// updateWorkLogDelflag(Map<String, String[]> worklog_nos)

	// deleteWorkLog(Map<String, String[]> worklog_nos)
//	@GetMapping("/worklogDelete.do")
//	public String deleteBoard(String[] seq) {
//		logger.info("WorkLogController 삭제 worklogDelete");
//		Map<String, String[]> map = new HashMap<String, String[]>();
//		map.put("seqs", seq);
//		int cnt = workLogService.deleteWorkLog(map);
//		logger.info("cnt의 수 : " + cnt);
//		return "redirect:/worklogList.do";
//	}

}
