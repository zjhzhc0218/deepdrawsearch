package com.deepdraw.deepsearch.controller;

import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.enums.SearchEnums;
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
    @RequestMapping("/getFTCount")
    @ResponseBody
    public Object getUsers(HttpServletRequest request, Long id, Integer module, Integer type ,String timeStart, String timeEnd) throws IOException {
        logger.info("id="+id+",timeStart="+timeStart+",timeEnd="+timeEnd);
        String message = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date timeStartN = null;
        Date timeEndN = null;

        if(type==99) {
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
        Integer zongshuN = 0;
        Map<Integer,String> map = SearchEnums.getMaps();
        for(Integer in:map.keySet()){
            List<FunctionUsing> functionUsings = functionUsingService.selectFTByTime(id,type,in,timeStartN,timeEndN);
            maps.put(map.get(in),functionUsings==null?0:functionUsings.size());
            zongshuN = zongshuN + ((functionUsings==null?0:functionUsings.size()));
        }
        message = zongshuN+"次";
        maps.put("count",message);
        return JsonUtil.object2Json(ResultUtil.success(maps));
    }

    /** 获取后台所有的用户模块信息【仅仅查询对应次数】
     * * @return*/
    @RequestMapping("/getFT")
    @ResponseBody
    public Object getFTCount(HttpServletRequest request, Long id, Integer module, Integer type ,String timeStart, String timeEnd) throws IOException {
        logger.info("id="+id+",timeStart="+timeStart+",timeEnd="+timeEnd);
        String message = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date timeStartN = null;
        Date timeEndN = null;

        if(type==99) {
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
        Integer zongshuN = 0;
        Map<Integer,String> map = SearchEnums.getMaps();
        for(Integer in:map.keySet()){
            Integer functionUsings = functionUsingService.selectFTByTimeCount(id,type,in,timeStartN,timeEndN);
            maps.put(map.get(in),functionUsings);
            zongshuN = zongshuN + ((functionUsings));
        }
        message = zongshuN+"次";
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
