package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/1/16.
 */

import com.deepdraw.deepsearch.entity.Announcement;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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


    /**
     * 查询对应的page分页信息
     （count   总条数
     pageCount  页数
     pin 1/有分页  0/没分页）
     * @param num
     * @return
     */
    Map<String,Integer> page(Integer num);

    /**
     * 查询对应page数据的内容
     * @param p
     * @param num
     * @return
     */
    List<Announcement> selectPage(Integer p, Integer num);
}
