package com.bootdo.blog.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bootdo.common.utils.FileUtil;
import com.bootdo.common.utils.R;

@RequestMapping("/blog/attach")
@Controller
public class AttachController {
	@GetMapping()
	public String attach() {
		return "blog/attach/attach";
	}

	
}
