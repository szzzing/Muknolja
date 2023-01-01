package com.spring.muknolja.travel.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.Reply;

@Repository
public class TravelDAO {

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int refBoardId) {
		return (ArrayList)sqlSession.selectList("replyMapper.selectReply", refBoardId);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyId) {
		return sqlSession.update("replyMapper.deleteReply", replyId);
	}

}
