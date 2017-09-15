package com.bootdo.common.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.bootdo.common.service.GeneratorService;

@RequestMapping("/common/generator")
@Controller
public class GeneratorController {
	String prefix = "common/generator";
	@Autowired
	GeneratorService generatorService;

	@GetMapping()
	String generator() {
		return prefix + "/list";
	}
	@ResponseBody
	@GetMapping("/list")
	List<Map<String, Object>> list() {
		List<Map<String, Object>> list = generatorService.list();
		return list;
	};

	@RequestMapping("/code/{tableName}")
	public void code(HttpServletRequest request, HttpServletResponse response,@PathVariable("tableName") String tableName) throws IOException {
		String[] tableNames = new String[] {tableName};
		//String tables = request.getParameter("tables");
		//tableNames = JSON.parseArray(tables).toArray(tableNames);
		
		byte[] data =generatorService.generatorCode(tableNames);

		response.reset();
		response.setHeader("Content-Disposition", "attachment; filename=\"bootdo.zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");

		IOUtils.write(data, response.getOutputStream());
	}
	
	@RequestMapping("/batchCode")
	public void batchCode(HttpServletRequest request, HttpServletResponse response, String tables) throws IOException {
		String[] tableNames = new String[]{};
		//String tables = request.getParameter("tables");
		tableNames = JSON.parseArray(tables).toArray(tableNames);
		byte[] data =generatorService.generatorCode(tableNames);

		response.reset();
		response.setHeader("Content-Disposition", "attachment; filename=\"bootdo.zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");

		IOUtils.write(data, response.getOutputStream());
	}
}
