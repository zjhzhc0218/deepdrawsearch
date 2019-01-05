package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/1/4.
 */

import com.deepdraw.deepsearch.entity.FileDownload;
import org.springframework.stereotype.Service;

/**
 * @author
 * @create 2019-01-04 11:07
 **/
@Service
public interface FileDownloadService {

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
