package com.springboot.movie.web.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springboot.movie.domain.user.User;
import com.springboot.movie.domain.user.UserRepository;
import com.springboot.movie.web.dto.SignUpDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthSerivceImpl implements AuthService{	
	
	private final UserRepository userRepository;
	
	// 회원가입
	@Override
	public int signup(SignUpDto signUpDto) {
		
		User user = signUpDto.toEntity();
		int userNameCheckResult = userRepository.useridCheck(user);
		if(userNameCheckResult == 1) {
			// 이미 존재하는 id
			return 2;
		} else {
			// 회원가입 가능
			user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword())); // 암호화된 password로 set한다.
			user.setRole("ROLE_USER");
			int signupResult = userRepository.signup(user);
			return signupResult;
		}
	}

}
