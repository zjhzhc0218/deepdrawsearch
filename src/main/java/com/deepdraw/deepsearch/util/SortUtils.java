package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2019/1/26.
 */

import org.apache.commons.lang3.StringUtils;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;


/**
 * 参考网址  https://blog.csdn.net/sinat_33151213/article/details/81059486
 * JAVA对参数KEY进行字典升序排列
 * @author zyw
 * @create 2019-01-26 14:53
 **/
public class SortUtils {

    /**
     * @param param 参数
     * @param encode 编码
     * @param isLower 是否小写
     * @return
     */
    public static String formatUrlParam(Map<String, String> param, String encode, boolean isLower) {
        String params = "";
        Map<String, String> map = param;

        try {
            List<Map.Entry<String, String>> itmes = new ArrayList<Map.Entry<String, String>>(map.entrySet());

            //对所有传入的参数按照字段名从小到大排序
            //Collections.sort(items); 默认正序
            //可通过实现Comparator接口的compare方法来完成自定义排序
            Collections.sort(itmes, new Comparator<Map.Entry<String, String>>() {
                @Override
                public int compare(Entry<String, String> o1, Entry<String, String> o2) {
                    // TODO Auto-generated method stub
                    return (o1.getKey().toString().compareTo(o2.getKey()));
                }
            });

            //构造URL 键值对的形式
            StringBuffer sb = new StringBuffer();
            for (Map.Entry<String, String> item : itmes) {
                if (StringUtils.isNotBlank(item.getKey())) {
                    String key = String.valueOf(item.getKey());
                    String val = String.valueOf(item.getValue());
//                    val = URLEncoder.encode(val, encode); --这是原来进行的url处理
                    if (isLower) {
//                        sb.append(key.toLowerCase() + "=" + val);
                        sb.append(key.toLowerCase() +  val);
                    } else {
//                        sb.append(key + "=" + val);
                        sb.append(key +   val);
                    }
//                    sb.append("&");

                }
            }

            params = sb.toString();
            if (!params.isEmpty()) {
                params = params.substring(0, params.length() - 1);
            }
        } catch (Exception e) {
            return "";
        }
        return params;
    }

}
