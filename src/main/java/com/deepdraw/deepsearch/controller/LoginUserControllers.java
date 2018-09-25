package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.entity.Zyw;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.*;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginUserControllers {


    @Autowired
    private SHUserService shUserService;


    /*** 登录信息处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/userLogin")
    @ResponseBody
    public String passwordToLogin(HttpServletRequest request, String id, String password,HttpSession session) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

        Map<String,Object> map = shUserService.selectUser(id, password);
        if(map.get("shUser")!=null){
            session=request.getSession();
            session.setMaxInactiveInterval(1800);
            session.setAttribute("shUser",map.get("shUser"));
        }

        System.out.println(JsonUtil.object2Json(ResultUtil.success(map.get("message"))));
         return JsonUtil.object2Json(ResultUtil.success(map.get("message")));
    }

    /*** 注册信息处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/userRegistered")
    @ResponseBody
    public String registered(HttpServletRequest request, String id, String password) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);


        SHUser shUser = new SHUser();
        shUser.setId(id);
        shUser.setNickname("joshon");

        String salt = SixNumberRadom.getSixNumberRadom();
        String passwords = MD5Util.inputPassToDbPass(password,salt);
        shUser.setSalt(salt);
        shUser.setPassword(passwords);
        shUser.setHead(null);


        String messge = shUserService.addUser(shUser);

        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));

        return JsonUtil.object2Json(ResultUtil.success(messge));
    }

    /*** 修改密码处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/userForgot")
    @ResponseBody
    public String forgot(HttpServletRequest request, String id, String password,String passwordagain) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

        Map<String,Object> map = shUserService.selectUser(id, password);
        String messge = "";
        if(map.get("shUser")!=null){
            SHUser shUser = (SHUser)map.get("shUser");
             messge = shUserService.updateUser(shUser, passwordagain);
        }else{
             messge = map.get("message").toString();
        }
        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));
        return JsonUtil.object2Json(ResultUtil.success(messge));
    }


    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/getSessionUser")
    public Object getSessionUser(HttpServletRequest request) throws IOException {
        SHUser shUser = ContextHolder.getSessionSHUser();
        return JsonUtil.object2Json(ResultUtil.success(shUser));
    }
}
