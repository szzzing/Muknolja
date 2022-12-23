package com.spring.muknolja.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.chat.model.vo.ChatInvite;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

@Repository("cDAO")
public class ChatDAO {

	public int createRoom(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("chatmapper.createRoom", map);
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

	public ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, String roomCode) {
		return sqlSession.selectOne("chatmapper.selectChatRoom", roomCode);
	}

	public int inviteChat(SqlSessionTemplate sqlSession, ChatInvite i) {
		return sqlSession.insert("chatmapper.inviteChat", i);
	}

	public ArrayList<ChatInvite> selectInvite(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("chatmapper.selectInvite", id);
	}

	public int participate(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("chatmapper.participate", map);
	}

	public void consentInvite(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.update("chatmapper.consentInvite", map);
	}

	public int refusalInvite(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.delete("chatmapper.refusalInvite", map);
	}

	public int chatRoomOut(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.delete("chatmapper.chatRoomOut", map);
	}

}
