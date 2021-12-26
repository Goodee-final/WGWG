package com.min.edu.vo.chatting;

public class Chat {
//	CREATE TABLE CHAT (
//			chat_room varchar2(4000),
//			chat_member clob,
//			chat_message clob
//		);

	private ChatRoom chatRoom;
	private ChatMember chatMember;
	private ChatMessage chatMessage;

	@Override
	public String toString() {
		return "Chat [chatRoom=" + chatRoom + ", chatMember=" + chatMember + ", chatMessage=" + chatMessage + "]";
	}

	public Chat() {
		super();
	}

	public Chat(ChatRoom chatRoom, ChatMember chatMember, ChatMessage chatMessage) {
		super();
		this.chatRoom = chatRoom;
		this.chatMember = chatMember;
		this.chatMessage = chatMessage;
	}

	public ChatRoom getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(ChatRoom chatRoom) {
		this.chatRoom = chatRoom;
	}

	public ChatMember getChatMember() {
		return chatMember;
	}

	public void setChatMember(ChatMember chatMember) {
		this.chatMember = chatMember;
	}

	public ChatMessage getChatMessage() {
		return chatMessage;
	}

	public void setChatMessage(ChatMessage chatMessage) {
		this.chatMessage = chatMessage;
	}

}
