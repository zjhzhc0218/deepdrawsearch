package com.deepdraw.deepsearch.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestControllers {

    @RequestMapping("/login")
    public ModelAndView toDemo(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("index");
        return mv;
    }
}
