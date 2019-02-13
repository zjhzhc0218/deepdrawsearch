package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2019/1/26.
 */
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * 为了可以调用urlencode,可能用不到
 * @author zyw
 * @create 2019-01-26 14:36
 **/
public class URLencode {

    private StringBuilder query = new StringBuilder();

    public synchronized void add(String name,String value){
        encode(name,value);
    }

    private synchronized void encode(String name, String value) {
        try {
            query.append(URLEncoder.encode(name,"UTF-8"));
            query.append('=');
            query.append(URLEncoder.encode(value,"UTF-8"));
            query.append('&');
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public synchronized String getQuery(){
        query.deleteCharAt(query.length()-1);
        return query.toString();
    }

    public synchronized String decode() throws UnsupportedEncodingException{
        return URLDecoder.decode(getQuery(),"UTF-8");
    }


}
