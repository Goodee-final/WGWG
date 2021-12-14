package com.min.edu.ctrl.emp;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.edu.model.emp.IEmpService;
import com.min.edu.vo.emp.Emp;

@Controller
public class LoginController {

private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEmpService service;
	
	@Autowired
	private LoginValidator loginvalidator;
	
	@GetMapping(value="/loginForm.do")
	public String loginForm() {
		logger.info("MemberController 로그인 화면");
		return "emp/loginForm";
	}
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public String login(Emp emp,Model model) throws IOException {
		logger.info("LoginController @SessionAttribute 사용 {}",emp);
		
//		if(bindingResult.hasErrors()) {
//			model.addAttribute("message","정보가 일치하지 않습니다.");
//			return "emp/loginForm";
//		}
			Emp loginEmp = service.getLogin(emp);
			logger.info("로그인 값{}",loginEmp);
			if(loginEmp == null) {
				model.addAttribute("message","정보가 일치하지 않습니다.");
				return "emp/loginForm";
			}
			model.addAttribute("loginEmp",loginEmp);
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
