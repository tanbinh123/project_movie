package com.springboot.movie.domain.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	
	public int useridCheck(User user); // 아이디 중복확인
	public int signup(User user); // 회원가입 insert
	public User getUser(String username); // user객체를 들고온다.

}
