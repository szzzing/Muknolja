package com.spring.muknolja.member.counter;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.muknolja.member.model.service.MemberService;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.member.model.vo.Visit;

@Component
@Aspect
public class VisitCounterAspect {
	
	@Autowired
	private MemberService mService;
	
	@After("execution(String com.spring.muknolja.member.controller.MemberController.login(..))")
	public void counterAdvice(JoinPoint joinPoint) {
		Object[] arr = joinPoint.getArgs();
		
		HttpSession session = (HttpSession)arr[2];
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			
			Visit v = mService.selectVisitCounter(loginUser.getId());
			
			if(v == null) {
				mService.visitCount(loginUser.getId());
			}
		}
	}
}
