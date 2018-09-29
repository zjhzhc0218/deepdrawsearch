package com.deepdraw.deepsearch.dao;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.FunctionUsing;
import com.deepdraw.deepsearch.entity.SHUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @author zyw
 * @create 2018-09-25 11:00
 * 用于调用对应的function_using 表的增删改查
 **/
@Component
public interface FunctionUsingDao {
    /**
     * 查找模块使用表是否有数据（查询所有，管理员权限查看）
     * @return
     */
    List<FunctionUsing> selectFT();

    /**
     * 查找某一模块使用表是否有数据
     * @return
     */
    List<FunctionUsing> selectFTByModule(@Param("module") Integer module);

    /**
     * 通过模块使用去查询对应数据 (用用户去查询对应的使用记录)
     * @param userId 用户id
     * @param module 模块
     * @return
     */
    List<FunctionUsing> selectFTByuserId(@Param("userId") Long userId,@Param("module") Integer module);

    /**
     * 新增用户模块使用
     * @param functionUsing  用户模块使用实体类
     */
    Integer addFT(FunctionUsing functionUsing);

    /**
     * 统计某个时间段的用户模块使用数据，当天，几天内，某个时间段都按照这个接口来实现
     * @param timeStart 其实时间
     * @param timeEnd 截止时间
     * @return
     */
    /**
     * 统计某个时间段的用户模块使用数据，当天，几天内，某个时间段都按照这个接口来实现
     * @param userId 用户id
     * @param module 用户使用的模块
     * @param timeStart 起始时间
     * @param timeEnd 结束时间
     * @return
     */
    List<FunctionUsing> selectFTByTime(@Param("userId") Long userId,@Param("module") Integer module,@Param("timeStart") Date timeStart, @Param("timeEnd") Date timeEnd);

}
