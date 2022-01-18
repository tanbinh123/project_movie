package com.springboot.movie.web.service;

import com.springboot.movie.web.dto.SignUpDto;

public interface AuthService {

	public int signup(SignUpDto signUpDto); // 회원가입
	
}
