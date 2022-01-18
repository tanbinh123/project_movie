package com.springboot.movie.config.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springboot.movie.domain.user.User;
import com.springboot.movie.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;

//loadUser메서드가 종료시(return) @AuthenticationPrincipal 어노테이션을 사용할 수 있게 만들어 준다.
// @AuthenticationPrincipal - 세션정보를 담는 공간이다.
@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService {
	
	private final UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException { 
		User userEntity = userRepository.getUser(username);  // DB에서 값을 들고온다.
		if(userEntity == null) {
			//해당 아이디가 없다.
			return null;
		} else {
			// 로그인 가능한 객체
			UserDetails principalDetails = new PrincipalDetails(userEntity);
			return principalDetails;
		}
	}

}
