package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.Zyw;
import com.deepdraw.deepsearch.service.AreaService;
import com.deepdraw.deepsearch.service.ZywService;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.NetWorkUtil;
import com.deepdraw.deepsearch.util.ResultMsg;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
public class LoginControllers {

    @Autowired
    private AreaService areaService;

    @Autowired
    private ZywService zywService;

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

    /**
     * 登陆页2
     * @param mv
     * @return
     */
    @RequestMapping("/luyou")
    public ModelAndView luyou(ModelAndView mv) {
        //mv.addObject("name", "测试1");
        mv.setViewName("luyou");
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
    public String passwordToLogin(HttpServletRequest request, String name, String password) throws IOException {
        //mv.addObject("name", "测试1");
        // System.out.println("进入测试了吗");
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

         String messge = zywService.selectZyw(name, password);
        // mv.addObject("now", DateFormat.getDateTimeInstance().format(new Date()));
        // mv.setViewName("index");
        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));
        System.out.println("123");
         return JsonUtil.object2Json(ResultUtil.success(messge));
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
        zyw.setPassword(password);
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

        Zyw zyw = new Zyw();
        zyw.setLastIp(ip);
        zyw.setName(name);
        zyw.setPassword(password);

        String messge = zywService.updateZyw(zyw, passwordagain);
        // mv.addObject("now", DateFormat.getDateTimeInstance().format(new Date()));
        // mv.setViewName("index");
        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));
        System.out.println("123");
        return JsonUtil.object2Json(ResultUtil.success(messge));
    }
}
