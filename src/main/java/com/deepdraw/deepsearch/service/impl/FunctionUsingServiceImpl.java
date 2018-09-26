package com.deepdraw.deepsearch.service.impl;

import com.deepdraw.deepsearch.dao.FunctionUsingDao;
import com.deepdraw.deepsearch.dao.SHUserDao;
import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.handler.ContextHolder;
import com.deepdraw.deepsearch.service.FunctionUsingService;
import com.deepdraw.deepsearch.service.SHUserService;
import com.deepdraw.deepsearch.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List<FunctionUsing> functionUsing = functionUsingDao.selectFTByuserId(userId);
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
}
