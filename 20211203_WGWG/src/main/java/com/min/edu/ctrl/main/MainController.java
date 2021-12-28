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

import com.min.edu.model.emp.IEmpService;
import com.min.edu.model.main.IMainService;
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
   private IWorkLogService workLogService;

   
   @RequestMapping(value="/home.do", method=RequestMethod.GET)
   public String home(Model model, HttpSession session) {
      //테스트할 때 index페이지부터 보여주기 위한 주소
      List<NoticeVO> noticeList = mainService.selectmainnotice();
      model.addAttribute("noticeList", noticeList);
      logger.info("로그인한 사원번호{}",session.getAttribute("loginEmp"));
       int emp_no = (Integer)session.getAttribute("loginEmp");
       Emp emp = workLogService.selectEmpNo(emp_no);
       model.addAttribute("emp",emp);
//       session.setAttribute("loc", "./main.do");
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
       
       session.setAttribute("loc", "./main.do");
   
      return "common/main";
   }
   
}