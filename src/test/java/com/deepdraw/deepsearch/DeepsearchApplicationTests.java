package com.deepdraw.deepsearch;

import com.deepdraw.deepsearch.entity.ArticleInformation;
import com.deepdraw.deepsearch.service.ArticleInformationService;
import com.deepdraw.deepsearch.service.FileDownloadService;
import com.deepdraw.deepsearch.util.JsonUtil;
import com.deepdraw.deepsearch.util.ResultUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DeepsearchApplicationTests {


    /**
     * 文章资讯
     */
    @Autowired
    private ArticleInformationService articleInformationService;

    @Test
    public void contextLoads() {

        Integer id = 3;

        Map<Integer,ArticleInformation> map =  new HashMap<>();
        List<ArticleInformation> list = articleInformationService.selectBytitleS(null,null);
        if(list.size()==0){
           System.out.println("meiyoushuju");
        }
        Integer x = -1;
        Integer y = 0;
        for(ArticleInformation listNew:list){
            if(listNew.getSerialNumber().equals(id)){
                x = y;
            }
            map.put(y,listNew);
            y++;
        }

        if(x.equals(-1)){
            System.out.println("数据库没匹配该数据");
        }

        Map<String,ArticleInformation> maplist =  new HashMap<>();
        if(x==0){
            maplist.put("shang",null);
            maplist.put("now",map.get(x));
            if(y==0){
                maplist.put("xia",null);
            }else{
                maplist.put("xia",map.get(x+1));
            }
        }
        if(x>0){
            if(x.equals(y)){
                maplist.put("shang",map.get(x-1));
                maplist.put("now",map.get(x));
                maplist.put("xia",null);
            }else{
                maplist.put("shang",map.get(x-1));
                maplist.put("now",map.get(x));
                maplist.put("xia",map.get(x+1));
            }
        }

        System.out.println(maplist);
    }

}
