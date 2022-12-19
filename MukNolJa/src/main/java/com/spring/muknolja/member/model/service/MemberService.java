package com.spring.muknolja.member.model.service;

import com.spring.muknolja.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int checkEmail(String email);

	int checkId(String id);

	int checkNickName(String nickName);

	int insertMember(Member m);

	

	String findId(String email);

}
