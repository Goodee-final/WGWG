package com.min.edu.ctrl.chatting;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component(value = "webSocketChat.do")
public class SocketHandler2 extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	// 채팅에 참여하는 웹소켓 세션을 담아놓음
	// 채팅의 내용을 보내느 대상자
	private ArrayList<WebSocketSession> list;

	// 생성된 websocketSession에 1:1 매핑되는 nickName을 가지고 있는 객체
	private Map<WebSocketSession, String> map = new HashMap<WebSocketSession, String>();

	public SocketHandler2() {
			list = new ArrayList<WebSocketSession>();
		}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("웹소켓 커넥션 생성 afterConnectionEstablished");
		super.afterConnectionEstablished(session);

		// 채팅에 참여되면 생성된 websocketSession에 객체를 담아줌
		list.add(session);

		// 웹소켓에 현재 참여하고 있는 SessionID : ppt에 그린 것 중 hashcode에 해당한다고 보면 됨
		logger.info("웹소켓에 현재 참여하고 있는 SessionID : " + session.getId() + " // 참여 인원 : " + list.size());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("웹소켓의 모든 참여자들에게 메시지 전달 handleTextMessage");

		// String msg = message. 까지만 하고 뒤에 자동완성 되는 것들 뭔지 알아보기
		// toString은 객체를 줌
		// getpayloadLength() 메시지 길이를 제한해주는 거(일정 글자수 넘어가면 ...으로 표시해주는 거)

		// 객체에서 전달받은 text를 가지고 있는 객체
		String msg = message.getPayload();
		// 사용할 수 있는 String 객체가 됨
		String msgToString = msg.toString();

		logger.info("전달된 getPayload : {}", msg);
		logger.info("전달된 toString : {}", msgToString);

		// 채팅은 null값이 오는 경우가 절대 없지만, 혹시나 해서 널값 체크하는 거 넣어둠
		if (msg != null && !msg.equals("")) { // 대화 내용이 전달됨
			// 1) 첫번째 채팅에 참여하여 map에 session:nickName 을 담아줘야 함
			// 참여중인 다른 사람에게 입장 메시지(~님이 들어왔습니다.)를 보내줌
			// 머리말에 #$nick_ 이 포함되어 있다면 map에 (websocketSession, 전달받은 nickName)을 넣어줌
			// ex) #$nick_스폰지밥 이라면 => 스폰지밥 만 추출해서 => map.put(session, "스폰지밥")
			if (msg.indexOf("#$nick_") != -1) {
				// indexOf는 확인용임!! 이걸로 글 짜를 생각하지 마!!!
				// 쪼개는 건 무조건 split!!
				map.put(session, msg.replace("#$nick_", ""));
				logger.info("방금 참여한 자신의 nickName의 Map 값 : {}", map.get(session));

				// 입장 메시지를 보내줌
				for (WebSocketSession s : list) {
					// 현재 자신은 빼고 보내고 싶다 or 그룹 채팅을 하고 싶다 인 경우
					// if(s != session) {}

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH24:mm:ss");
					String out = sdf.format(new Date());
					s.sendMessage(new TextMessage("<font color='forestgreen' size='5px'>" + map.get(session)
							+ " 님이 입장하셨습니다.+(" + out + ")" + "</font>"));

				}
			} else {
				// 2) 두번째부터는 대화의 내용이 전달될 수 있도록 함
				// 여기서!!!! 채팅창의 메시지 좌우 조절할 수 있음!!!!!
				for (WebSocketSession s : list) {
					String sendMsg = "<font color='gray'>" + msg + ">";
					s.sendMessage(new TextMessage(sendMsg));

				}

			}
		}

	}
	// map에 담아주면 채팅방 여러개 만들 수 있음..?
	// json으로 해서 키 밸류 값으로 하면 정말 좋지만 우리는 못해,,,,,,,,,그래서 우리는 index 사용할 거
	// javascript로 할 때는 json 으로 만들 수 있대!!!

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("웹소켓 삭제 afterConnectionClosed");
		super.afterConnectionClosed(session, status);

		// 채팅이 닫히거나 websocket이 close 됐다면,
		// close를 요청한 websocketSession 을 삭제하여 거기에는 데이터가 전송되지 않도록 해야 함
		// websocket의 전체 참여 인원은 list에 담겨있음
		list.remove(session);

		// 화면에 퇴장 메세지를 띄워줌
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH24:mm:ss");
		String out = sdf.format(new Date());

		for (WebSocketSession s : list) {
			// list에는 현재 참여중인 모든 참여자의 websocketSession이 담겨있음
			// s.sendMessage(new TextMessage(null)); 여기 null 대신 script 쓰면 그게 바로 실시간 알람!
			s.sendMessage(new TextMessage(
					"<font color='tomato' size='5px'>" + map.get(session) + " 님이 퇴장하셨습니다.+(" + out + ")" + "</font>"));
			// 세션 이름을 가져와 이름 을 가져와서 ~님이 퇴장하셨습니다. 에 넣어줌
			// map 에는 참여하는 사람들의 이름이 매핑되어있음
		}
		map.remove(session);
	}

}
