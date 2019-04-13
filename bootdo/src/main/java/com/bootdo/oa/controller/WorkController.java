package com.bootdo.oa.controller;

import com.bootdo.oa.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/oa/work")
public class WorkController {
    @Autowired
    WorkService workService;

    @GetMapping
    ModelAndView work() {
        return new ModelAndView("/act/model/model");
    }

    @GetMapping("/listTodoWork")
    List listTodoWork() {
        return workService.listTodoWork();
    }
}
