package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.util.JavaToPython;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 查询控制器
 */
@RestController
public class searchControllers {

    @Value("${python.path}")
    private String pythonPath;
    /**
     * 调用python返回违禁词数据
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchWjc")
    public String  findOneUser(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/text2.py", word };
        return JsonUtil.object2Json(ResultUtil.success(JavaToPython.getPython(args)));
    }

    /**
     * 调用python返回信誉数据
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchXinyu")
    public String  getSearchXinyu(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/text3.py", word};
        String result = JavaToPython.getPython(args);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"该号不存在，请检测是否输入有误"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回降权数据
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchJiangQuan")
    public String  getSearchJiangQuan(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String isNormal = request.getParameter("isNormal");
        String[]  args = new String[] { "python", pythonPath+"/text1.py", word,isNormal};
        String result = JavaToPython.getPython(args);
        if (result!=null && result.equals("002"))
            return JsonUtil.object2Json(ResultUtil.error(1,"没有获取到此用户的宝贝信息！请稍后重试，谢谢！"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回排名数据
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchPaiming")
    public String  getSearchPaiming(HttpServletRequest request){
        String keyWords =  request.getParameter("keyWords");
        String tbaoId = request.getParameter("tbaoId");
        String[]  args = new String[] { "python", pythonPath+"/text4_bRanking.py", keyWords,tbaoId};
        String result = JavaToPython.getPython(args);
        if (result!=null && result.equals("003"))
            return JsonUtil.object2Json(ResultUtil.error(1,"您查询的宝贝不存在"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

}
