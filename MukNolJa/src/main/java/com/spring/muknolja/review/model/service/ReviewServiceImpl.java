package com.spring.muknolja.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
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
	@Override
	public Board boardDetail(int boardId) {
		// TODO Auto-generated method stub
		return rDAO.boardDetail(sqlSession,boardId);
	}
	@Override
	public ArrayList<AttachedFile> boardImg(int boardId) {
		// TODO Auto-generated method stub
		return rDAO.boardImg(sqlSession, boardId);
	}
	@Override
	public int CountReply(int boardId) {
		// TODO Auto-generated method stub
		return rDAO.countReply(sqlSession, boardId);
	}
	@Override
	public ArrayList<Reply> selectReply(PageInfo pi, int boardId) {
		// TODO Auto-generated method stub
		return rDAO.selectReply(sqlSession,pi,boardId);
	}

}
