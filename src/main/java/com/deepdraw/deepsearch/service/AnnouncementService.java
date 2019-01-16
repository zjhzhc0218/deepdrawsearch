package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/1/16.
 */

import com.deepdraw.deepsearch.entity.Announcement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author
 * @create 2019-01-16 0:55
 **/
@Service
public interface AnnouncementService {
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
    List<Announcement> selectBytitleS(String title);
}
