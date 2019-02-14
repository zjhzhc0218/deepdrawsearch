package com.deepdraw.deepsearch.dao;


import com.deepdraw.deepsearch.entity.Active;
import org.springframework.stereotype.Component;

@Component
public interface ActiveDao {
    /**
     *
     * @mbggenerated 2019-02-13
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 在用
     * @mbggenerated 2019-02-13
     */
    int insert(Active record);

    /**
     *
     * @mbggenerated 2019-02-13
     */
    int insertSelective(Active record);

    /**
     *
     * @mbggenerated 2019-02-13
     */
    Active selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated 2019-02-13
     */
    int updateByPrimaryKeySelective(Active record);

    /**
     *
     * @mbggenerated 2019-02-13
     */
    int updateByPrimaryKey(Active record);
}