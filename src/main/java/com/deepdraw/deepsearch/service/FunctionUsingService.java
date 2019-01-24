package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    /**
     * 统计某个时间段的用户注册数据，当天，几天内，某个时间段都按照这个接口来实现(详细)
     * @param type 类型(1.前端传起始时间跟截止时间，2.当天，3.当周，4.当月，5.当年)
     *  @param module 对应模块
     * @param timeStart 起始时间
     * @param timeEnd 截止时间
     * @return
     */
    List<FunctionUsing> selectFTByTime(Long id, Integer type,Integer module , Date timeStart, Date timeEnd);

    /**
     * 统计某个时间段的用户注册数据，当天，几天内，某个时间段都按照这个接口来实现(简单查询到对应数据)
     * @param type 类型(1.前端传起始时间跟截止时间，2.当天，3.当周，4.当月，5.当年)
     *  @param module 对应模块
     * @param timeStart 起始时间
     * @param timeEnd 截止时间
     * @return
     */
    Integer selectFTByTimeCount(Long id, Integer type,Integer module , Date timeStart, Date timeEnd);

}
