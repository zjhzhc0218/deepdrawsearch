package com.deepdraw.deepsearch.API;/**
 * Created by hasee on 2019/2/12.
 */


import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


import com.deepdraw.deepsearch.util.CreateMD5;
import com.deepdraw.deepsearch.util.MD5Util;
import com.deepdraw.deepsearch.util.SortUtils;
import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;


import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;



/**
 * @author
 * @create 2019-02-12 17:48
 **/
public class HttpClientUtil {


    public static void main(String arg[]) throws Exception {
        resultD(null);
        System.out.println("123456798");
    }

    /**
     httpClient的get请求方式2
     * @return
     * @throws Exception
     */
    public static String doGet(String url, String charset)
            throws Exception {
    /*
     * 使用 GetMethod 来访问一个 URL 对应的网页,实现步骤: 1:生成一个 HttpClinet 对象并设置相应的参数。
     * 2:生成一个 GetMethod 对象并设置响应的参数。 3:用 HttpClinet 生成的对象来执行 GetMethod 生成的Get
     * 方法。 4:处理响应状态码。 5:若响应正常，处理 HTTP 响应内容。 6:释放连接。
     */
    /* 1 生成 HttpClinet 对象并设置参数 */
        HttpClient httpClient = new HttpClient();
        // 设置 Http 连接超时为5秒
        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
    /* 2 生成 GetMethod 对象并设置参数 */
        GetMethod getMethod = new GetMethod(url);
        // 设置 get 请求超时为 5 秒
        getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
        // 设置请求重试处理，用的是默认的重试处理：请求三次
        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,	new DefaultHttpMethodRetryHandler());
        String response = "";
    /* 3 执行 HTTP GET 请求 */
        try {
            int statusCode = httpClient.executeMethod(getMethod);
      /* 4 判断访问的状态码 */
            if (statusCode != HttpStatus.SC_OK) {
                System.err.println("请求出错: "+ getMethod.getStatusLine());
            }
      /* 5 处理 HTTP 响应内容 */
            // HTTP响应头部信息，这里简单打印
            Header[] headers = getMethod.getResponseHeaders();
            for (Header h : headers)
                System.out.println(h.getName() + "------------ " + h.getValue());
            // 读取 HTTP 响应内容，这里简单打印网页内容
            byte[] responseBody = getMethod.getResponseBody();// 读取为字节数组
            response = new String(responseBody, charset);
            System.out.println("----------response:" + response);
            // 读取为 InputStream，在网页内容数据量大时候推荐使用
            // InputStream response = getMethod.getResponseBodyAsStream();
        } catch (HttpException e) {
            // 发生致命的异常，可能是协议不对或者返回的内容有问题
            System.out.println("请检查输入的URL!");
            e.printStackTrace();
        } catch (IOException e) {
            // 发生网络异常
            System.out.println("发生网络异常!");
            e.printStackTrace();
        } finally {
      /* 6 .释放连接 */
            getMethod.releaseConnection();
        }
        return response;
    }

    /**
     * post请求
     * @param url
     * @param json
     * @return
     */

    public static JSONObject doPost(String url,JSONObject json){
        DefaultHttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(url);
        JSONObject response = null;
        try {
            StringEntity s = new StringEntity(json.toString());
            s.setContentEncoding("UTF-8");
            s.setContentType("application/json");//发送json数据需要设置contentType
            post.setEntity(s);
            HttpResponse res = client.execute(post);
            if(res.getStatusLine().getStatusCode() == HttpStatus.SC_OK){
                HttpEntity entity = res.getEntity();
                String result = EntityUtils.toString(res.getEntity());// 返回json格式：

                response = JSONObject.parseObject(result);
//                response = JSONObject.getJSONObject(result);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return response;
    }


    /**
     * 这部分是查询对应的任务返回信息（测试简单开始）  --resultD
     * @param info
     * @return
     */
    public static String resultD(String info) throws NoSuchAlgorithmException {
        String url = "http://www.liuliangzhan.com/index.php/Nuoren/Api/api_phonestop.html";
//        String url = "https://www.apiopen.top/satinApi?type=1&page=1";
//        JSONObject params = new JSONObject();
        //params用于存储要请求的参数
        Map params = new HashMap();
         /*开始我们自己的数据替换上去*/
        params.put("username","1087911481117597696"); //Api用户的数字编号（诺仁电商提供）


        /*long[] d = new long[10];
        d[0] = 1095145327064080384L;*/
//        1095566084726415360L   --取消测试
        params.put("task_id","1095566084726415360");
        String key = "XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8";
        String val = SortUtils.formatUrlParam(params,"utf-8",true);
        System.out.println(val);
        String valKey = val+key;
        System.out.println(valKey);
        String sign = MD5Util.md5(valKey).toUpperCase();
        System.out.println(sign);
        params.put("sign",sign); //签名秘钥，即文档开头签名规则所生成的字符串

        JSONObject paramsJson = new JSONObject(params);
//        JSONObject paramsJson = new JSONObject();

//        JSONArray params2 = new JSONArray();
//        JSONObject param3 = new JSONObject();
//        param3.put("DOC_TP_CODE", "10100");
//        param3.put("DOC_NBR", "100200198301202210");
//        param3.put("DOC_CUST_NM", "test");
//        params2.add(param3);
//        params.put("DOCS", params2);
        String ret = doPost(url, paramsJson).toString();
        System.out.println(ret);

        JSONObject pageBean = JSONObject.parseObject(ret);
//                    .getJSONObject(string);
//                .getJSONObject("showapi_res_body");
//        return pageBean.getString("text");


        return null;
    }

}
