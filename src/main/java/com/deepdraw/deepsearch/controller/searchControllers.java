package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.util.JavaToPython;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class searchControllers {


    /**
     * 调用python返回违禁词数据
     * @param request
     * @param response
     * @return
     */
    @GetMapping(value="/getSearchWjc")
    public String  findOneUser(HttpServletRequest request,HttpServletResponse response){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", "C:/Users/hc/Desktop/saas/text2.py", word };
        return JsonUtil.object2Json(ResultUtil.success(JavaToPython.getPython(args)));
    }

    /**
     * 调用python返回信誉数据
     * @param request
     * @param response
     * @return
     */
    @GetMapping(value="/getSearchXinyu")
    public String  getSearchXinyu(HttpServletRequest request,HttpServletResponse response){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", "C:/Users/hc/Desktop/saas/text3.py", word};
        String result = JavaToPython.getPython(args);
        if (result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"'该号不存在，请检测是否输入有误'"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }


}
