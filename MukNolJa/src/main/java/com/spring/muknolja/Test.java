package com.spring.muknolja;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Test {
	@GetMapping("member.me")
	public String member() {
		return "member";
	}
}
