package com.springboot.movie.web.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.movie.web.dto.SignUpDto;
import com.springboot.movie.web.dto.SignUpRespDto;
import com.springboot.movie.web.service.AuthService;

import lombok.RequiredArgsConstructor;


@RestController
@RequiredArgsConstructor
public class AuthRestController {
	
	private final AuthService authService;
	
	@PostMapping("/auth/signup") // JSON형태로 변환, Object객체 사용
	public Object signup(@Valid SignUpDto signUpDto, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) { // 유효성 검사시 에러가 있는지????
			// 유효성 검사시 오류 있음
			Map<String, String> errorMap = new WeakHashMap<String, String>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			SignUpRespDto<Map<String, String>> signUpRespDto = new SignUpRespDto<Map<String,String>>();
			signUpRespDto.setCode(400); // 400에러
			signUpRespDto.setMsg(errorMap);
			return signUpRespDto;
		} else { 
			// 회원가입 진행
			SignUpRespDto<String> signUpRespDto = new SignUpRespDto<String>();
			int signupResult = authService.signup(signUpDto);
			if(signupResult == 1) {
				// 회원가입 성공
				signUpRespDto.setCode(200); // 200번 코드는 성공에 대한 코드
				signUpRespDto.setMsg("성공적으로 회원가입이 완료되었습니다.");
			} else if(signupResult == 2) {
				// 아이디 중복
				signUpRespDto.setCode(410); // 클라이언트에서 잘못 400번대 코드 사용
				signUpRespDto.setMsg("이미 가입된 계정입니다.");
			} else {
				// DB오류
				signUpRespDto.setCode(500); // 서버에서 문제 500번대 코드 사용
				signUpRespDto.setMsg("회원가입에 실패했습니다. 다시 확인해주세요.");
			}
			return signUpRespDto;
		}
	}

}
