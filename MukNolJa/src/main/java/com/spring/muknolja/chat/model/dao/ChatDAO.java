package com.spring.muknolja.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

@Repository("cDAO")
public class ChatDAO {

	public int createRoom(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return sqlSession.insert("chatmapper.createRoom", chatRoom);
	}

	public ArrayList<ChatRoom> selectChatRoomList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("chatmapper.selectChatRoomList", id);
	}

	public ArrayList<ChatMessage> selectChatMessage(SqlSessionTemplate sqlSession, String roomCode) {
		return (ArrayList)sqlSession.selectList("chatmapper.selectChatMessage", roomCode);
	}

	public void insertMessage(SqlSessionTemplate sqlSession, ChatMessage message) {
		sqlSession.insert("chatmapper.insertMessage", message);
	}

	public Member selectUser(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("chatmapper.selectUser", nick);
	}

}
