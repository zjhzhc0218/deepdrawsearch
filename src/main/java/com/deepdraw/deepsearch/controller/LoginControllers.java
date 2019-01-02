package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.util.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
public class LoginControllers {


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
        SHUser shUser = ContextHolder.getSessionSHUser();
        if (shUser == null) {
            mv.addObject("user",null);
        }else {
            mv.addObject("user",JsonUtil.object2Json(shUser));
        }
        mv.setViewName("adminPage");
        return mv;
    }

    /**
     * 首页
     * @param mv
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        SHUser shUser = ContextHolder.getSessionSHUser();
        if (shUser == null) {
            mv.addObject("user",null);
        }else {
            mv.addObject("user",JsonUtil.object2Json(shUser));
        }
        mv.setViewName("index");
        return mv;
    }
    /**
     * 资讯页面
     * @param mv
     * @return
     */
    @RequestMapping("/tool")
    public ModelAndView tool(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("tool");
        return mv;
    }
    /**
     * 资讯详情
     * @param mv
     * @return
     */
    @RequestMapping("/tool_details")
    public ModelAndView tool_details(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("tool_details");
        return mv;
    }

    /**
     * 公告
     * @param mv
     * @return
     */
    @RequestMapping("/notice")
    public ModelAndView notice(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("notice");
        return mv;
    }
    /**
     * 公共头部
     * @param mv
     * @return
     */
    @RequestMapping("/header")
    public ModelAndView header(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("header");
        return mv;
    }
    /**
     * 公共底部
     * @param mv
     * @return
     */
    @RequestMapping("/footer")
    public ModelAndView footer(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("footer");
        return mv;
    }

}
