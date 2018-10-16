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

        if(timeStart!=null &&timeEnd!=null ){
            if(type==null){
                type=99;
            }
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
        List<FunctionUsing> functionUsings = functionUsingService.selectFTByTime(id,type,module,timeStartN,timeEndN);
//        maps.put("FT",functionUsings);
//        message = "本次模块使用查询，总共查询到"+functionUsings.size()+"条记录";
        message = functionUsings.size()+"次";
        maps.put("count",message);
        return JsonUtil.object2Json(ResultUtil.success(maps));
    }


}
