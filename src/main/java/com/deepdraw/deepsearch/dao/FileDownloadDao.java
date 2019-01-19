package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.FileDownload;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 查询对应的上传文件
     * @return
     */
    List<FileDownload> selectFDS();

    /**
     * 查询对应文件的数量
     * @return
     */
    int selectCount();

    /**
     *查询排序第几到第几的数据 用于分页
     * @param number1
     * @param number2
     * @return
     */
    List<FileDownload> selectFDbyLimit(@Param("number1")Integer number1, @Param("number2")Integer number2);
}