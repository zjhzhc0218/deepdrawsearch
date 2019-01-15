package com.deepdraw.deepsearch.service.impl;/**
 * Created by hasee on 2019/1/15.
 */

import com.deepdraw.deepsearch.dao.DownloadsDao;
import com.deepdraw.deepsearch.dao.FunctionUsingDao;
import com.deepdraw.deepsearch.entity.Downloads;
import com.deepdraw.deepsearch.service.DownloadsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author
 * @create 2019-01-15 0:43
 **/
@Component
public class DownloadsServiceImpl implements DownloadsService {

    @Autowired
    private DownloadsDao downloadsDao;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return downloadsDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Downloads record) {
        return downloadsDao.insert(record);
    }

    @Override
    public int insertSelective(Downloads record) {
        return downloadsDao.insertSelective(record);
    }

    @Override
    public Downloads selectByPrimaryKey(Long id) {
        return downloadsDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Downloads record) {
        return downloadsDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Downloads record) {
        return downloadsDao.updateByPrimaryKey(record);
    }

    @Override
    public int updateByNumber() {
        return downloadsDao.updateByNumber();
    }

    @Override
    public int judee(Long id) {
        Downloads downloads = downloadsDao.selectByPrimaryKey(id);
        if (downloads == null){
            Downloads downloadNew = new Downloads();
            downloadNew.setId(id);
            downloadNew.setNumber(0);
            downloadsDao.insertSelective(downloadNew);
            return 1;
        }else{
            Integer y = downloads.getNumber();
            if(y<2){
                return 1;
            }
        }
        return 0;
    }

    /**
     * 下载成功 次数+1
     * @param id
     * @return
     */
    @Override
    public int judeeByid(Long id) {
        Downloads downloads = downloadsDao.selectByPrimaryKey(id);
        return downloadsDao.updateByNumberAdd(downloads);
    }


}
