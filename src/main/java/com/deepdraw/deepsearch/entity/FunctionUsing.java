package com.deepdraw.deepsearch.entity;/**
 * Created by hasee on 2018/9/25.
 */

import jnr.ffi.annotations.In;

import java.sql.Date;

/**
 * 用户使用模块记录的表 数据库对应表名sfunction_using
 * @author zyw
 * @create 2018-09-25 10:09
 **/
public class FunctionUsing {

    private Integer id;
    private Integer module;
    private Long userId;
    private Date usingTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getModule() {
        return module;
    }

    public void setModule(Integer module) {
        this.module = module;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getUsingTime() {
        return usingTime;
    }

    public void setUsingTime(Date usingTime) {
        this.usingTime = usingTime;
    }
}
