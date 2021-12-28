package com.min.edu.ctrl.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletConfigAware;

import com.min.edu.model.chatting.IChatService;
import com.min.edu.model.worklog.IWorkLogService;
import com.min.edu.vo.emp.Emp;

@Controller
public class ChatController {
	private ServletContext servletContext;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

//	@Autowired
//	private HttpSession session;
//
//	@Autowired
//	private IChatService chatService;

	@Autowired
	private IWorkLogService workLogService;

//	public List<Emp> allSessionList = new ArrayList<Emp>();

//	@Override
//	public void setServletConfig(ServletConfig servletConfig) {
//		servletContext = servletConfig.getServletContext();
//	}

	// 소켓 열어주기
	@RequestMapping(value = "/chatOpen.do", method = RequestMethod.GET)
//	public String chatOpen(HttpSession session, String mem_id, String gr_id, Model model) {
	public String chatOpen(HttpSession session) {
		logger.info("ChatController chatOpen 시작@@@@");
//		session.setAttribute("mem_id", mem_id);
//		session.setAttribute("gr_id", gr_id);

//		logger.info("session.setAttribute(\"mem_id\", mem_id) : {}", mem_id);
//		logger.info("session.setAttribute(\"gr_id\", gr_id) : {}", gr_id);

//		HashMap<String, String> chatList = (HashMap<String, String>)servletContext.getAttribute("chatList");
//		if (chatList == null) {
//			chatList = new HashMap<String, String>();
//			chatList.put(mem_id, gr_id);
//			servletContext.setAttribute("chatList", chatList);
//		} else {
//			chatList.put(mem_id, gr_id);
//			servletContext.setAttribute("chatList", chatList);
//		}
//		logger.info("chatOpen 소켓 화면 이동");
		
		return "chat";
	}

	
//	// WebSocket 채팅 종료했을 때
//		@RequestMapping(value = "/chatOut.do", method = { RequestMethod.GET, RequestMethod.POST })
//		public void chatOut(HttpSession session) {
//			logger.info("chatOut 소켓에서 나오기");
//			String mem_id = (String) session.getAttribute("mem_id");
//			HashMap<String, String> chatList = (HashMap<String, String>) servletContext.getAttribute("chatList");
//			System.out.println("기존 접속 회원 리스트:" + chatList);
//			if (chatList != null) {
//				chatList.remove(mem_id);
//			}
//			System.out.println("갱신 후 접속 회원 리스트:" + chatList);
//			servletContext.setAttribute("chatList", chatList);
//
//		}

	
	
	
	
	
	
	
	// 채팅창 생성과 동시에 자기 자신과 선택된 사람들이 바로 채팅멤버로 들어가야해
	// 그 후 메시지 전송
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
//	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String memberList(HttpSession session, Model model) {
		logger.info("ChatController memberList 리스트 화면");
//		allSessionList = (List<Emp>) session.getAttribute("loginList");
		int emp_no = (Integer) session.getAttribute("loginEmp");
		Emp emp = workLogService.selectEmpNo(emp_no);
		model.addAttribute("emp", emp);
		System.out.println("하이하이~" + session.getAttribute("loginList"));
//		model.addAttribute("allSessionList", allSessionList);

		return "/chatting/memberList";

	}

}
