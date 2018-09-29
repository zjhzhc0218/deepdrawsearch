package com.deepdraw.deepsearch.dao;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.SHUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @author zyw
 * @create 2018-09-25 11:00
 * 用于调用对应的shenhui_user 表的增删改查
 **/
@Component
public interface SHUserDao {
    /**
     * 查找用户表内是否有数据（查询所有，管理员权限查看）
     * @return
     */
    List<SHUser> selectUser();

    /**
     * 通过账号去查询对应数据 (1.用户id是否重复 2.验证密码是否一样)
     * @param id
     * @return
     */
    SHUser selectUserById(@Param("id") Long id);

    /**
     * 新增用户
     * @param user  用户实体类
     * @return 返回对应用户的id
     */
    Integer addUser(SHUser user);

    /**
     * 修改用户密码
     * @param user 用户实体类
     * @return
     */
    Integer updateUser(SHUser user);

    /**
     * 统计某个时间段的用户注册数据，当天，几天内，某个时间段都按照这个接口来实现
     * 该接口跟查询用户信息合并，所以返回值为一个list，传入值做改变
     * @param id
     * @param timeStart
     * @param timeEnd
     * @return
     */
    List<SHUser> selectUserByTime(@Param("id") Long id,@Param("timeStart") Date timeStart, @Param("timeEnd") Date timeEnd);


}
