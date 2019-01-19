package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/1/4.
 */

import com.deepdraw.deepsearch.entity.FileDownload;
import jnr.ffi.annotations.In;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    /**
     * 查询对应的上传文件
     * @return
     */
    List<FileDownload> selectFDS();


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
    List<FileDownload> selectPage(Integer p,Integer num);

}
