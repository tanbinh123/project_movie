package com.springboot.movie.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

	// 로그인 페이지 띄우기
	@GetMapping("/auth/signin")
	public String getLoginIndex() {
		return "auth/signin";
	}
	
	// 회원가입 페이지 띄우기
	@GetMapping("/auth/signup")
	public String getSignUpIndex() {
		return "auth/signup";
	}
	
}
