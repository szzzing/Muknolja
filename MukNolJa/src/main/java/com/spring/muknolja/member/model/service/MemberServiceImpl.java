package com.spring.muknolja.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.member.model.dao.MemberDAO;
import com.spring.muknolja.member.model.vo.Member;

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
		// TODO Auto-generated method stub
		return mDAO.checkEmail(sqlSession,email);
	}

	@Override
	public int checkId(String id) {
		// TODO Auto-generated method stub
		return mDAO.checkId(sqlSession,id);
	}

	@Override
	public int checkNickName(String nickName) {
		// TODO Auto-generated method stub
		return mDAO.checkNickName(sqlSession,nickName);
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return mDAO.insert(sqlSession,m);
	}

}
