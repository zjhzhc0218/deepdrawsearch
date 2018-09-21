package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.Area;
import com.deepdraw.deepsearch.entity.Zyw;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ZywDaoTest {
    @Autowired
    private ZywDao zywDao;

    @Test
    public void queryArea() {
//        List<Zyw> zyws = zywDao.selectZyw();
//        System.out.print(zyws.toString());
//        assertEquals(2, zyws.size());

        Zyw zyw1 = zywDao.selectZywForname("zyw","8023777");
        System.out.println(zyw1.toString());
        if(zyw1!=null){
        System.out.println("成功");}
        System.out.println("2333");
    }

}