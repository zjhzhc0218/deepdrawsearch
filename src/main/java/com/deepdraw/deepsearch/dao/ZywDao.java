package com.deepdraw.deepsearch.dao;/**
 * Created by hasee on 2018/9/18.
 */

import com.deepdraw.deepsearch.entity.Zyw;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author
 * @create 2018-09-18 16:58
 * 用于调用对应的zyw_user 表的增删改查
 **/
@Component
public interface ZywDao {
    /**
     * 单纯的查找
     * @return
     */
    List<Zyw> selectZyw();

    /**
     * 通过账号密码去查询对应数据
     * @param name
     * @param password
     * @return
     */
    Zyw selectZywForname(@Param("name")String name,@Param("password")String password);

    /**
     * 新增用户
     * @param zyw  用户实体类
     * @return 返回对应用户的id
     */
    Integer addZyw(Zyw zyw);

    /**
     * 修改用户密码
     * @param zyw 用户实体类
     * @return
     */
    Integer updateZyw(Zyw zyw);

}
