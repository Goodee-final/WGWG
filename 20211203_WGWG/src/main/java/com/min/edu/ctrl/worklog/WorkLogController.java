package com.min.edu.ctrl.worklog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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

import com.min.edu.model.form.IFormService;
import com.min.edu.model.worklog.IWorkLogService;
import com.min.edu.vo.worklog.WorkLog;

@Controller
public class WorkLogController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IWorkLogService workLogService;
	
	@Autowired
	private IFormService formService;
	
	@RequestMapping(value = "/worklogList.do", method = RequestMethod.GET)
	public String worklogList(Model model,@RequestParam int emp_no,@RequestParam int dept_no) {
		logger.info("WorkLogController worklogList 리스트 화면");
		logger.info("업무일지 조회 페이지로 이동");
		
		model.addAttribute("emp_no", emp_no);
		logger.info("전달받은 개인 번호 {}", emp_no);

		List<WorkLog> worklogmylist = workLogService.selectAllMyWorkLog(emp_no);
		model.addAttribute("worklogmylist", worklogmylist);

		model.addAttribute("dept_no", dept_no);
		logger.info("전달받은 부서 번호 {}", dept_no);

		List<WorkLog> worklogdeptlist = workLogService.selectAllDeptWorkLog(dept_no);
		model.addAttribute("worklogdeptlist", worklogdeptlist);

		return "./worklog/worklogList";
	}

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
	public String worklogDetail(Model model, int worklog_no) {
		logger.info("WorkLogController worklogDetail 상세 조회 화면");
		logger.info("전달받은 업무일지 번호 {}", worklog_no);
		WorkLog selectWorkLog = workLogService.selectDetailWorkLog(worklog_no);
		model.addAttribute("selectWorkLog", selectWorkLog);
		return "./worklog/worklogList";
	}

	@RequestMapping(value = "/searchWorkLog.do", method = RequestMethod.POST)
	public String searchWorkLog(Model model, String searchWord) {
		logger.info("WorkLogController searchWorkLog 검색");
		logger.info("전달받은 검색어 {}", searchWord);
		List<WorkLog> searchworkloglist = workLogService.searchWorkLog(searchWord);
		model.addAttribute("searchworkloglist", searchworkloglist);
		return "./worklog/worklogList";
	}

	@RequestMapping(value = "/worklogInsert.do", method = RequestMethod.GET)
	public String insertWorkLogForm(HttpServletResponse response, Model model) {
		logger.info("WorkLogController worklogInsert");
		response.setCharacterEncoding("UTF-8");
		String template = formService.selectTemplate(9);
		model.addAttribute("template",template);
		return "./worklog/worklogInsert";
	}

	@RequestMapping(value = "/insertWL.do", method = RequestMethod.POST)
	public String insertWorkLog(WorkLog workLog, HttpServletResponse resp) throws IOException {
		logger.info("WorkLogController insertWorkLogForm : {}", workLog);
		int cnt = workLogService.insertWorkLog(workLog);
		if (cnt == 1) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('성공적으로 새글이 입력되었습니다'); location.href='./worklogList.do';</script>");
			out.flush();
			logger.info("업무일지 새글 작성 성공");
			return "./worklog/worklogList.do";
		} else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('새글 입력 실패'); location.href='worklogList.jsp';</script>");
			out.flush();
			logger.info("업무일지 새글 작성 실패!!");
			return "./worklog/worklogList.do";
		}

	}

	// updateWorkLogContent(WorkLog workLog)

	// updateWorkLogDelflag(Map<String, String[]> worklog_nos)

	// deleteWorkLog(Map<String, String[]> worklog_nos)

}
