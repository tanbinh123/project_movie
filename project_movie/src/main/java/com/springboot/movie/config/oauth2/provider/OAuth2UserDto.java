package com.springboot.movie.config.oauth2.provider;

import com.springboot.movie.domain.user.User;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class OAuth2UserDto {

	private String username;
	private String password;
	private String email;
	private String name;
	private String telephone;
	private String role;
	private String provider;
	
	public User toEntity() {
		return User.builder()
				.username(username)
				.password(password)
				.email(email)
				.name(name)
				.telephone(telephone)
				.role(role)
				.provider(provider)
				.build();
	}
	
}
