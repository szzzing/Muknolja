package com.spring.muknolja.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.member.model.dao.MemberDAO;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int checkEmail(String email) {
		return mDAO.checkEmail(sqlSession,email);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession,id);
	}

	@Override
	public int checkNickName(String nickName) {
		return mDAO.checkNickName(sqlSession,nickName);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insert(sqlSession,m);
	}


	@Override
	public void visitCount(HashMap<String, String> map) {
		mDAO.visitCount(sqlSession, map);
	}

	@Override
	public Visit selectVisitCounter(String id) {
		return mDAO.selectVisitCounter(sqlSession, id);
	}

	@Override
	public ArrayList<Member> selectVisitToday() {
		return mDAO.selectVisitToday(sqlSession);
	}

	@Override
	public ArrayList<Map<String, Integer>> selectVisitList() {
		return mDAO.selectVisitList(sqlSession);
	}
	
	@Override
	public ArrayList<Map<String, Integer>> selectVisitAllList() {
		return mDAO.selectVisitAllList(sqlSession);
	}

	@Override
	public String findId(String email) {
		return null;
	}

	@Override
	public String selectpwd(String id) {
		
		return mDAO.selectPwd(sqlSession, id);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	public int memberListCount() {
		return mDAO.memberListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi, HashMap<String, Object> map) {
		return mDAO.selectMemberList(sqlSession, pi, map);
	}

	@Override
	public ArrayList<Map<String, Integer>> enrollCount() {
		return mDAO.enrollCount(sqlSession);
	}

	@Override
	public int waring(String id) {
		return mDAO.waring(sqlSession, id);
	}

	@Override
	public int stop(String id) {
		return mDAO.stop(sqlSession, id);
	}

	@Override
	public int changePassword(Member m) {
		// TODO Auto-generated method stub
		return mDAO.changePassword(sqlSession, m);
	}

	@Override
	public String selectEid(String email) {
		// TODO Auto-generated method stub
		return mDAO.selectEid(sqlSession,email);
	}

	public ArrayList<Map<String, Integer>> bCount() {
		return mDAO.bCount(sqlSession);
	}

	@Override
	public int boardListCount() {
		return mDAO.boardListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoardList(HashMap<String, Object> map, PageInfo pi) {
		return mDAO.selectBoardList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<Map<String, Integer>> incomeCount() {
		return mDAO.incomeCount(sqlSession);
	}

	@Override
	public ArrayList<AD> selectADList(int category) {
		return mDAO.selectADList(sqlSession, category);
	}

	

	

	@Override
	public int insertsAttm(ArrayList<AttachedFile> list) {
		// TODO Auto-generated method stub
		return mDAO.insertAttm(sqlSession, list);
	}

	@Override
	public int getListCount(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCount(sqlSession,id);
	}

	

	@Override
	public ArrayList<QA> selectQA(String id, PageInfo pi) {
		// TODO Auto-generated method stub
		return  mDAO.selectQA(sqlSession,id, pi);
	}

	@Override
	public ArrayList<Hotel> selectHotel(String id, PageInfo pi) {
		// TODO Auto-generated method stub
		return mDAO.selectHotel(sqlSession,id,pi);
	}

	

	@Override
	public ArrayList<Reservation> selectReserve(PageInfo pi, String id) {
		// TODO Auto-generated method stub
		return mDAO.selectReserve(sqlSession,pi,id);
	}

	@Override
	public ArrayList<Reservation> selectReserve(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<AttachedFile> selectImg() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int waringCheck(String id) {
		return mDAO.waringCheck(sqlSession, id);
	}

	
	/*
	 * @Override public ArrayList<AttachedFile> selectImg(int hotelId) { // TODO
	 * Auto-generated method stub return mDAO.selectImg(sqlSession, hotelId); }
	 */

	

	

}
