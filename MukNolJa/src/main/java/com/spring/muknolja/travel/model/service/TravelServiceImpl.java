package com.spring.muknolja.travel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.travel.model.dao.TravelDAO;

@Service("tService")
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private TravelDAO tDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReply(Reply r) {
		return tDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReply(int refBoardId) {
		return tDAO.selectReply(sqlSession, refBoardId);
	}

}
