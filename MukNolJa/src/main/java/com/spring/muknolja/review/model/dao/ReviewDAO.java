package com.spring.muknolja.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.common.model.vo.Report;


@Repository("rDAO")
public class ReviewDAO {

	public int getselectBoard(SqlSessionTemplate sqlSession, int sarea) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewMapper.getSelectBoard",sarea);
	}

	public ArrayList<Board> getselectBoard(SqlSessionTemplate sqlSession, PageInfo pi, int Sarea) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectBoard", Sarea, rowBounds);
	
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

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardId) {
		
	
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReply", boardId);
	}

	public ArrayList<Reply> selectRe(SqlSessionTemplate sqlSession, int refReplyId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("replyMapper.selectReReply",refReplyId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyMapper.insertReply",reply);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertBoard",map);
	}

	public int insertReport(SqlSessionTemplate sqlSession, Report report) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewMapper.insertReport",report);
	}

	public int insertReRe(SqlSessionTemplate sqlSession, Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyMapper.insertReReply",reply);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, ArrayList<Reply> reply1) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("replyMapper.selectReplyImg", reply1);
	}

	public Reply selectReply1(SqlSessionTemplate sqlSession, Reply num) {
		// TODO Auto-generated method stub
	return sqlSession.selectOne("replyMapper.selectReply1",num);
	}
	
	
}
