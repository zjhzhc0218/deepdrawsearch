package com.deepdraw.deepsearch.dao;


import com.deepdraw.deepsearch.entity.Downloads;

public interface DownloadsDao {
    /**
     *
     * @mbggenerated 2019-01-15
     */
    int deleteByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated 2019-01-15
     */
    int insert(Downloads record);

    /**
     *
     * @mbggenerated 2019-01-15
     */
    int insertSelective(Downloads record);

    /**
     *
     * @mbggenerated 2019-01-15
     */
    Downloads selectByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated 2019-01-15
     */
    int updateByPrimaryKeySelective(Downloads record);

    /**
     *
     * @mbggenerated 2019-01-15
     */
    int updateByPrimaryKey(Downloads record);

    /**
     * 次数叠加
     * @mbggenerated 2019-01-15
     */
    int updateByNumberAdd(Downloads record);


    /**
     * 将次数置0
     * @mbggenerated 2019-01-15
     */
    int updateByNumber();
}