package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.ArticleInformation;

public interface ArticleInformationDao {
    /**
     *
     * @mbggenerated 2019-01-09
     */
    int deleteByPrimaryKey(Integer serialNumber);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int insert(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int insertSelective(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    ArticleInformation selectByPrimaryKey(Integer serialNumber);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int updateByPrimaryKeySelective(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int updateByPrimaryKeyWithBLOBs(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int updateByPrimaryKey(ArticleInformation record);
}