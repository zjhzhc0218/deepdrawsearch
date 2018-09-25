package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2018/9/25.
 */

/**
 * 生成6位的随机字符串 ,用于数据库密码二次加密 这里是6位，可以按需要进行扩充
 * @author zyw
 * @create 2018-09-25 14:19
 **/
public class SixNumberRadom {

    /**
     * @param
     */
    public static String getSixNumberRadom(){
        String result="";
        for(int i=0;i<6;i++){
            int intVal=(int)(Math.random()*26+97);
            result=result+(char)intVal;
        }
        System.out.print(result);
        return result;
    }

}
