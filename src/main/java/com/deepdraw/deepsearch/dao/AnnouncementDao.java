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


    /**
     * 查询对应文件的数量 （公告）
     * @return
     */
    int selectCount();

    /**
     *查询排序第几到第几的数据 用于分页 （公告）
     * @param number1
     * @param number2
     * @return
     */
    List<Announcement> selectANbyLimit(@Param("number1")Integer number1, @Param("number2")Integer number2);
}