package com.spring.muknolja.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.idsol", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickName", nickName);
	}

	public int insert(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertM", m);
	}

	public String findId(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.findId", email);
	}
	public void visitCount(SqlSessionTemplate sqlSession, String id) {
		sqlSession.insert("memberMapper.visitCount", id);
	}

	public Visit selectVisitCounter(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectVisitCounter", id);
	}

	public ArrayList<Member> selectVisitToday(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectVisitToday");
	}

	public ArrayList<Map<String, Integer>> selectVisitList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectVisitList");
	}

	public String selectPwd(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.selectPwd", id);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.memberListCount", sqlSession);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", map, rowBounds);
	}

	public ArrayList<Map<String, Integer>> enrollCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.enrollCount");
	}

	public int waring(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.waring", id);
	}

	public int stop(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.stop", id);
	}

	public ArrayList<Map<String, Integer>> bCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.bCount");
	}

	public int boardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.boardListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardList", map, rowBounds);
	}

}
