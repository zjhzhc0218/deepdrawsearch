package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.MD5Util;
import com.deepdraw.deepsearch.util.ResultUtil;
import com.deepdraw.deepsearch.util.SixNumberRadom;
import jnr.ffi.annotations.In;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/functionUsing")
public class FunctionUsingControllers {


   private final static Logger logger =  LoggerFactory.getLogger(LoginUserControllers.class);

    @Autowired
    private FunctionUsingService functionUsingService;


    /** 获取后台所有的用户模块信息
     * * @return*/
    @RequestMapping("/getFT")
    @ResponseBody
    public Object getUsers(HttpServletRequest request, Long id, Integer module, Integer type ,String timeStart, String timeEnd) throws IOException {
        logger.info("id="+id+",timeStart="+timeStart+",timeEnd="+timeEnd);
        String message = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date timeStartN = null;
        Date timeEndN = null;

        if(type==1) {
            if (timeStart != null && timeEnd != null) {
                if (timeStart.length() != 0 && timeEnd.length() != 0) {
                    type = 1;
                    try {
                        timeStartN = sdf.parse(timeStart);
                        timeEndN = sdf.parse(timeEnd);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        Map<String,Object> maps = new HashMap<>();

        List<FunctionUsing> functionUsingsOne = functionUsingService.selectFTByTime(id,type,1,timeStartN,timeEndN);
        List<FunctionUsing> functionUsingsTwo = functionUsingService.selectFTByTime(id,type,2,timeStartN,timeEndN);
        List<FunctionUsing> functionUsingsTree = functionUsingService.selectFTByTime(id,type,3,timeStartN,timeEndN);
        List<FunctionUsing> functionUsingsFour = functionUsingService.selectFTByTime(id,type,4,timeStartN,timeEndN);
        List<FunctionUsing> functionUsingsFive = functionUsingService.selectFTByTime(id,type,5,timeStartN,timeEndN);

        maps.put("paiming",functionUsingsOne==null?0:functionUsingsOne.size());
        maps.put("weijinci",functionUsingsTwo==null?0:functionUsingsTwo.size());
        maps.put("xinyu",functionUsingsTree==null?0:functionUsingsTree.size());
        maps.put("reci",functionUsingsFour==null?0:functionUsingsFour.size());
        maps.put("jiangquan",functionUsingsFive==null?0:functionUsingsFive.size());
        Integer zongshu = (functionUsingsOne==null?0:functionUsingsOne.size())                  + (functionUsingsTwo==null?0:functionUsingsTwo.size())
                +(functionUsingsTree==null?0:functionUsingsTree.size())
                +(functionUsingsFour==null?0:functionUsingsFour.size())
                +(functionUsingsFive==null?0:functionUsingsFive.size());

        message = zongshu+"次";
        maps.put("count",message);
        return JsonUtil.object2Json(ResultUtil.success(maps));
    }


    /** 获取当前使用用户模块信息
     * * @return*/
    @RequestMapping("/getFTForUser")
    @ResponseBody
    public Object getFTForUser(HttpServletRequest request, Long id) throws IOException {
        Map<String,Object> maps = new HashMap<>();
        List<FunctionUsing> functionUsings= functionUsingService.selectFTByTime(id,6,null,null,null);
        Integer message = 0;
        if(functionUsings.size()!=0){
            message= functionUsings.size();
        }
        maps.put("count",message);
        return JsonUtil.object2Json(ResultUtil.success(maps));
    }

}
