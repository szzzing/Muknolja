package com.spring.muknolja.party.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.PageInfo;
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
	
}
