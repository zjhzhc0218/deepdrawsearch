package com.deepdraw.deepsearch.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 通过runningtime调用python方法
 */
public class JavaToPython {

    public static String  getPython(String[] args) {
        {
            String newStr = null;
            try {
                Process proc=Runtime.getRuntime().exec(args); //执行py文件
                InputStreamReader isr;
                BufferedReader in;
                //设置编码方式，否则输出中文时容易乱码
                isr = new InputStreamReader(proc.getInputStream(), "GBK");
                in = new BufferedReader(isr);
                String line;
                while ((line = in.readLine()) != null) {
                    newStr = new String(line.getBytes(), "UTF-8");
                    System.out.println("newStr-------"+newStr);
                }
                in.close();
                proc.waitFor();
            } catch (IOException e) {
                e.printStackTrace();
                return JsonUtil.object2Json(ResultUtil.error(-1,"查询出错"));
            } catch (InterruptedException e) {
                e.printStackTrace();
                return JsonUtil.object2Json(ResultUtil.error(-1,"查询出错"));
            }
            //String words = newStr.replace(".", "#");
            return newStr;
        }
    }

}
