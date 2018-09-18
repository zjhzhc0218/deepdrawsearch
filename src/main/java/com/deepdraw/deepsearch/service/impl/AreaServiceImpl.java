package com.deepdraw.deepsearch.service.impl;

import com.deepdraw.deepsearch.dao.AreaDao;
import com.deepdraw.deepsearch.entity.Area;
import com.deepdraw.deepsearch.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Qualifier("areaDao")
    @Autowired private AreaDao areaDao;


    @Transactional(value="mysqlTransactionManager")
    @Override
    public List<Area> queryArea() {
        return areaDao.queryArea();
    }
}
