package com.deepdraw.deepsearch.API;/**
 * Created by hasee on 2019/1/26.
 */


import com.alibaba.fastjson.JSONObject;
import com.deepdraw.deepsearch.util.MD5Util;
import com.deepdraw.deepsearch.util.SortUtils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * 用于淘宝App 接口调用预编写  开始尝试
 * @author
 * @create 2019-01-26 13:58
 **/
public class API_taobaoApp {

    public static String result(String info) {
        //接口地址
        String requestUrl = "http://www.liuliangzhan.com/index.php/Nuoren/api/api_phone.html";
        //params用于存储要请求的参数
        Map params = new HashMap();
//        //showapi_appid的值，把###替换成你的appid
//        params.put("showapi_appid","###");
//        //我们请求的字符串
//        params.put("info",info);
//        //数字签名，###填你的数字签名，可以在你的个人中心看到
//        params.put("showapi_sign","###");

        /*开始我们自己的数据替换上去*/
        params.put("username","1087911481117597696"); //Api用户的数字编号（诺仁电商提供）
        params.put("execution_time","2019-03-11"); //任务的执行时间2017-03-10
        params.put("end_time","2019-03-11"); //任务结束时间2017-03-10
        params.put("task_total","5"); //发布任务总量（任务总量必须等于 每天任务量*任务的执行天数）
        params.put("task_day","5"); //每天任务量（任务量至少大于等于5）
        params.put("zxts","1"); //任务的执行天数（最少为1）
//        https://detail.tmall.com/item.htm?spm=a230r.1.14.8.368d62c4QKdq1I&id=577052379785&cm_id=140105335569ed55e27b&abbucket=13   该宝贝是ZABA的新款 男装  基本款西装外套01608300807

        String url = "https://detail.tmall.com/item.htm?spm=a230r.1.14.8.368d62c4QKdq1I&id=577052379785&cm_id=140105335569ed55e27b&abbucket=13";
//        String urlNew = java.net.URLEncoder.encode("","UTF-8");
        String urlNew = null;
        try {
             urlNew = URLEncoder.encode(url,"GBK");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(urlNew);

        params.put("url",url); //宝贝地址
        params.put("keywords","西装男"); //关键词
        params.put("residence_time","120|180"); //停留时间，参数值：120|180、180|280、280|380、380|480
//        请求参数值如：120|180
        params.put("click_ration","30");//深入点击流量比例,参数值：30、50、80、100
//        请求参数值如：30
        params.put("gprs","3"); //gprs网络的手机比例，参数值：0、1、2、3  分别代表30%，50%，80%，100%
//        请求参数值如：3
        params.put("tm","3"); //天猫app流量比例，参数值：0、1、2、3  分别代表0%，30%，50%，80%
//        请求参数值如：3[忽略]
        params.put("time_slot","0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0"); //24小时，每小时执行任务量分配
//        请求参数值如：0,0,0,0,12,0,9,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0
        params.put("remark","白马查api接口测试"); //备注
        params.put("objectname","ZARA 新款 男装 基本款西装外套 01608300807"); //宝贝标题
        params.put("sex_type","2"); //男女访客，参数值：0、1、2  分别代表 男女4/6混合，只要男访客，只要女访客
//        请求参数值如：2

        String key = "XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8";
        String val = SortUtils.formatUrlParam(params,"UTF-8",false);
        System.out.println(val);
        String sign = (MD5Util.md5(val+key)).toUpperCase();

        System.out.println(sign);


        params.put("sign",sign); //签名秘钥，即文档开头签名规则所生成的字符串

        System.out.println(params);

        /*这里的部分需要对于参数进行排序*/



        //调用httpRequest方法，这个方法主要用于请求地址，并加上请求参数
        String string = httpRequest(requestUrl,params);

        System.out.println(string);
        //处理返回的JSON数据并返回
        JSONObject pageBean = JSONObject.parseObject(string);
//                    .getJSONObject(string);
//                .getJSONObject("showapi_res_body");
        return pageBean.getString("message");
    }



    /**
     * 这部分是查询对应的任务返回信息（测试简单开始）  --resultD
     * @param info
     * @return
     */
    public static String resultD(String info) {
        //接口地址
        String requestUrl = "http://www.liuliangzhan.com/index.php/Nuoren/Api/api_phonecx.html";
        //params用于存储要请求的参数
        Map params = new HashMap();

        /*开始我们自己的数据替换上去*/
        params.put("username","1087911481117597696"); //Api用户的数字编号（诺仁电商提供）

        long[] d = new long[10];
        d[0] = 1095145327064080384L;
//        for()
        params.put("0",1095145327064080384L);

        String key = "XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8";
        String val = SortUtils.formatUrlParam(params,"UTF-8",false);
        System.out.println(val);
        String sign = (MD5Util.md5(val+key)).toUpperCase();

        System.out.println(sign);

        params.put("sign",sign); //签名秘钥，即文档开头签名规则所生成的字符串

        System.out.println(params);

        /*这里的部分需要对于参数进行排序*/



        //调用httpRequest方法，这个方法主要用于请求地址，并加上请求参数
        String string = httpRequest(requestUrl,params);

        System.out.println(string);
        //处理返回的JSON数据并返回
        JSONObject pageBean = JSONObject.parseObject(string);
//                    .getJSONObject(string);
//                .getJSONObject("showapi_res_body");
        return pageBean.getString("text");
    }


    /**
     * 这个是get的 注意了
     * @param requestUrl
     * @param params
     * @return
     */
    private static String httpRequest(String requestUrl,Map params) {
        //buffer用于接受返回的字符
        StringBuffer buffer = new StringBuffer();
        try {
            //建立URL，把请求地址给补全，其中urlencode（）方法用于把params里的参数给取出来
//            URL url = new URL(requestUrl+"?"+urlencode(params));

            URL url = new URL(requestUrl);
            //打开http连接
            HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
            httpUrlConn.setDoInput(true);
            httpUrlConn.setRequestMethod("GET");
            httpUrlConn.connect();

            //获得输入
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            //将bufferReader的值给放到buffer里
            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            //关闭bufferReader和输入流
            bufferedReader.close();
            inputStreamReader.close();
            inputStream.close();
            inputStream = null;
            //断开连接
            httpUrlConn.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
        //返回字符串
        return buffer.toString();
    }



    /**
     * 这部分是取消对应的任务返回信息（）  --resultDnNo
     * @param info
     * @return
     */
    public static String resultNo(String info) {
        //接口地址
        String requestUrl = "http://www.liuliangzhan.com/index.php/Nuoren/Api/api_phonecx.html";
        //params用于存储要请求的参数
        Map params = new HashMap();

        /*开始我们自己的数据替换上去*/
        params.put("username","1087911481117597696"); //Api用户的数字编号（诺仁电商提供）

        long[] d = new long[10];
        d[0] = 1095145327064080384L;
//        for()
        params.put("0",1095145327064080384L);

        String key = "XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8";
        String val = SortUtils.formatUrlParam(params,"UTF-8",false);
        System.out.println(val);
        String sign = (MD5Util.md5(val+key)).toUpperCase();

        System.out.println(sign);

        params.put("sign",sign); //签名秘钥，即文档开头签名规则所生成的字符串

        System.out.println(params);

        /*这里的部分需要对于参数进行排序*/



        //调用httpRequest方法，这个方法主要用于请求地址，并加上请求参数
        String string = httpRequest(requestUrl,params);

        System.out.println(string);
        //处理返回的JSON数据并返回
        JSONObject pageBean = JSONObject.parseObject(string);
//                    .getJSONObject(string);
//                .getJSONObject("showapi_res_body");
        return pageBean.getString("text");
    }



    /**
     * 这部分只是单纯的转换  那个转换需要Key字典升序排列 （暂时弃用）
     * @param data
     * @return
     */
    public static String urlencode(Map<String,Object>data) {
        //将map里的参数变成像 showapi_appid=###&showapi_sign=###&的样子
        StringBuilder sb = new StringBuilder();
        for (Map.Entry i : data.entrySet()) {
            try {
                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }


    /**
     * 数据整理下
     * @return
     */
    public static String jiekou(){
        return null;
    }
    //测试是否有效
    public static void main(String[] args) {

//        result(null);
        resultD(null);
    }


}
