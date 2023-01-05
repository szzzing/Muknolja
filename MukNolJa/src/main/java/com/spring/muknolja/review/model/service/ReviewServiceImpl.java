package com.spring.muknolja.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.common.model.vo.Report;
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
	public ArrayList<Board> selectBoard(PageInfo pi, int Sarea) {
		// TODO Auto-generated method stub
		return rDAO.getselectBoard(sqlSession,pi,Sarea);
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
	public ArrayList<Reply> selectReply(int boardId) {
		// TODO Auto-generated method stub
		return rDAO.selectReply(sqlSession,boardId);
	}
	@Override
	public ArrayList<Reply> selectRe(int refReplyId) {
		// TODO Auto-generated method stub
		return rDAO.selectRe(sqlSession,refReplyId);
	}
	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return rDAO.insertReply(sqlSession,reply);
	}
	@Override
	public int insertBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return rDAO.insertBoard(sqlSession,map);
	}
	@Override
	public int insertReport(Report report) {
		// TODO Auto-generated method stub
		return rDAO.insertReport(sqlSession,report);
	}
	@Override
	public int insertReRe(Reply reply) {
		// TODO Auto-generated method stub
		return rDAO.insertReRe(sqlSession,reply);
	}
	@Override
	public ArrayList<Reply> selectReply(ArrayList<Reply> reply1) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Reply selectReply1(Reply num) {
		// TODO Auto-generated method stub
		return rDAO.selectReply1(sqlSession,num);
	}



	
	


}
