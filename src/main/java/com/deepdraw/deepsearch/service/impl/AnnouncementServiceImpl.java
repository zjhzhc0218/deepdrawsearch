package com.deepdraw.deepsearch.service.impl;/**
 * Created by hasee on 2019/1/16.
 */

import com.deepdraw.deepsearch.dao.AnnouncementDao;
import com.deepdraw.deepsearch.dao.AreaDao;
import com.deepdraw.deepsearch.entity.Announcement;
import com.deepdraw.deepsearch.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @create 2019-01-16 0:55
 **/
@Component
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementDao announcementDao;



    @Override
    public int deleteByPrimaryKey(Integer id) {
        return announcementDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Announcement record) {
        return announcementDao.insert(record);
    }

    @Override
    public int insertSelective(Announcement record) {
        return announcementDao.insertSelective(record);
    }

    @Override
    public Announcement selectByPrimaryKey(Integer id) {
        return announcementDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Announcement record) {
        return announcementDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Announcement record) {
        return announcementDao.updateByPrimaryKey(record);
    }

    @Override
    public List<Announcement> selectBytitleS(String title) {
        return announcementDao.selectBytitleS(title);
    }

    @Override
    public Map<String, Integer> page(Integer num) {
        Map<String, Integer> map = new HashMap<>();
        Integer count = announcementDao.selectCount();
        Integer pageCount = count%num==0?count/num:count/num+1;
        Integer pin = 0;
        if(pageCount == 1 && count%num==0){
            pin = 0;
        }
        if(pageCount>1) {
            pin = 1;
        }
        map.put("count",count);
        map.put("pageCount",pageCount);
        map.put("pin",pin);
        return map;
    }

    @Override
    public List<Announcement> selectPage(Integer p, Integer num) {
        Integer number1 = num*(p-1);
        Integer number2 = num*p;
        return announcementDao.selectANbyLimit(number1,number2);
    }
}
