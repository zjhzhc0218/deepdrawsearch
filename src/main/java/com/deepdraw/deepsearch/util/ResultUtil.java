package com.deepdraw.deepsearch.util;

/**
 * hc
 */
public class ResultUtil {



    public static ResultMsg success(Object object) {
        ResultMsg result = new ResultMsg();
        result.setCode(0);
        result.setMsg("成功");
        result.setData(object);
        return result;
    }


    public static ResultMsg success() {
        return success(null);
    }

    public static ResultMsg error(Integer code, String msg) {
        ResultMsg result = new ResultMsg();
        result.setCode(code);
        result.setMsg(msg);
        //result.setData(object);
        return result;
    }

}
