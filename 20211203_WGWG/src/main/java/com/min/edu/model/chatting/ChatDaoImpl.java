package com.min.edu.model.chatting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.edu.vo.chatting.ChatMember;
import com.min.edu.vo.chatting.ChatMessage;
import com.min.edu.vo.chatting.ChatRoom;
import com.min.edu.vo.emp.Emp;

@Repository
public class ChatDaoImpl implements IChatDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.chatting.ChatDaoImpl.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChatRoom(ChatRoom chatRoom) {
		logger.info("ChatDaoImpl insertChatRoom 채팅방 인서트");
		return sqlSession.insert(NS + "insertChatRoom", chatRoom);
	}

	@Override
	public int updateChatRoomNM(ChatRoom chatRoom) {
		logger.info("ChatDaoImpl updateChatRoomNM 채팅방 이름 수정");
		return sqlSession.update(NS + "updateChatRoomNM", chatRoom);
	}

	@Override
	public int updateChatRoomMem(ChatRoom chatRoom) {
		logger.info("ChatDaoImpl updateChatRoomMem 채팅방 이름 수정");
		return sqlSession.update(NS + "updateChatRoomMem", chatRoom);
	}

	@Override
	public int insertChatMem(ChatMember chatMember) {
		logger.info("ChatDaoImpl insertChatMem 채팅멤버 인서트");
		return sqlSession.insert(NS + "insertChatMem", chatMember);
	}

	@Override
	public int updateChatMemSt(ChatMember chatMember) {
		logger.info("ChatDaoImpl updateChatMemSt 채팅멤버 참여 상태 수정");
		return sqlSession.update(NS + "updateChatMemSt", chatMember);
	}

	@Override
	public int insertChatMsg(ChatMessage chatMessage) {
		logger.info("ChatDaoImpl insertChatMsg 채팅 메시지 인서트");
		return sqlSession.insert(NS + "insertChatMsg", chatMessage);
	}

	@Override
	public Emp selectChatEmp(int mem_no) {
		logger.info("ChatDaoImpl selectChatEmp mem_no 고르기 {}", mem_no);
		return sqlSession.selectOne(NS + "selectChatEmp", mem_no);
	}

	@Override
	public List<ChatMessage> selectChatRoomInfo(int chat_room_no) {
		logger.info("ChatDaoImpl selectChatRoomInfo  {}", chat_room_no);
		return sqlSession.selectList(NS + "selectChatRoomInfo", chat_room_no);
	}

	@Override
	public ChatRoom selectChatList(int emp_no) {
		logger.info("ChatDaoImpl selectChatList  {}", emp_no);
		return sqlSession.selectOne(NS+"selectChatList", emp_no);
	}

	@Override
	public ChatMessage selectChatListInfo(int chat_room_no) {
		logger.info("ChatDaoImpl selectChatListInfo  {}", chat_room_no);
		return sqlSession.selectOne(NS+"selectChatListInfo", chat_room_no);
	}

}
