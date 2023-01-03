package com.spring.muknolja.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;


@Repository("rDAO")
public class ReviewDAO {

	public int getselectBoard(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.getSelectBoard");
	}

	public ArrayList<Board> getselectBoard(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectBoard", null, rowBounds);
	
	}

	public Board boardDetail(SqlSessionTemplate sqlSession, int boardId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.boardDetail", boardId);
	}

	public ArrayList<AttachedFile> boardImg(SqlSessionTemplate sqlSession, int boardId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reviewMapper.boardImg", boardId);
	
	}

	public int countReply(SqlSessionTemplate sqlSession, int boardId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.countReply",boardId);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, PageInfo pi, int boardId) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReply", boardId, rowBounds);
	}
	
}
