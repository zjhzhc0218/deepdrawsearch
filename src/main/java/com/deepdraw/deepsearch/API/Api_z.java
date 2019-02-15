package com.deepdraw.deepsearch.API;/**
 * Created by hasee on 2019/2/15.
 */

import com.alibaba.fastjson.JSONObject;
import com.deepdraw.deepsearch.util.MD5Utils;
import com.deepdraw.deepsearch.util.SortUtils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

/**
 * 调用对应api最终版本 GTM的
 * @author zyw
 * @create 2019-02-15 0:16
 **/
public class Api_z {

    public static void main(String arg[]) throws Exception {
        resultD(null);
        System.out.println("123456798");
    }

    /**
     * 这部分是查询对应的任务返回信息（测试简单开始）  --resultD
     * @param info
     * @return
     */
    public static String resultD(String info) throws NoSuchAlgorithmException {
        String url = "http://www.liuliangzhan.com/index.php/Nuoren/Api/api_phonestop.html";
        //params用于存储要请求的参数
        Map params = new HashMap();
         /*开始我们自己的数据替换上去*/
        params.put("username","1087911481117597696"); //Api用户的数字编号（诺仁电商提供）
        params.put("task_id","1095566084726415360");
        String key = "XqCJKeRaUqSMGBB6fj8uX52tIy34Y7WKOBSMoIPePCstPtZd65HVpzCupWhIp1h8";
        String val = SortUtils.formatUrlParam(params,"utf-8",true).toString();
        String valKey = val+key;
        String sign = MD5Utils.encodeMD5UpperCase32(valKey).toUpperCase();
        params.put("sign",sign); //签名秘钥，即文档开头签名规则所生成的字符串

        String paramsJsonN = urlencode(params).toString();

        String ret = sendPostN(url,paramsJsonN);
        JSONObject pageBean = JSONObject.parseObject(ret);
        System.out.println(pageBean);

        System.out.println(pageBean.get("code"));
        return null;
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
     * 向指定 URL 发送POST方法的请求
     *
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPostN(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }
}
