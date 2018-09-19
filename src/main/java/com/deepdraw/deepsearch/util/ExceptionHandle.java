package com.deepdraw.deepsearch.util;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

public class ExceptionHandle  {

    @ExceptionHandler(value=Exception.class)

    @ResponseBody

    public ResultMsg handle(Exception e){

        return ResultUtil.error(100,e.getMessage());

    }

}