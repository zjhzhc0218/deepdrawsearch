package com.deepdraw.deepsearch.util;/**
 * Created by hasee on 2018/12/4.
 */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;



/**
 * @author
 * @create 2018-12-04 15:42
 **/
public class PhoneUtil {

    /**
     * 精确到省
     *
     * @param phoneNum 手机号码
     * @return 浙江
     */
    public static String getMobileAddress(String phoneNum) {
        if (phoneNum.isEmpty()) {
            return "手机号为空";
        } else {
            String result = HttpRequestUtil.httpRequest("http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?" + "tel=" + phoneNum);
            System.out.println(result);
            String json = result.replace("__GetZoneResult_ = ", "");
            JSONObject jobj = JSON.parseObject(json);
            String data1 = jobj.get("province").toString();
            return data1;
        }
    }

    /**
     * 精确到市
     *
     * @param phoneNum 手机号码
     * @return 浙江杭州移动
     */
    public static String getMobileAddressByBaiDu(String phoneNum) {
        if (phoneNum.isEmpty()) {
            return "手机号为空";
        } else {
            String result = HttpRequestUtil.httpRequest("http://mobsec-dianhua.baidu.com/dianhua_api/open/location?" + "tel=" + phoneNum);
            System.out.println(result);
            JSONObject json = JSON.parseObject(result);
            String response = json.get("response").toString();
            JSONObject detail = JSON.parseObject(response);
            if (detail.containsKey(phoneNum)) {
                return JSON.parseObject(detail.get(phoneNum).toString()).get("location").toString();
            } else {
                return "手机号查询失败";
            }
        }
    }

}
