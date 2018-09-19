package com.deepdraw.deepsearch.service.impl;

import com.deepdraw.deepsearch.dao.AreaDao;
import com.deepdraw.deepsearch.entity.Area;
import com.deepdraw.deepsearch.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaDao areaDao;


    @Transactional(value="mysqlTransactionManager")
    @Override
    public List<Area> queryArea() {
        return areaDao.queryArea();
    }
}
