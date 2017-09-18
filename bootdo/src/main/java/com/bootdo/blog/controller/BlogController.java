package com.bootdo.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {
	@GetMapping("/blog")
	String blog() {
		return "blog/index/main";
	}
}
