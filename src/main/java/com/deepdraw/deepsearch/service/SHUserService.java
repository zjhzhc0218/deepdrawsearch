package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.SHUser;
import org.springframework.stereotype.Service;

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
    Map<String,Object> selectUser(String id, String password);

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
}
