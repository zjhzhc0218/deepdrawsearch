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

    /**
     * 重新对该用户权限进行判断
     * @param request
     * @param id
     * @param session
     * @return
     * @throws IOException
     */
    @RequestMapping("/selectGrade")
    @ResponseBody
    public Object selectGrade(HttpServletRequest request,Long id ,HttpSession session) throws IOException {
        Map<String, Object> message = shUserService.selectUsermessage(id);
        if((Integer)message.get("grade")==3){
            session=request.getSession();
            session.setMaxInactiveInterval(14400);
            session.setAttribute("shUser",message.get("shUser"));
            return JsonUtil.object2Json(ResultUtil.success(message));
        }else{
            return JsonUtil.object2Json(ResultUtil.error(2,"权限未改变"));
        }
    }

    /*查询用户是否存在*/
    @RequestMapping("/selectUser")
    @ResponseBody
    public String selectUser(HttpServletRequest request,Long id ) throws IOException {
//        传入用户手机号，以及跟禁用还是恢复 登录
        Map<String, Object> message  = shUserService.selectUsermessage(id );
        return JsonUtil.object2Json(ResultUtil.success(message));
    }


//    禁止登录 恢复登录
    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/ban")
    @ResponseBody
    public String ban(HttpServletRequest request,Long id ,Integer type) throws IOException {
        String message =  "";
//        传入用户手机号，以及跟禁用还是恢复 登录
        message = shUserService.banChange(id, type);
        return JsonUtil.object2Json(ResultUtil.success(message));
    }

//    后台一键还原密码 （密码为123456abc）
    @RequestMapping("/passwordReduction")
    @ResponseBody
    public String passwordReduction(HttpServletRequest request,Long id ) throws IOException {
        String message =  "";
        String salt = SixNumberRadom.getSixNumberRadom();
        String passwords = MD5Util.inputPassToDbPass("123456abc",salt);
//        传入用户手机号，以及跟禁用还是恢复 登录 判断
        message = shUserService.resetpassword(id,passwords,salt);
    return JsonUtil.object2Json(ResultUtil.success(message));
}

    //    后台提升权限 （
    @RequestMapping("/updateGrade")
    @ResponseBody
    public String updataGrade(HttpServletRequest request,Long id,Integer type ) throws IOException {
        String message =  "";
//        传入用户手机号，升权限还是降权限   type 3 就是升权限   type2 就是降权限
        message = shUserService.updataGrade(id, type);
        return JsonUtil.object2Json(ResultUtil.success(message));
    }

}
