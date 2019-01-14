package com.deepdraw.deepsearch.service;/**
 * Created by hasee on 2019/1/9.
 */

import com.deepdraw.deepsearch.entity.ArticleInformation;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author
 * @create 2019-01-09 14:50
 **/
@Service
public interface ArticleInformationService {

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int deleteByPrimaryKey(Integer serialNumber);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int insert(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int insertSelective(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    ArticleInformation selectByPrimaryKey(Integer serialNumber);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int updateByPrimaryKeySelective(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int updateByPrimaryKeyWithBLOBs(ArticleInformation record);

    /**
     *
     * @mbggenerated 2019-01-09
     */
    int updateByPrimaryKey(ArticleInformation record);

    /**
     * 根据对应标题关键词跟类型查询数据
     * @mbggenerated 2019-01-09
     */
    List<ArticleInformation> selectBytitleS(String title, Integer typeN);
}
