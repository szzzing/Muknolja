package com.spring.muknolja.party.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.common.model.vo.Report;
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
		ArrayList<Party> partyList = (ArrayList)sqlSession.selectList("partyMapper.selectPartyList", null, rowBounds);
		for(Party p : partyList) {
			p.setNowParticipate(sqlSession.selectOne("partyMapper.countParty", p.getPartyId()));
			p.setReplyCount(sqlSession.selectOne("replyMapper.countReply", p.getPartyId()));
		}
		
		return partyList;
	}

	public Party selectParty(SqlSessionTemplate sqlSession, int pId) {
		Party p =  sqlSession.selectOne("partyMapper.selectParty", pId);
		p.setProfileImg(sqlSession.selectOne("partyMapper.selectProfileImg", pId));
		return p;
	}

	public int updateParty(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
			int board = sqlSession.update("partyMapper.updateBoard", map);
			int party = sqlSession.update("partyMapper.updateParty", map);
			if(map.get("af") != null) {
				int attm = sqlSession.update("partyMapper.updateAttm", map);
				return board + party + attm;
			}else {
				return board + party;
			}
	}

	public int deleteParty(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		int board = sqlSession.update("partyMapper.deleteBoard", map);
		int attm = sqlSession.update("partyMapper.deleteAttm", map);
		int participate = sqlSession.delete("partyMapper.deletePartyParticipate", map);
		return board + attm + participate;
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

	public int deleteReply(SqlSessionTemplate sqlSession, int replyId) {
		int result1 = sqlSession.update("replyMapper.deleteReply", replyId);
		int result2 = sqlSession.update("replyMapper.deleteReReply", replyId);
		return result1 + result2;
	}

	public int paticipate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("partyMapper.participate", map);
	}

	public int countParty(SqlSessionTemplate sqlSession, int pId) {
		return sqlSession.selectOne("partyMapper.countParty", pId);
	}

	public int checkParty(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("partyMapper.checkParty", map);
	}

	public void deleteParticipate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.delete("partyMapper.deleteParticipate", map);
	}

	public int checkReport(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("partyMapper.checkReport", map);
	}

	public int insertReport(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("partyMapper.insertReport", rp);
	}

	public ArrayList<Party> searchParty(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Party> partyList = (ArrayList)sqlSession.selectList("partyMapper.searchParty", map, rowBounds);
		for(Party p : partyList) {
			p.setNowParticipate(sqlSession.selectOne("partyMapper.countParty", p.getPartyId()));
			p.setReplyCount(sqlSession.selectOne("replyMapper.countReply", p.getPartyId()));
		}
		return partyList;
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("partyMapper.getSearchListCount", map);
	}

	public int checkLike(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("partyMapper.checkLike", map);
	}

	public int insertLike(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("partyMapper.insertLike", map);
	}

	public int deleteLike(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("partyMapper.deleteLike", map);
	}

}
