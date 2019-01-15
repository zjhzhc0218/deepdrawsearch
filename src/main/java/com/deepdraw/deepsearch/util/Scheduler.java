package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2019/1/15.
 */

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author
 * @create 2019-01-15 1:33
 **/

@Component
public class Scheduler {

    @Scheduled(cron="0 0/1 * * * ?") //每分钟执行一次
    public void statusCheck() {
       System.out.println("------123----");

        System.out.println("------321----");
    }

    @Scheduled(fixedRate=20000)
    public void testTasks() {
        System.out.println("每20秒执行一次。开始……");
        //statusTask.healthCheck();
        System.out.println("每20秒执行一次。结束。");
    }


}
