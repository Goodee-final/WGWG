package com.min.edu.vo.chatting;

public class ChatMessage {

	private int chat_message_no;
	private String chat_message_content;
	private String chat_message_reg_dt;
	private int mem_no;
	private int chat_room_no;

	private ChatMember cMemEmpVo;
	private ChatRoom cRoomVo;

	@Override
	public String toString() {
		return "ChatMessage [chat_message_no=" + chat_message_no + ", chat_message_content=" + chat_message_content
				+ ", chat_message_reg_dt=" + chat_message_reg_dt + ", mem_no=" + mem_no + ", chat_room_no="
				+ chat_room_no + ", cMemEmpVo=" + cMemEmpVo + ", cRoomVo=" + cRoomVo + "]";
	}

	public ChatMessage() {
		super();
	}

	public ChatMessage(int chat_message_no, String chat_message_content, String chat_message_reg_dt, int mem_no,
			int chat_room_no, ChatMember cMemEmpVo, ChatRoom cRoomVo) {
		super();
		this.chat_message_no = chat_message_no;
		this.chat_message_content = chat_message_content;
		this.chat_message_reg_dt = chat_message_reg_dt;
		this.mem_no = mem_no;
		this.chat_room_no = chat_room_no;
		this.cMemEmpVo = cMemEmpVo;
		this.cRoomVo = cRoomVo;
	}

	public int getChat_message_no() {
		return chat_message_no;
	}

	public void setChat_message_no(int chat_message_no) {
		this.chat_message_no = chat_message_no;
	}

	public String getChat_message_content() {
		return chat_message_content;
	}

	public void setChat_message_content(String chat_message_content) {
		this.chat_message_content = chat_message_content;
	}

	public String getChat_message_reg_dt() {
		return chat_message_reg_dt;
	}

	public void setChat_message_reg_dt(String chat_message_reg_dt) {
		this.chat_message_reg_dt = chat_message_reg_dt;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getChat_room_no() {
		return chat_room_no;
	}

	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}

	public ChatMember getcMemEmpVo() {
		return cMemEmpVo;
	}

	public void setcMemEmpVo(ChatMember cMemEmpVo) {
		this.cMemEmpVo = cMemEmpVo;
	}

	public ChatRoom getcRoomVo() {
		return cRoomVo;
	}

	public void setcRoomVo(ChatRoom cRoomVo) {
		this.cRoomVo = cRoomVo;
	}

}
