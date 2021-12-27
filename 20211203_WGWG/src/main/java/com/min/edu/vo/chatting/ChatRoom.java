package com.min.edu.vo.chatting;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoom {

	private int chat_room_no;
	private String chat_room_nm;
	private String chat_room_reg_dt;
	private String chat_members;

	private Set<WebSocketSession> sessions = new HashSet<>();

//	public void handleActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) {
//		if (chatMessage.getType().equals(ChatMessage.MessageType.ENTER)) {
//			sessions.add(session);
//			chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");
//		}
//		sendMessage(chatMessage, chatService);
//	}
//
//	public <T> void sendMessage(T message, ChatService chatService) {
//		sessions.parallelStream().forEach(session -> chatService.sendMessage(session, message));
//	}

	@Override
	public String toString() {
		return "ChatRoom [chat_room_no=" + chat_room_no + ", chat_room_nm=" + chat_room_nm + ", chat_room_reg_dt="
				+ chat_room_reg_dt + ", chat_members=" + chat_members + ", sessions=" + sessions + "]";
	}

	public ChatRoom() {
		super();
	}

	public ChatRoom(int chat_room_no, String chat_room_nm, String chat_room_reg_dt, String chat_members) {
		super();
		this.chat_room_no = chat_room_no;
		this.chat_room_nm = chat_room_nm;
		this.chat_room_reg_dt = chat_room_reg_dt;
		this.chat_members = chat_members;
	}

	public ChatRoom(int chat_room_no, String chat_room_nm, String chat_room_reg_dt, String chat_members,
			Set<WebSocketSession> sessions) {
		super();
		this.chat_room_no = chat_room_no;
		this.chat_room_nm = chat_room_nm;
		this.chat_room_reg_dt = chat_room_reg_dt;
		this.chat_members = chat_members;
		this.sessions = sessions;
	}

	public int getChat_room_no() {
		return chat_room_no;
	}

	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}

	public String getChat_room_nm() {
		return chat_room_nm;
	}

	public void setChat_room_nm(String chat_room_nm) {
		this.chat_room_nm = chat_room_nm;
	}

	public String getChat_room_reg_dt() {
		return chat_room_reg_dt;
	}

	public void setChat_room_reg_dt(String chat_room_reg_dt) {
		this.chat_room_reg_dt = chat_room_reg_dt;
	}

	public String getChat_members() {
		return chat_members;
	}

	public void setChat_members(String chat_members) {
		this.chat_members = chat_members;
	}

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}

}
