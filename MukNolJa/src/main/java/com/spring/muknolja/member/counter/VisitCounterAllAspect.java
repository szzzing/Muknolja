package com.spring.muknolja.member.counter;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import com.spring.muknolja.member.model.service.MemberService;
import com.spring.muknolja.member.model.vo.Visit;

@EnableAspectJAutoProxy
@Component
@Aspect
public class VisitCounterAllAspect {
	
	@Autowired
	private MemberService mService;
	
	@After("execution(String com.spring.muknolja.HomeController.home(..))")
	public void counterAdviceAll(JoinPoint joinPoint) {
		
		Object[] arr = joinPoint.getArgs();
		HttpSession session = (HttpSession)arr[0];
		String id = session.getId();
		
		Visit v = mService.selectVisitCounter(id);
		
		if(v == null) {
			HashMap<String, String> map = new HashMap<>();
			
			map.put("id", id);
			map.put("check", "a");
			
			mService.visitCount(map);
		}
	}
}
