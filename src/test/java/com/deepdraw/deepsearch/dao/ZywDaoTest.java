package com.deepdraw.deepsearch.dao;

import com.deepdraw.deepsearch.entity.SHUser;
import com.deepdraw.deepsearch.util.PhoneUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;


@RunWith(SpringRunner.class)
@SpringBootTest
public class ZywDaoTest {


    @Autowired
    private SHUserDao shUserDao;

    @Test
    public void queryArea() throws Exception {

        List<SHUser> shUserList =  shUserDao.selectUser();

        for(SHUser shUserListNew:shUserList){
            Long id =shUserListNew.getId();
            String address = PhoneUtil.getMobileAddressByBaiDu(id.toString());
            shUserListNew.setNickname(address);
            shUserDao.updateUser(shUserListNew);
        }

    }



}