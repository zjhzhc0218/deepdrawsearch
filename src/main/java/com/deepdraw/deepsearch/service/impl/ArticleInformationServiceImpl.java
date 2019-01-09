package com.deepdraw.deepsearch.service.impl;/**
 * Created by hasee on 2019/1/9.
 */

import com.deepdraw.deepsearch.dao.ArticleInformationDao;
import com.deepdraw.deepsearch.entity.ArticleInformation;
import com.deepdraw.deepsearch.service.ArticleInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author
 * @create 2019-01-09 15:17
 **/
@Component
public class ArticleInformationServiceImpl  implements ArticleInformationService{

    @Autowired
    private ArticleInformationDao articleInformationDao;

    @Override
    public int deleteByPrimaryKey(Integer serialNumber) {
        return articleInformationDao.deleteByPrimaryKey(serialNumber);
    }

    @Override
    public int insert(ArticleInformation record) {
        return articleInformationDao.insert(record);
    }

    @Override
    public int insertSelective(ArticleInformation record) {
        return articleInformationDao.insertSelective(record);
    }

    @Override
    public ArticleInformation selectByPrimaryKey(Integer serialNumber) {
        return articleInformationDao.selectByPrimaryKey(serialNumber);
    }

    @Override
    public int updateByPrimaryKeySelective(ArticleInformation record) {
        return articleInformationDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(ArticleInformation record) {
        return articleInformationDao.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(ArticleInformation record) {
        return articleInformationDao.updateByPrimaryKey(record);
    }
}
