package com.min.edu.model.chatting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.chatting.ChatMember;
import com.min.edu.vo.chatting.ChatMessage;
import com.min.edu.vo.chatting.ChatRoom;
import com.min.edu.vo.emp.Emp;

@Service
public class ChatServiceImpl implements IChatService {

	@Autowired
	private IChatDao cdao;

	@Override
	public int insertChatRoom(ChatRoom chatRoom) {
		return cdao.insertChatRoom(chatRoom);
	}

	@Override
	public int updateChatRoomNM(ChatRoom chatRoom) {
		return cdao.updateChatRoomNM(chatRoom);
	}

	@Override
	public int updateChatRoomMem(ChatRoom chatRoom) {
		return cdao.updateChatRoomMem(chatRoom);
	}

	@Override
	public int insertChatMem(ChatMember chatMember) {
		return cdao.insertChatMem(chatMember);
	}

	@Override
	public int updateChatMemSt(ChatMember chatMember) {
		return cdao.updateChatMemSt(chatMember);
	}

	@Override
	public int insertChatMsg(ChatMessage chatMessage) {
		return cdao.insertChatMsg(chatMessage);
	}

	@Override
	public Emp selectChatEmp(int mem_no) {
		return cdao.selectChatEmp(mem_no);
	}

	@Override
	public List<ChatMessage> selectChatRoomInfo(int chat_room_no) {
		return cdao.selectChatRoomInfo(chat_room_no);
	}

	@Override
	public ChatRoom selectChatList(int emp_no) {
		return cdao.selectChatList(emp_no);
	}

	@Override
	public ChatMessage selectChatListInfo(int chat_room_no) {
		return cdao.selectChatListInfo(chat_room_no);
	}

}
