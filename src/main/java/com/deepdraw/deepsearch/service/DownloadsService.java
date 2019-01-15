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

}
