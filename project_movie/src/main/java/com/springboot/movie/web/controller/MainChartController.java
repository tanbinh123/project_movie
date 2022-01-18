package com.springboot.movie.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainChartController {
	
	// 기본페이지 -> 영화 차트 페이지
	@GetMapping("/")
	public String indexRedirectHandler() {
		return "redirect:/chart/boxoffice";
	}
	
	

}
