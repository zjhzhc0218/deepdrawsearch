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
            mv.setViewName("sign");
            return mv;
        }
        mv.addObject("user",JsonUtil.object2Json(shUser));
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



    /*** 登录信息处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/passwordToLogin")
    public String passwordToLogin(HttpServletRequest request, String name, String password,HttpSession session) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

        Map<String,Object> map = zywService.selectZyw(name, MD5Util.inputPassToFormPass(password));
        // mv.addObject("now", DateFormat.getDateTimeInstance().format(new Date()));
        // mv.setViewName("index");
        session=request.getSession();
        session.setMaxInactiveInterval(300);
        session.setAttribute("user",map.get("user"));
        System.out.println("123");
        System.out.println(JsonUtil.object2Json(ResultUtil.success(map.get("message"))));
        Zyw zyw = ContextHolder.getSessionUser();
        session.setAttribute("username",zyw.getName());
        System.out.println(zyw);
        System.out.println("123");
         return JsonUtil.object2Json(ResultUtil.success(map.get("message")));
    }

    /*** 注册信息处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/registered")
    public String registered(HttpServletRequest request, String name, String password,HttpSession session) throws IOException {
        //mv.addObject("name", "测试1");
        // System.out.println("进入测试了吗");
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

        Zyw zyw = new Zyw();
        zyw.setLastIp(ip);
        zyw.setName(name);
        zyw.setPassword(MD5Util.inputPassToFormPass(password));
         session=request.getSession();
        session.setMaxInactiveInterval(30);
        session.setAttribute("user",zyw);
        String messge = zywService.addZyw(zyw);

        // mv.addObject("now", DateFormat.getDateTimeInstance().format(new Date()));
        // mv.setViewName("index");
        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));
        System.out.println("123");
        return JsonUtil.object2Json(ResultUtil.success(messge));
    }

    /*** 修改密码处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/forgot")
    public String forgot(HttpServletRequest request, String name, String password,String passwordagain) throws IOException {
        //mv.addObject("name", "测试1");
        // System.out.println("进入测试了吗");
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

        Zyw zywN = ContextHolder.getSessionUser();

        Zyw zyw = new Zyw();
        zyw.setLastIp(ip);
        zyw.setName(name);
        zyw.setPassword(MD5Util.inputPassToFormPass(password));

        String messge = zywService.updateZyw(zyw, MD5Util.inputPassToFormPass(passwordagain));
        // mv.addObject("now", DateFormat.getDateTimeInstance().format(new Date()));
        // mv.setViewName("index");
        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));
        System.out.println("123");
        return JsonUtil.object2Json(ResultUtil.success(messge));
    }

    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/getSessionUser")
    public String getSessionUser(HttpServletRequest request) throws IOException {
        Zyw zywN = ContextHolder.getSessionUser();
        return JsonUtil.object2Json(ResultUtil.success(zywN));
    }

    /** 注销用户
     * * @return*/
    @RequestMapping("/removeSession")
    public void removeSession(HttpServletRequest request,HttpSession session)  {
        System.out.print(11111);
        session=request.getSession();
        session.removeAttribute("shUser");
    }
}
