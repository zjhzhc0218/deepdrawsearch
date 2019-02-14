package com.deepdraw.deepsearch.service.impl;/**
 * Created by hasee on 2019/2/13.
 */

import com.deepdraw.deepsearch.dao.ActiveDao;
import com.deepdraw.deepsearch.dao.SHUserDao;
import com.deepdraw.deepsearch.entity.Active;
import com.deepdraw.deepsearch.service.ActiveService;
import jnr.ffi.annotations.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author
 * @create 2019-02-13 20:40
 **/
@Component
public class ActiveServiceImpl implements ActiveService{

    @Autowired
    private SHUserDao shUserDao;

    @Autowired
    private ActiveDao activeDao;

    @Override
    public int insertNewDay() {
        Active active = new Active();

        Integer numer = shUserDao.selectCountByLastTime();
        active.setNumer(numer);

        return activeDao.insert(active);
    }
}
