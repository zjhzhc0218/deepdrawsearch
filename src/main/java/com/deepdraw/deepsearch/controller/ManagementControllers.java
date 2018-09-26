package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 管理页面调用
 * 可查看注册用户手机号码，用户名，密码。可统计每天注册用户数，某个时间段注册用户数（以天/月为单位）。
 * 可查看每个功能模块的使用次数，以天，星期或指定时间段统计。
 * 可禁用指定的用户。
 */
@Controller
@RequestMapping("/management")
public class ManagementControllers {


    @Autowired
    private SHUserService shUserService;

    @Autowired
    private FunctionUsingService functionUsingService;


    /*** 查看注册用户号码，用户名  密码是加密的们暂时不允许查看
     * * @return*/
    @RequestMapping("/selectUser")
    @ResponseBody
    public Object selectUser(HttpServletRequest request,HttpSession session) throws IOException {
        List<SHUser> shUserList =  shUserService.selectUser();
        return JsonUtil.object2Json(ResultUtil.success(shUserList));
    }

//    统计每天注册用户数
    @RequestMapping("/registeredForNow")
    @ResponseBody
    public Object registeredForNow(HttpServletRequest request,HttpSession session) throws IOException {
        /*获取当天的时间*/
        Timestamp date = DateUtils.gettimestamp();
        /*查询当天时间的注册用户数量*/

    return JsonUtil.object2Json(ResultUtil.success(null));
    }

//    统计某个时间的注册用户数

//    查看每个模块的使用次数  以天  星期   或者指定时间段统计

//    禁用指定用户


    /** 获取后台对应的用户信息
     * * @return*/
    @RequestMapping("/getSessionUser")
    public Object getSessionUser(HttpServletRequest request) throws IOException {
        SHUser shUser = ContextHolder.getSessionSHUser();
        return JsonUtil.object2Json(ResultUtil.success(shUser));
    }
}
