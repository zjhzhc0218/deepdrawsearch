package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.SHUser;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author zyw
 * @create 2018-09-25 11:12
 **/
@Service
public interface SHUserService {

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
    Map<String,Object> selectUser(Long id, String password);

    /**
     * 新增用户
     * @param user  用户实体类
     * @return 返回对应用户的id
     */
    String addUser(SHUser user);

    /**
     * 修改用户密码
     * @param user 用户实体类
     * @return
     */
    String updateUser(SHUser user,String passwordAgain);



    /**
     * 统计某个时间段的用户注册数据，当天，几天内，某个时间段都按照这个接口来实现
     * @param type 类型(1.前端传起始时间跟截止时间，2.当天，3.当周，4.当月，5.当年)
     * @param timeStart 起始时间
     * @param timeEnd 截止时间
     * @return
     */
    List<SHUser> selectUserByTime(Long id,Integer type, Date timeStart, Date timeEnd);

    /**
     * 修改用户登录是否禁用或者恢复启用
     * @param id 用户id
     * @param type（1表示启用 2表示禁用）
     * @return
     */
    String banChange( Long id, Integer type);

    /**
     * 一键重置用户密码，初始密码为123456，并且分配自动生成的salt值
     * @param id 用户名
     * @param password 用户密码
     * @param salt 用户生成的salt值
     * @return
     */
    String resetpassword( Long id, String password, String salt);
}
