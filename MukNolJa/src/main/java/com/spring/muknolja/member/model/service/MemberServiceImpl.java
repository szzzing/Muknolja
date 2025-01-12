﻿package com.spring.muknolja.member.model.service;

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
import com.spring.muknolja.common.model.vo.Report;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.member.model.dao.MemberDAO;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;
import com.spring.muknolja.party.model.vo.Party;

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
	public ArrayList<Member> selectVisitToday(PageInfo pi) {
		return mDAO.selectVisitToday(sqlSession, pi);
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
	public String selectpwd(String id) {
		
		return mDAO.selectPwd(sqlSession, id);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	public int memberListCount(HashMap<String, Object> map) {
		return mDAO.memberListCount(sqlSession, map);
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
	public int boardListCount(HashMap<String, Object> map) {
		return mDAO.boardListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Object> selectBoardList(HashMap<String, Object> map, PageInfo pi) {
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
	public int deleteDD(int id) {
		// TODO Auto-generated method stub
		return mDAO.deleteDD(sqlSession,id);
	}

	@Override
	public int getListCount1(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCount1(sqlSession,id);
	}

	@Override
	public int deleteBB(int id) {
		// TODO Auto-generated method stub
		return mDAO.deleteBB(sqlSession,id);
	}

	@Override
	public int getListCount2(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCount2(sqlSession,id);
	}

	@Override
	public int deleteAA(LikeHotel list) {
		// TODO Auto-generated method stub
		return mDAO.deleteAA(sqlSession,list);
	}

	@Override
	public int getListCount3(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCount3(sqlSession,id);
	}

	@Override
	public ArrayList<Party> selectParty(PageInfo pi, String id) {
		// TODO Auto-generated method stub
		return mDAO.selectParty(sqlSession,pi,id);
	}

	@Override
	public int getListCount4(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCount4(sqlSession,id);
	}

	@Override
	public int getListCount5(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCount5(sqlSession,id);
	}

	@Override
	public ArrayList<Board> selectB(PageInfo pi, String id) {
		// TODO Auto-generated method stub
		return mDAO.selectB(sqlSession,id);
     }
	public int waringCheck(String id) {
		return mDAO.waringCheck(sqlSession, id);
	}

	@Override
	public int insertAd(HashMap<String, Object> map) {
		return mDAO.insertAd(sqlSession, map);
	}

	@Override
	public AttachedFile selectAttm(int id) {
		return mDAO.selectAttm(sqlSession, id);
	}

	@Override
	public int updateAttm(HashMap<String, Object> map) {
		return mDAO.updateAttm(sqlSession, map);
	}

	@Override
	public int updateAd(HashMap<String, Object> aMap) {
		return mDAO.updateAd(sqlSession, aMap);
	}

	@Override
	public int reportListCount(String search) {
		return mDAO.reportListCount(sqlSession, search);
	}

	@Override
	public ArrayList<Object> selectReportList(String search, PageInfo pi) {
		return mDAO.selectReportList(sqlSession, search, pi);
	}
	
	@Override
	public String selectBoardType(String id) {
		return mDAO.selectBoardType(sqlSession, id);
	}
	
	@Override
	public int updateProcessing(String id) {
		return mDAO.updateProcessing(sqlSession, id);
	}
	
	@Override
	public ArrayList<Map<String, Integer>> QACount() {
		return mDAO.QACount(sqlSession);
	}
	
	@Override
	public ArrayList<QA> selectQAList(PageInfo pi) {
		return mDAO.selectQAList(sqlSession, pi);
	}
	/*
	 * @Override public ArrayList<AttachedFile> selectImg(int hotelId) { // TODO
	 * Auto-generated method stub return mDAO.selectImg(sqlSession, hotelId); }
	 */

	@Override
	public int insertQA(QA q) {
		return mDAO.insertQA(sqlSession, q);
	}

	@Override
	public QA selectQAOne(String id) {
		return mDAO.selectQAOne(sqlSession, id);
	}
	
	@Override
	public int updateQAReply(QA q) {
		return mDAO.updateQAReply(sqlSession, q);
	}

	@Override
	public ArrayList<String> selectAd(String type) {
		return mDAO.selectAd(sqlSession, type);
	}

	@Override
	public int selectPBoardFileId(int id) {
		return mDAO.selectPBoardFileId(sqlSession, id);
	}

	@Override
	public int reportReply(HashMap<String, Object> map) {
		return mDAO.reportReply(sqlSession, map);
	}

	@Override
	public String selectBoardId(String id) {
		return mDAO.selectBoardId(sqlSession, id);
	}

	@Override
	public ArrayList<Board> selectNList(String search) {
		return mDAO.selectNList(sqlSession, search);
	}

	@Override
	public int insertNotice(HashMap<String, Object> map) {
		return mDAO.insertNotice(sqlSession, map);
	}

	@Override
	public AttachedFile selectNAttm(int id) {
		return mDAO.selectNAttm(sqlSession, id);
	}

	@Override
	public int updateNAttm(AttachedFile attm) {
		return mDAO.updateNAttm(sqlSession, attm);
	}
	
	@Override
	public int updateNotice(Board b) {
		return mDAO.updateNotice(sqlSession, b);
	}
	
	@Override
	public int insertNAttm(HashMap<String, Object> map) {
		return mDAO.insertNAttm(sqlSession, map);
	}

	@Override
	public int deleteNotice(int id) {
		return mDAO.deleteNotice(sqlSession, id);
	}

	@Override
	public int insertsAttm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mDAO.insertMemberH(sqlSession, map);
	}
	
	@Override
	public int insertMemberH(Member m) {
		// TODO Auto-generated method stub
		return mDAO.insertMemberHH(sqlSession, m);
	}


	

	public int approval(String id) {
		return mDAO.approval(sqlSession, id);
	}
	
	@Override
	public int soptClrear(String id) {
		return mDAO.soptClrear(sqlSession, id);
	}

	@Override
	public Member selectMimg(String id) {
		// TODO Auto-generated method stub
		return mDAO.selectMimg(sqlSession,id);
	}

	@Override
	public int countMimg(String id) {
		// TODO Auto-generated method stub
		return mDAO.countMimg(sqlSession,id);
	}

	@Override
	public int insertMimg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mDAO.insertMimg(sqlSession,map);}
	public String selectBusinessLicense(String id) {
		return mDAO.selectBusinessLicense(sqlSession, id);
	}

	@Override
	public int qaListCount() {
		return mDAO.qaListCount(sqlSession);
	}

	@Override
	public int todayCount() {
		return mDAO.todayCount(sqlSession);
	}

	@Override
	public String findId(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getListCountE(String id) {
		// TODO Auto-generated method stub
		return mDAO.getListCountE(sqlSession,id);
	}

	@Override
	public ArrayList<Report> selectReport(String id, PageInfo pi) {
		// TODO Auto-generated method stub
		return mDAO.selectReport(sqlSession, id, pi);
	}
	

	

}
