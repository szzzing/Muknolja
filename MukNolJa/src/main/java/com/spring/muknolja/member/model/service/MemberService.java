package com.spring.muknolja.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

public interface MemberService {

	Member login(Member m);

	int checkEmail(String email);

	int checkId(String id);

	int checkNickName(String nickName);

	int insertMember(Member m);

	

	String findId(String email);

	void visitCount(String id);

	Visit selectVisitCounter(String id);

	ArrayList<Member> selectVisitToday();

	ArrayList<Map<String, Integer>> selectVisitList();

	String selectpwd(String id);

	int updateMember(Member m);

}
