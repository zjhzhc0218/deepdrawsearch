package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.exception.GlobalException;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.util.CodeMsg;
import com.deepdraw.deepsearch.util.JavaToPython;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 查询控制器
 */
@RestController
public class SearchControllers {

    @Value("${python.path}")
    private String pythonPath;

    @Autowired
    private FunctionUsingService functionUsingService;

    /**
     * 调用python返回违禁词数据
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchWjc")
    public String  findOneUser(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/dangerous_words.py", word };
        functionUsingService.addFT(2);
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
        String[]  args = new String[] { "python", pythonPath+"/credit_taodaxiang.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(3);
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
        String[]  args = new String[] { "python", pythonPath+"/down_right_kdb.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(5);
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
        String[]  args = new String[] { "python", pythonPath+"/ranking.py", keyWords,tbaoId};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(1);
        if (result!=null && result.equals("003"))
            return JsonUtil.object2Json(ResultUtil.error(1,"亲,没有您家的宝贝！"));
        if (result!=null && result.equals("004"))
            return JsonUtil.object2Json(ResultUtil.error(1,"服务器异常，请重试"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回排名数据（免费）
     * @param request
     * @return
     */
    @GetMapping(value="/getFreeSearchPaiming")
    public String  getFreeSearchPaiming(HttpServletRequest request){
        String keyWords =  request.getParameter("keyWords");
        String tbaoId = request.getParameter("tbaoId");
        String[]  args = new String[] { "python", pythonPath+"/text4_bRanking_query.py", keyWords,tbaoId};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        if (result!=null && result.equals("003"))
            return JsonUtil.object2Json(ResultUtil.error(1,"亲！前十页没有您的宝贝..."));
        if (result!=null && result.equals("004"))
            return JsonUtil.object2Json(ResultUtil.error(1,"服务器异常，请重试"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 记入热词操作数
     */
    @GetMapping(value="/setReciRecord")
    public void  setReciRecord(){
          functionUsingService.addFT(4);
    }


    /**
     * 调用python返回动态评分数据
     * @param request
     * @return
     */
    @GetMapping(value="/searchPingfeng")
    public String  searchPingfeng(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/score.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(6);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"可能您查询的淘宝账号还没有在淘宝开店！"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }




}
