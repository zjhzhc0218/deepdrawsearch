package com.deepdraw.deepsearch.service.impl;/**
 * Created by hasee on 2019/1/4.
 */

import com.deepdraw.deepsearch.dao.FileDownloadDao;
import com.deepdraw.deepsearch.entity.FileDownload;
import com.deepdraw.deepsearch.service.FileDownloadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

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
}
