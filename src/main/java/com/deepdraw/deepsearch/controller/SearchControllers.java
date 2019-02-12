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
        String[]  args = new String[] { "python", pythonPath+"/weijin.py", word };
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
            return JsonUtil.object2Json(ResultUtil.error(1,"输入的旺旺账号不存在或该旺旺未上传宝贝！或因淘宝封店和降权处罚等原因无法查询。"));
        if (result!=null && result.equals("003"))
            return JsonUtil.object2Json(ResultUtil.error(1,"当前店铺无降权信息！"));
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


    /**
     * 调用python返回淘宝目录查询
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchMulu")
    public String  getSearchMulu(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/leimu.py", word };
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(7);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"未查询到该宝贝的类目信息！"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回指数数据
     * @param request
     * @return
     */
    @GetMapping(value="/searchZhishu")
    public String  searchZhishu(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String type =  request.getParameter("type");
        String[]  args = new String[] { "python", pythonPath+"/hand_query.py", type,word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(9);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"可能您查询的淘宝账号还没有在淘宝开店！"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回淘宝上下架查询
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchShangxiajia")
    public String  getSearchShangxiajia(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/up_down.py", word };
        functionUsingService.addFT(8);
        return JsonUtil.object2Json(ResultUtil.success(JavaToPython.getPython(args)));
    }


    /**
     * 调用python返回淘宝下拉框选词
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchXialakuangxuanci")
    public String  getSearchXialakuangxuanci(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/down_ci.py", word };
        functionUsingService.addFT(11);
        return JsonUtil.object2Json(ResultUtil.success(JavaToPython.getPython(args)));
    }

    /**
     * 调用python返回展现数据
     * @param request
     * @return
     */
    @GetMapping(value="/searchZhanXian")
    public String  searchZhanXian(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/zhanxian.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(10);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"暂未查询到该宝贝有关键词展现，请继续优化哦。"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回历史查询数据
     * @param request
     * @return
     */
    @GetMapping(value="/getSearchhistory")
    public String  getSearchhistory(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/lishi_pirce.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(14);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"暂未查询到该宝贝有信息，请继续优化哦。"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

    /**
     * 调用python返回直通车查询数据
     * @param request
     * @return
     */
    @GetMapping(value="/getZtongCar")
    public String  getZtongCar(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/ztong_car.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(12);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"暂未查询到该宝贝有信息，请继续优化哦。"));
        return JsonUtil.object2Json(ResultUtil.success(result));
      /*  Map<String, List<ZtongChe>> map = new HashMap<>();
        String regexp = "\'";
        String res = result.replaceAll(regexp, "\"");
        List<ZtongChe> list = JsonUtil.jsonToObject(res, List.class,ZtongChe.class);
        ZtongChe iot = null;
        for (int j = 0; j < list.size(); j++) {
            iot = (ZtongChe)list.get(j);
            //System.out.println();
            if (map.containsKey(iot.getTuijian())) {
                List<ZtongChe> li = map.get(iot.getTuijian());
                li.add(iot);
                map.put(iot.getTuijian(),li);
            }else {
                List<ZtongChe> li = new ArrayList<ZtongChe>();
                li.add(iot);
                map.put(iot.getTuijian(),li);
            }
        }*/

    }

    /**
     * 调用python返回标题诊断查询数据
     * @param request
     * @return
     */
    @GetMapping(value="/getTitleYH")
    public String  getTitleYH(HttpServletRequest request){
        String word =  request.getParameter("searchWords");
        String[]  args = new String[] { "python", pythonPath+"/title_youhua.py", word};
        String result = JavaToPython.getPython(args);
        if (result == null)
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        functionUsingService.addFT(13);
        if (result!=null && result.equals("001"))
            return JsonUtil.object2Json(ResultUtil.error(1,"暂未查询到该宝贝有信息，请继续优化哦。"));
        return JsonUtil.object2Json(ResultUtil.success(result));
    }

}
