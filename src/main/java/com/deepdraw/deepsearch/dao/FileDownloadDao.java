package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.FileDownload;

public interface FileDownloadDao {
    /**
     *
     * @mbggenerated 2019-01-04
     */
    int deleteByPrimaryKey(Integer fileId);

    /**
     *
     * @mbggenerated 2019-01-04
     */
    int insert(FileDownload record);

    /**
     *
     * @mbggenerated 2019-01-04
     */
    int insertSelective(FileDownload record);

    /**
     *
     * @mbggenerated 2019-01-04
     */
    FileDownload selectByPrimaryKey(Integer fileId);

    /**
     *
     * @mbggenerated 2019-01-04
     */
    int updateByPrimaryKeySelective(FileDownload record);

    /**
     *
     * @mbggenerated 2019-01-04
     */
    int updateByPrimaryKey(FileDownload record);
}