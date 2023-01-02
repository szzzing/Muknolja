package com.spring.muknolja.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.review.model.dao.ReviewDAO;



@Service("rService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int getselectBoard() {
		
		return rDAO.getselectBoard(sqlSession);
	}
	@Override
	public ArrayList<Board> selectBoard(PageInfo pi) {
		// TODO Auto-generated method stub
		return rDAO.getselectBoard(sqlSession,pi);
	}

}
