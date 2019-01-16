package com.deepdraw.deepsearch.dao;


import com.deepdraw.deepsearch.entity.Announcement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface AnnouncementDao {
    /**
     *
     * @mbggenerated 2019-01-16
     */
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated 2019-01-16
     */
    int insert(Announcement record);

    /**
     *
     * @mbggenerated 2019-01-16
     */
    int insertSelective(Announcement record);

    /**
     *
     * @mbggenerated 2019-01-16
     */
    Announcement selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated 2019-01-16
     */
    int updateByPrimaryKeySelective(Announcement record);

    /**
     *
     * @mbggenerated 2019-01-16
     */
    int updateByPrimaryKey(Announcement record);

    /**
     * 根据标题查询对应内容 不然全查
     * @mbggenerated 2019-01-16
     */
    List<Announcement> selectBytitleS(@Param("title")String title);
}