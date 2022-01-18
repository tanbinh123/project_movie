package com.springboot.movie.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainChartController {
	
	// 메인페이지 띄우기
	@GetMapping("/")
	public String listPageIndex() {
		return "redirect:/chart/boxoffice";
	}

}
