package com.spring.muknolja.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
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

	public int changePassword(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.changePassword",m);
	}

	public String selectEid(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectEid",email);
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

	public ArrayList<Map<String, Integer>> incomeCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.incomeCount");
	}

	public ArrayList<AD> selectADList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectADList", map);
	}

	

	

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertAttm",list);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.myInfoBCount",id);
	}

	

	public ArrayList<QA> selectQA(SqlSessionTemplate sqlSession, String id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectQA", id, rowBounds);
	}

	public ArrayList<Hotel> selectHotel(SqlSessionTemplate sqlSession, String id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectHotel", id, rowBounds);
	}

	public ArrayList<Reservation> selectReserve(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReserve", id, rowBounds);
	
	}

	/*
	 * public ArrayList<AttachedFile> selectImg(SqlSessionTemplate sqlSession, int
	 * hotelId) { // TODO Auto-generated method stub return
	 * (ArrayList)sqlSession.selectList("memberMapper.selectImg", hotelId); }
	 */
	}

	
	


