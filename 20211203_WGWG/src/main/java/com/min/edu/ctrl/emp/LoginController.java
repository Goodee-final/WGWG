package com.min.edu.ctrl.emp;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.model.emp.IEmpService;
import com.min.edu.vo.emp.Emp;

@Controller
public class LoginController {

private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEmpService service;
	
	@GetMapping(value="/loginForm.do")
	public String loginForm() {
		logger.info("MemberController 로그인 화면");
		return "emp/loginForm";
	}
	
	@PostMapping(value="/login.do")
	public String login(@RequestParam Map<String, Object> map, HttpSession session) {
		logger.info("MemberController 사원번호 : "+ map.get("emp_no"));
		logger.info("MemberController 비밀번호 : "+ map.get("pw"));
		Emp vo = service.getLogin(map);
		session.setAttribute("loginvo", vo);
		return "redirect:/";
	}
	
	@GetMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginForm.do";
	}
	
	@GetMapping(value="/find_pw_form.do")
	public String find_pw_form() {
		return "emp/find_pw_form";
	}
}
