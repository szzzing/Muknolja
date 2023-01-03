package com.spring.muknolja.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.party.model.dao.PartyDAO;
import com.spring.muknolja.party.model.vo.Party;

@Service("pService")
public class PartyServiceImpl implements PartyService{
	
	@Autowired
	private PartyDAO pDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertBoard(HashMap<String, Object> map) {
		return pDAO.insertBoard(sqlSession, map);
	}

	@Override
	public int getListCount() {
		return pDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Party> selectPartyList(PageInfo pi) {
		return pDAO.selectPartyList(sqlSession, pi);
	}

	@Override
	public Party selectParty(int pId) {
		return pDAO.selectParty(sqlSession, pId);
	}

	@Override
	public int updateParty(HashMap<String, Object> map) {
		return pDAO.updateParty(sqlSession, map);
	}

	@Override
	public int deleteParty(HashMap<String, Integer> map) {
		return pDAO.deleteParty(sqlSession, map);
	}

	@Override
	public int insertReply(Reply r) {
		return pDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReply(int refBoardId) {
		return pDAO.selectReply(sqlSession, refBoardId);
	}

	@Override
	public ArrayList<Reply> selectReReply(int refReplyId) {
		return pDAO.selectReReply(sqlSession, refReplyId);
	}

	@Override
	public int insertReReply(Reply r) {
		return pDAO.insertReReply(sqlSession, r);
	}

	@Override
	public int countReply(int pId) {
		return pDAO.countReply(sqlSession, pId);
	}

	@Override
	public int deleteReply(int replyId) {
		return pDAO.deleteReply(sqlSession, replyId);
	}

	@Override
	public int participate(HashMap<String, Object> map) {
		return pDAO.paticipate(sqlSession, map);
	}

	@Override
	public int countParty(int pId) {
		return pDAO.countParty(sqlSession, pId);
	}

	@Override
	public int checkParty(HashMap<String, Object> map) {
		return pDAO.checkParty(sqlSession, map);
	}

	@Override
	public void deleteParticipate(HashMap<String, Object> map) {
		pDAO.deleteParticipate(sqlSession, map);
	}

}
