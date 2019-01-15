package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/1/15.
 */

import com.deepdraw.deepsearch.entity.Downloads;
import org.springframework.stereotype.Service;

/**
 * @author
 * @create 2019-01-15 0:43
 **/
@Service
public interface DownloadsService {

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
     * 将次数置0
     * @mbggenerated 2019-01-15
     */
    int updateByNumber();

    /**
     * 判断是否可以下载（0不行 1可以）
     * @param id
     * @return
     */
    int judee(Long id);

    /**
     * 下载成功次数+1（0不行 1可以）
     * @param id
     * @return
     */
    int judeeByid(Long id);

}
