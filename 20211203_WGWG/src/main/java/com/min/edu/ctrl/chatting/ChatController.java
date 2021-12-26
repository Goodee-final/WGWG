//package com.min.edu.ctrl.chatting;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionContext;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.min.edu.model.chatting.IChatService;
//import com.min.edu.vo.emp.Emp;
//
//@Controller
//public class ChatController {
//
//	private Logger logger = LoggerFactory.getLogger(this.getClass());
//
//	@Autowired
//	private HttpSession session;
//
//	@Autowired
//	private IChatService chatService;
//
//	// 현재 접속 중인 모든 사람 정보 가져오기
//	public List<Emp> getAllLogin(HttpSessionContext httpSessionContext){
//		
//		
//		return null;
//		
//	}
//	
//	// 소켓 열어주기
//	@RequestMapping(value = "/socketOpen.do", method=RequestMethod.GET)
//	public String socketOpen() {
//		logger.info("ChatController socketOpen 시작@@@@");
//		return "members";
//	}
//	
//	
//	
//	// 채팅창 생성과 동시에 자기 자신과 선택된 사람들이 바로 채팅멤버로 들어가야해
//	// 그 후 메시지 전송
////	public String memberList() {
////		
////	}
//	
//
//}
