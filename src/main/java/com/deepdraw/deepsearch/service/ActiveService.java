package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/2/13.
 */

import com.deepdraw.deepsearch.entity.Active;
import org.springframework.stereotype.Service;

/**
 * @author
 * @create 2019-02-13 20:37
 **/
@Service
public interface ActiveService {

    /**
     * 需要定时去调用 然后是对应的日活跃量的编写
     * @mbggenerated 2019-01-16
     */
    int insertNewDay();

}
