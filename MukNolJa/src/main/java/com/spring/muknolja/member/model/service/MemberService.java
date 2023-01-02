package com.spring.muknolja.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;
import com.spring.muknolja.party.model.vo.Party;

public interface MemberService {

	Member login(Member m);

	int checkEmail(String email);

	int checkId(String id);

	int checkNickName(String nickName);

	int insertMember(Member m);

	

	String findId(String email);

	void visitCount(HashMap<String, String> map);

	Visit selectVisitCounter(String id);

	ArrayList<Member> selectVisitToday();

	ArrayList<Map<String, Integer>> selectVisitList();

	String selectpwd(String id);

	int updateMember(Member m);

	int memberListCount();

	ArrayList<Member> selectMemberList(PageInfo pi, HashMap<String, Object> map);

	ArrayList<Map<String, Integer>> enrollCount();

	int waring(String id);

	int stop(String id);

	int changePassword(Member m);

	String selectEid(String email);

	ArrayList<Map<String, Integer>> bCount();

	int boardListCount();

	ArrayList<Object> selectBoardList(HashMap<String, Object> map, PageInfo pi);

	ArrayList<Map<String, Integer>> incomeCount();

	ArrayList<AD> selectADList(int category);

	ArrayList<Reservation> selectReserve(String id);

	

	int insertsAttm(ArrayList<AttachedFile> list);

	int getListCount(String id);

	

	ArrayList<QA> selectQA(String id, PageInfo pi);

	ArrayList<Hotel> selectHotel(String id, PageInfo pi);

	ArrayList<AttachedFile> selectImg();

	ArrayList<Reservation> selectReserve(PageInfo pi, String id);

	int deleteDD(int id);

	int getListCount1(String id);

	int deleteBB(int id);

	int getListCount2(String id);

	int deleteAA(LikeHotel list);

	int getListCount3(String id);

	ArrayList<Party> selectParty(PageInfo pi, String id);

	int getListCount4(String id);

	int getListCount5(String id);

	ArrayList<Board> selectB(PageInfo pi, String id);

	ArrayList<Map<String, Integer>> selectVisitAllList();

	int waringCheck(String id);

	int insertAd(HashMap<String, Object> map);

	AttachedFile selectAttm(int id);

	int updateAttm(HashMap<String, Object> map);

	int updateAd(HashMap<String, Object> aMap);

	int reportListCount();

	ArrayList<Object> selectReportList(String search, PageInfo pi);

	String selectBoardType(String id);

	int updateProcessing(String id);

	ArrayList<Map<String, Integer>> QACount();

	ArrayList<QA> selectQAList();

	int insertQA(QA q);

	QA selectQAOne(String id);
	/* ArrayList<AttachedFile> selectImg(int hotelId); */

	int updateQAReply(QA q);

	ArrayList<String> selectAd(String type);

	int selectPBoardFileId(int id);

	int reportReply(HashMap<String, Object> map);

	String selectBoardId(String id);






}
