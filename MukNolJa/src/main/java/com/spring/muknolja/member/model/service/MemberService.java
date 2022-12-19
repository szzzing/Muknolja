package com.spring.muknolja.member.model.service;

import java.util.ArrayList;

import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

public interface MemberService {

	Member login(Member m);

	int checkEmail(String email);

	int checkId(String id);

	int checkNickName(String nickName);

	int insertMember(Member m);

	void visitCount(String id);

	Visit selectVisitCounter(String id);

	ArrayList<Visit> selectVisitToday();

}
