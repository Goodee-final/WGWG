package com.min.edu.ctrl.emp;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

import com.min.edu.model.emp.IEmpService;
import com.min.edu.vo.emp.Emp;

@Controller
public class LoginController {

private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEmpService service;
	
	@Autowired
	public Emp emp;
	
//	@Autowired
//	private LoginValidator loginvalidator;
	
	@GetMapping(value="/loginForm.do")
	public String loginForm() {
		logger.info("MemberController 로그인 화면");
		return "emp/loginForm";
	}
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public String login(Emp emp,Model model,HttpSession session) throws IOException {
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
			session.setAttribute("loginEmp", loginEmp.getEmp_no());
			
			return "redirect:/";
			
	}
	
	@GetMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginForm.do";
	}
	
	@GetMapping(value="/findPwForm.do")
	public String findPwForm() {
		return "emp/findPwForm";
	}
	
	public String sendMail(String email) {
		String user = "odwtest123@gmail.com"; 
		// gmail 계정 
		
		String password = "비밀번호"; 
		// gmail 패스워드 
		
		String RandomPw = service.getRandomPw();
		//전송할 임시 비밀번호 생성
		
		// SMTP 서버 정보를 설정한다. 
		Properties prop = new Properties(); 
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password); 
				} 
			}); 
		try { 
			MimeMessage message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(user)); 
			
			//수신자메일주소 
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 
			// Subject 
			message.setSubject("구디 그룹웨어에서 전송한 메일입니다."); //메일 제목을 입력
			// Text 
			String content = "<h3>아래 임시 비밀번호로 로그인 해 주시기 바랍니다.</h3><br>"
					+ "<div style='height: 50px; width: 150px; border: 1px solid #eee;'>"
					+ "<p style='margin-left: 15px;'>"+RandomPw+"</p>"
							+ "</div><br>"
							+ "<a href='http://localhost:8096/20211203_WGWG/loginForm.do'>로그인페이지로 이동</a>";
			message.setText(content,"UTF-8","html"); //메일 내용을 입력 
			// send the message 
			Transport.send(message); //전송 
			System.out.println("전송완료!"); 
			
			} catch (AddressException e) {
				e.printStackTrace(); 
			} catch (MessagingException e) { 
				e.printStackTrace(); 
			}
		return RandomPw;
	}
	
	@PostMapping(value="/findPw.do")
	public String findPw(HttpServletRequest req, Model model) {
		String email = req.getParameter("email");
		int emp_no = Integer.parseInt(req.getParameter("emp_no"));
		logger.info("입력받은 email값 : {}",email);
		logger.info("입력받은 사원번호값  : {}",emp_no);
		String getEmail = service.getEmailByEmpno(emp_no);
		System.out.println(getEmail+"&&&&"+email);
		if(getEmail.equals(email)) {
			String pw = sendMail(email);
			model.addAttribute("message","전송이 완료되었습니다.");
			
			//비밀번호 update해서 임시 비밀번호를 db에 저장
			
			emp.setEmp_no(emp_no);
			emp.setPw(pw);
			service.updatePW(emp);
			
			
			return "emp/findPwForm";
		}else if(!getEmail.equals(email)){
			model.addAttribute("message","이메일을 다시 확인해주세요.");
			return "emp/findPwForm";
		}
		return "emp/findPwForm";
		
	}
}
