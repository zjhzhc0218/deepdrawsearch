package com.deepdraw.deepsearch.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 调用api接口对数据进行md5加密处理 2-14  用于流量网站
 * 何川
 */
public class MD5Utils {
    /*
     * 加密算法
     */
    public static String encodeMD5UpperCase32(String text){

        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");

            // 使用指定的字节更新摘要  --补充
//            digest.update(text.getBytes("utf-8"));
//            digest.update(text.getBytes("GBK"));
            System.out.println(text.getBytes());

            byte[] result = digest.digest(text.getBytes());
            StringBuilder sb =new StringBuilder();
            for(byte b:result){
                int number = b&0xff;
                String hex = Integer.toHexString(number);
                if(hex.length() == 1){
                    sb.append("0"+hex);
                }else{
                    sb.append(hex);
                }
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "" ;
    }

    public static void main(String[] args) {

        String key = "XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8";
        String val = "task_id1095566084726415360username1087911481117597696";
        String bb = encodeMD5UpperCase32(val+key);
        System.out.println(bb);

        String aa = encodeMD5UpperCase32("task_id1095566084726415360username1087911481117597696XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8");
        System.out.println(aa.toUpperCase());
    }

}