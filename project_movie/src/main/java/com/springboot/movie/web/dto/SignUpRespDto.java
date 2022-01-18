package com.springboot.movie.web.dto;

import lombok.Data;

@Data
public class SignUpRespDto<T> {
	
	private int code;
	private T msg; // T는 제네릭 사용

}
  