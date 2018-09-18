package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.service.AreaService;
import com.deepdraw.deepsearch.util.ResultMsg;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginControllers {

    @Autowired
    private AreaService areaService;

    /**
     * 登陆页
     * @param mv
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView toDemo(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("index");
        return mv;
    }


    /**
     * 主界面
     * @param mv
     * @return
     */
    @RequestMapping("/searchIndex")
    public ModelAndView searchIndex(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("search");
        return mv;
    }


}
