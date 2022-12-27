package com.spring.muknolja.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
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

}
