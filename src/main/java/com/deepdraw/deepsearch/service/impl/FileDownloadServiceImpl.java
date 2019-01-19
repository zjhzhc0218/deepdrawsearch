package com.deepdraw.deepsearch.service.impl;/**
 * Created by hasee on 2019/1/4.
 */

import com.deepdraw.deepsearch.dao.FileDownloadDao;
import com.deepdraw.deepsearch.entity.FileDownload;
import com.deepdraw.deepsearch.service.FileDownloadService;
import jnr.ffi.annotations.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @create 2019-01-04 11:08
 **/
@Component
public class FileDownloadServiceImpl implements FileDownloadService{

    @Autowired
    private FileDownloadDao fileDownloadDao;

    @Override
    public int deleteByPrimaryKey(Integer fileId) {
        return fileDownloadDao.deleteByPrimaryKey(fileId);
    }

    @Override
    public int insert(FileDownload record) {
        return fileDownloadDao.insert(record);
    }

    @Override
    public int insertSelective(FileDownload record) {
        return fileDownloadDao.insertSelective(record);
    }

    @Override
    public FileDownload selectByPrimaryKey(Integer fileId) {
        return fileDownloadDao.selectByPrimaryKey(fileId);
    }

    @Override
    public int updateByPrimaryKeySelective(FileDownload record) {
        return fileDownloadDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(FileDownload record) {
        return fileDownloadDao.updateByPrimaryKey(record);
    }

    @Override
    public List<FileDownload> selectFDS() {
        return fileDownloadDao.selectFDS();
    }

    @Override
    public Map<String, Integer> page(Integer num) {
        Map<String, Integer> map = new HashMap<>();
        Integer count = fileDownloadDao.selectCount();
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
    public List<FileDownload> selectPage(Integer p, Integer num) {
        Integer number1 = num*(p-1);
        Integer number2 = num*p;
        return fileDownloadDao.selectFDbyLimit(number1,number2);
    }
}
