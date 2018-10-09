package com.deepdraw.deepsearch.service.impl;

import com.deepdraw.deepsearch.dao.FunctionUsingDao;
import com.deepdraw.deepsearch.dao.SHUserDao;
import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.DateUtils;
import com.deepdraw.deepsearch.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.*;

@Component
public class FunctionUsingServiceImpl implements FunctionUsingService {

    @Autowired
    private FunctionUsingDao functionUsingDao;


    @Override
    public List<FunctionUsing> selectFT() {
        return functionUsingDao.selectFT();
    }

    @Override
    public Map<String, Object> selectFT(Long userId) {
        Map<String,Object> map =   new HashMap<>();
        List<FunctionUsing> functionUsing = functionUsingDao.selectFTByuserId(userId,null);
        if(functionUsing==null){
            map.put("message","该用户未使用过任何模块功能");
            return map;
        }else {
                map.put("message","查询成功，返回客户模块使用信息");
                map.put("FT",functionUsing);
                return map;

        }
    }

    @Override
    public String addFT(Integer  module) {
        FunctionUsing functionUsing = new FunctionUsing();
        SHUser shUser = ContextHolder.getSessionSHUser();
        functionUsing.setUserId(shUser.getId());
        functionUsing.setModule(module);
            try {
                functionUsingDao.addFT(functionUsing);
                String message = "恭喜您使用模块成功,新增对应使用记录";
                return message;
            } catch (Throwable throwable) {
                String message = "很遗憾模块使用记录未插入，因为其他原因";
                return message;
            }
        }

    @Override
    public List<FunctionUsing> selectFTByTime(Long id, Integer type, Integer module, Date timeStart, Date timeEnd) {
        List<FunctionUsing> functionUsings = new ArrayList<>();
        switch(type){
//            1表示前端传值，自己传起始时间跟截止时间
            case 1:
                functionUsings = functionUsingDao.selectFTByTime(id, module, timeStart, timeEnd);
                break;
//                2.表示当天的
            case 2:
                Timestamp timeStartD = new java.sql.Timestamp(DateUtils.getDayBegin().getTime());
                Timestamp timeEndD = new java.sql.Timestamp(DateUtils.getDayEnd().getTime());
                functionUsings = functionUsingDao.selectFTByTime(id, module, timeStartD, timeEndD);
                break;
//                3.表示当周的
            case 3:
                Timestamp timeStartW = new java.sql.Timestamp(DateUtils.getBeginDayOfWeek().getTime());
                Timestamp timeEndW = new java.sql.Timestamp(DateUtils.getEndDayOfWeek().getTime());
                functionUsings = functionUsingDao.selectFTByTime(id, module, timeStartW, timeEndW);
                break;
//                4.表示当月的
            case 4:
                Timestamp timeStartM = new java.sql.Timestamp(DateUtils.getBeginDayOfMonth().getTime());
                Timestamp timeEndM = new java.sql.Timestamp(DateUtils.getEndDayOfMonth().getTime());
                functionUsings = functionUsingDao.selectFTByTime(id, module, timeStartM, timeEndM);
                break;
//                5.表示当年的
            case 5:
                Timestamp timeStartY = new java.sql.Timestamp(DateUtils.getBeginDayOfYear().getTime());
                Timestamp timeEndY = new java.sql.Timestamp(DateUtils.getEndDayOfYear().getTime());
                functionUsings = functionUsingDao.selectFTByTime(id, module, timeStartY, timeEndY);
                break;
            default:
                if(id==null){
                    if(module==null){
                    functionUsings =  functionUsingDao.selectFT();}else{
                    functionUsings =functionUsingDao.selectFTByModule(module);
                    }
                }else{
                    functionUsings = functionUsingDao.selectFTByuserId(id,module);
                }
                break;
        }


        return functionUsings;
    }
}
