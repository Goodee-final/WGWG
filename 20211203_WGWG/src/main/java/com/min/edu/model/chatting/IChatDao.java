package com.min.edu.model.chatting;

import java.util.List;

import com.min.edu.vo.chatting.ChatMember;
import com.min.edu.vo.chatting.ChatMessage;
import com.min.edu.vo.chatting.ChatRoom;
import com.min.edu.vo.emp.Emp;

public interface IChatDao {

	// 채팅방 생성
	public int insertChatRoom(ChatRoom chatRoom);

	// 채팅방 이름 변경
	public int updateChatRoomNM(ChatRoom chatRoom);

	// 채팅방 참여자 변경
	public int updateChatRoomMem(ChatRoom chatRoom);

	// 채팅방 생성된 후, 사람이 채팅멤버로 들어감
	public int insertChatMem(ChatMember chatMember);

	// 채팅방을 삭제했을 경우, 참여상태만 바꿔줌
	public int updateChatMemSt(ChatMember chatMember);

	// 채팅 메시지 생성
	public int insertChatMsg(ChatMessage chatMessage);

	// 보낸사람 이름/사진/부서/직급
	public Emp selectChatEmp(int mem_no);

	// 보낸 사람 이름, 메시지 전송 시간, 내용 가져오기, 채팅방 참여자, 채팅방 이름
	public List<ChatMessage> selectChatRoomInfo(int chat_room_no);

	// 한 사람이 속해있는 모든 채팅방 목록
	public ChatRoom selectChatList(int emp_no);

	// 채팅방 이름, 가장 최근의 메시지 내용
	public ChatMessage selectChatListInfo(int chat_room_no);

}
