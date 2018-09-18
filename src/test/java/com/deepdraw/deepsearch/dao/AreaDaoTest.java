package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.Area;
import com.deepdraw.deepsearch.service.impl.AreaServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AreaDaoTest {
    @Autowired
    private AreaServiceImpl areaService;

    @Test
    public void queryArea() {
        List<Area> areas = areaService.queryArea();
        System.out.print(areas.toString());
        assertEquals(2, areas.size());
    }

}