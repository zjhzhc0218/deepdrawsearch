package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/User")
public class UserControllers {


//    private final static Logger logger = (Logger) LoggerFactory.getLogger(LoginUserControllers.class);

    @Autowired
    private SHUserService shUserService;

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

//    禁止登录 恢复登录
    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/ban")
    public String ban(HttpServletRequest request,Long id ,Integer type) throws IOException {
        String message =  "";
//        传入用户手机号，以及跟禁用还是恢复 登录 判断
        return JsonUtil.object2Json(ResultUtil.success(message));
    }

//    后台一键还原密码 （密码为123456）
    @RequestMapping("/passwordReduction")
    public String passwordReduction(HttpServletRequest request,Long id ) throws IOException {
        String message =  "";
        String salt = SixNumberRadom.getSixNumberRadom();
        String passwords = MD5Util.inputPassToDbPass("123456",salt);

//        传入用户手机号，以及跟禁用还是恢复 登录 判断
    return JsonUtil.object2Json(ResultUtil.success(message));
}

}
