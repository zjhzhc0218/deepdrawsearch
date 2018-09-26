package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author zyw
 * @create 2018-09-25 11:12
 **/
@Service
public interface FunctionUsingService {

    /**
     * 查找模块使用表是否有数据（查询所有，管理员权限查看）
     * @return
     */
    List<FunctionUsing> selectFT();

    /**
     *  通过模块使用去查询对应数据 (用用户去查询对应的使用记录)
     * @param userId
     * @return
     */
    Map<String,Object> selectFT(Long userId);

    /**
     * 新增用户模块使用记录
     * @param module  用户模块
     * @return 返回对应用户的id
     */
    String addFT(Integer module);

}
