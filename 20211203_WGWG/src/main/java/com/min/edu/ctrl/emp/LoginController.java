package com.min.edu.ctrl.emp;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public String login(@Valid Emp emp,BindingResult bindingResult,Model model) {
		logger.info("LoginController @SessionAttribute 사용 {}",emp);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("message","사원번호 또는 비밀번호가 올바르지 않습니다.");
			return "redirect:/loginForm.do";
		}else {
			Emp loginEmp = service.getLogin(emp);
			if(loginEmp == null) {
				return "redirect:/loginForm.do";
			}else {
				logger.info("로그인 값{}",loginEmp);
				model.addAttribute("loginEmp",loginEmp);
				return "redirect:/";
			}
		}
		
		
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
