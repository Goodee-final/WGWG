package com.min.edu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SocketController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/socketOpen.do", method=RequestMethod.GET)
	public String socketOpen() {
		logger.info("세상의 모든 웹소켓에 참여하는 모든 사람과 채팅을 해보쟈");
		return "socket";
	}

}
