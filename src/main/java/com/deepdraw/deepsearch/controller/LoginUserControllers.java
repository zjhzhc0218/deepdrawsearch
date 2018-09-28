package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.exception.GlobalException;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.*;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginUserControllers {


    @Autowired
    private SHUserService shUserService;

    @Autowired
    private FunctionUsingService functionUsingService;

    @Value("${sign.url.code}")
    private String signCodeNew;


    /*** 登录信息处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/userLogin")
    @ResponseBody
    public String passwordToLogin(HttpServletRequest request, Long id, String password,HttpSession session) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);

        Map<String,Object> map = shUserService.selectUser(id, password);
        if(map.get("shUser")!=null){
            session=request.getSession();
            session.setMaxInactiveInterval(1800);
            session.setAttribute("shUser",map.get("shUser"));
            /*获取当天的时间*/
            Integer q1 = shUserService.selectUserByTime(2,null,null);
            Integer q2 = shUserService.selectUserByTime(3,null,null);
            Integer q3 = shUserService.selectUserByTime(4,null,null);
            Integer q4 = shUserService.selectUserByTime(5,null,null);

//            Integer module = 1;
//            functionUsingService.addFT(module);
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
    public String registered(HttpServletRequest request, Long id, String password,String signCode) throws IOException {
        /*测试后台进程的速度 返回值是对应的当前时间到某个时间的过去的毫秒*/
        Long timeStart =  System.currentTimeMillis();

        System.out.println(signCodeNew);
        System.out.println(signCode);
        if(signCode==null){
            String messge = "没有邀请码，请输入邀请码";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }
        if(!signCodeNew.equals(signCode)){
            String messge = "邀请码输入错误，请重新通过微信二维码获取";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }



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


        String messge =  shUserService.addUser(shUser);

        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));

         return JsonUtil.object2Json(ResultUtil.success(messge));
    }

    /*** 修改密码处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/userForgot")
    @ResponseBody
    public String forgot(HttpServletRequest request, Long id, String password,String passwordagain) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();
        //System.out.println("当前的ip地址是"+ip);
        logger.info("当前的ip地址是"+ip);
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

    /** 获取后台所有的用户信息
     * * @return*/
    @RequestMapping("/getUsers")
    @ResponseBody
    public Object getUsers(HttpServletRequest request) throws IOException {
        List<SHUser> shUser = shUserService.selectUser();
        System.out.println("123456");
        return JsonUtil.object2Json(ResultUtil.success(shUser));
    }

    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/getSessionUser")
    public String getSessionUser(HttpServletRequest request) throws IOException {
        SHUser shUser = ContextHolder.getSessionSHUser();
        return JsonUtil.object2Json(ResultUtil.success(shUser));
    }

}
