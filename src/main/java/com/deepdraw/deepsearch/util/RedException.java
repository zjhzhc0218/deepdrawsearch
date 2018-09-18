package com.deepdraw.deepsearch.util;

public class RedException extends RuntimeException{

    private Integer code;

    public RedException(Integer code,String message){
        super(message);
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}