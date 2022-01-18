package com.springboot.movie.config.oauth2;

import java.util.Map;
import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.springboot.movie.config.auth.PrincipalDetails;
import com.springboot.movie.config.oauth2.provider.OAuth2UserDto;
import com.springboot.movie.domain.user.User;
import com.springboot.movie.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	
	private final UserRepository userRepository;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println(userRequest.getClientRegistration());
		System.out.println(userRequest.getAccessToken());
		System.out.println(super.loadUser(userRequest).getAttributes());
		
		OAuth2User oAuth2User = super.loadUser(userRequest); // 유저 객체를 들고온다. 유저의 기본정보 그대로를 들고온다.
		Map<String, Object> attributes = oAuth2User.getAttributes(); // 위에서 getAttributes한 값이 Map형태로 담겼다.
		// 아이디 등록
		String provider = userRequest.getClientRegistration().getRegistrationId();
		String providerId = null;
		if(provider.equals("google")){
			providerId = (String)attributes.get("sub");
		} else if(provider.equals("facebook")) {
			providerId = (String)attributes.get("id");
		} else if(provider.equals("naver")) {
			attributes = (Map<String, Object>)attributes.get("response");
			providerId = (String)attributes.get("id");
		} else {
			providerId = UUID.randomUUID().toString().replaceAll("-", "");
		}
		
		String username = provider + "_" + providerId;
		
		User userEntity = userRepository.getUser(username); // 도메인의 유저
		System.out.println(userEntity);
		
		if(userEntity == null) {
			// 처음 사이트 로그인
			OAuth2UserDto oAuth2UserDto = OAuth2UserDto.builder()
											.username(username)
											.password(new BCryptPasswordEncoder().encode(UUID.randomUUID().toString()))
											.email((String)attributes.get("email"))
											.name((String)attributes.get("name"))
											.telephone((String)attributes.get("telephone"))
											.role("ROLE_USER")
											.provider(provider)
											.build();
			
			userEntity = oAuth2UserDto.toEntity();
			System.out.println(userEntity);
			userRepository.signup(userEntity);
			}
			// 회원가입이 이미 되어있는 provider계정
			return new PrincipalDetails(userEntity, attributes);
	}
	
}
