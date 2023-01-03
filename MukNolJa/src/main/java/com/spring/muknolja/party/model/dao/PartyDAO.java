package com.spring.muknolja.party.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.party.model.vo.Party;

@Repository("pDAO")
public class PartyDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("partyMapper.insertParty", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("partyMapper.getListCount");
	}

	public ArrayList<Party> selectPartyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("partyMapper.selectPartyList", rowBounds);
	}

	public Party selectParty(SqlSessionTemplate sqlSession, int pId) {
		return sqlSession.selectOne("partyMapper.selectParty", pId);
	}

	public int updateParty(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		int board = sqlSession.update("partyMapper.updateBoard", map);
		int party = sqlSession.update("partyMapper.updateParty", map);
		int attm = sqlSession.update("partyMapper.updateAttm", map);
		return board + party + attm;
	}

	public int deleteParty(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		int board = sqlSession.update("partyMapper.deleteBoard", map);
		int attm = sqlSession.update("partyMapper.deleteAttm", map);
		return board + attm;
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int refBoardId) {
		return (ArrayList)sqlSession.selectList("replyMapper.selectReply", refBoardId);
	}

	public ArrayList<Reply> selectReReply(SqlSessionTemplate sqlSession, int refReplyId) {
		return (ArrayList)sqlSession.selectList("replyMapper.selectReReply", refReplyId);
	}

	public int insertReReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertReReply", r);
	}

	public int countReply(SqlSessionTemplate sqlSession, Integer pId) {
		return sqlSession.selectOne("replyMapper.countReply", pId);
	}

}
