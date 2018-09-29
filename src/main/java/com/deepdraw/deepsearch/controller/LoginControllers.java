package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.entity.Zyw;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.AreaService;
import com.deepdraw.deepsearch.service.ZywService;
import com.deepdraw.deepsearch.util.*;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@RestController
public class LoginControllers {

    @Autowired
    private ZywService zywService;

    @Value("sign.url.cod")
    private String code;

    /**
     * 主界面
     * @param mv
     * @return
     */
    @RequestMapping("/searchIndex")
    public ModelAndView searchIndex(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        SHUser shUser = ContextHolder.getSessionSHUser();
        if (shUser == null) {
            mv.addObject("user",null);
        }else {
            mv.addObject("user",JsonUtil.object2Json(shUser));
        }
        mv.setViewName("search");
        return mv;
    }

    /**
     * 登陆
     * @param mv
     * @return
     */
    @RequestMapping("/sign")
    public ModelAndView sign(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("sign");
        return mv;
    }

    /**
     * 注册
     * @param mv
     * @return
     */
    @RequestMapping("/signup")
    public ModelAndView signup(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("signup");
        return mv;
    }

    /**
     * 修改密码
     * @param mv
     * @return
     */
    @RequestMapping("/forgotpassword")
    public ModelAndView forgotpassword(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("forgotpassword");
        return mv;
    }


    /**
     * 查看用户
     * @param mv
     * @return
     */
    @RequestMapping("/selectUser")
    public ModelAndView selectUser(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("users");
        return mv;
    }

    /** 注销用户
     * * @return*/
    @RequestMapping("/removeSession")
    public void removeSession(HttpServletRequest request,HttpSession session)  {
        System.out.print(11111);
        session=request.getSession();
        session.removeAttribute("shUser");
    }

    @RequestMapping("/adminPage")
    public ModelAndView adminPage(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("adminPage");
        return mv;
    }

}
