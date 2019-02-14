package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2019/1/15.
 */

import com.deepdraw.deepsearch.dao.DownloadsDao;
import com.deepdraw.deepsearch.service.ActiveService;
import com.deepdraw.deepsearch.service.DownloadsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author
 * @create 2019-01-15 1:33
 **/

@Component
public class Scheduler {


    @Autowired
    private DownloadsService downloadsService;

    @Autowired
    private ActiveService activeService;

    @Scheduled(cron="0 0 0 * * ?") //每天凌晨执行一次
    public void statusCheck() {
       System.out.println("------123----");
        downloadsService.updateByNumber();
        activeService.insertNewDay();
        System.out.println("------321----");
    }

//    @Scheduled(fixedRate=20000)
//    public void testTasks() {
//        System.out.println("每20秒执行一次。开始……");
//        activeService.insertNewDay();
//        System.out.println("每20秒执行一次。结束。");
//    }

//    @Scheduled(cron="0 0 0 * * ？") //每24点执行一次
//    public void statusCheckTime() {
//        downloadsService.updateByNumber();
//    }


}
