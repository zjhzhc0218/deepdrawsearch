package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/login")
public class LoginUserControllers {

    private final static Logger logger = LoggerFactory.getLogger(LoginUserControllers.class);

    @Autowired
    private SHUserService shUserService;
    //
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

        String address = PhoneUtil.getMobileAddressByBaiDu(id.toString());
        System.out.println("对应id的地址："+address);

//        return JsonUtil.object2Json(ResultUtil.error(2,"OJBK"));
        Map<String,Object> map = shUserService.selectUser(id, password);
        if(map.get("shUser")!=null){
            session=request.getSession();
            session.setMaxInactiveInterval(14400);
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
    public String registered(HttpServletRequest request, Long id, String password,String mobileCode,String signCode,HttpSession session) throws IOException {
        /*测试后台进程的速度 返回值是对应的当前时间到某个时间的过去的毫秒*/
        Long timeStart =  System.currentTimeMillis();

        System.out.println(signCodeNew);
        System.out.println(signCode);
//        if(signCode==null){
//            String messge = "没有邀请码，请输入邀请码";
//            return JsonUtil.object2Json(ResultUtil.error(1,messge));
//        }
        if(!signCodeNew.equals(signCode)){
            String messge = "邀请码输入错误，请重新通过微信二维码获取";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }

        if(session.getAttribute("mobileNum") == null){
            String messge = "请先点击获取手机验证码";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }
        String mobileNum = session.getAttribute("mobileNum").toString();
        if(!mobileNum.equals(mobileCode)){
            String messge = "手机验证码输入错误，请重新获取手机验证码";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }

        String ip = NetWorkUtil.getIpAddress(request).toString();
        System.out.println("当前的ip地址是"+ip);


        SHUser shUser = new SHUser();
        shUser.setId(id);
        String address = PhoneUtil.getMobileAddressByBaiDu(id.toString());
        shUser.setNickname(address);

        String salt = SixNumberRadom.getSixNumberRadom();
        String passwords = MD5Util.inputPassToDbPass(password,salt);
        shUser.setSalt(salt);
        shUser.setPassword(passwords);
        shUser.setHead(null);


        String messge =  shUserService.addUser(shUser);

        Map<String,Object> map = shUserService.selectUser(id, password);
        if(map.get("shUser")!=null){
            session=request.getSession();
            session.setMaxInactiveInterval(14400);
            session.setAttribute("shUser",map.get("shUser"));

        }

        System.out.println(JsonUtil.object2Json(ResultUtil.success(messge)));

         return JsonUtil.object2Json(ResultUtil.success(messge));
    }

    /*** 忘记密码处理
     * * @param name
     * * @param password
     * * @return*/
    @RequestMapping("/userForgot")
    @ResponseBody
    public String forgot(HttpServletRequest request, Long id, String mobileCode,String passwordagain,HttpSession session) throws IOException {
        String ip = NetWorkUtil.getIpAddress(request).toString();

        if(session.getAttribute("mobileNum") == null){
            String messge = "请先点击获取手机验证码";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }
        String mobileNum = session.getAttribute("mobileNum").toString();
        if(!mobileNum.equals(mobileCode)){
            String messge = "手机验证码输入错误，请重新获取手机验证码";
            return JsonUtil.object2Json(ResultUtil.error(1,messge));
        }

        Map<String,Object> map = shUserService.selectUsermessage(id);
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

    public Object getUsers(HttpServletRequest request, Long id,Integer type, String timeStart,String timeEnd) throws IOException {
        logger.info("id="+id+",timeStart="+timeStart+",timeEnd="+timeEnd);
        String message = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date timeStartN = null;
        Date timeEndN = null;
        if(timeStart==null && timeEnd==null){
            if(type==null){
                type=99;
            }
        }
        if(timeStart!=null &&timeEnd!=null ){
            if(timeStart.length()!=0 && timeEnd.length()!=0) {
                type = 1;
                try {
                    timeStartN = sdf.parse(timeStart);
                    timeEndN = sdf.parse(timeEnd);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }
        Map<String,Object> maps = new HashMap<>();
        List<SHUser> shUser = shUserService.selectUserByTime(id, type, timeStartN, timeEndN);
        maps.put("User",shUser);
        message = "本次查询，总共查询到"+shUser.size()+"条记录";
        maps.put("count",message);
        return JsonUtil.object2Json(ResultUtil.success(maps));
    }

    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/getSessionUser")
    public String getSessionUser(HttpServletRequest request) throws IOException {
        SHUser shUser = ContextHolder.getSessionSHUser();
        return JsonUtil.object2Json(ResultUtil.success(shUser));
    }

}
