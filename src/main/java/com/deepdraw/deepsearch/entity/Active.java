package com.deepdraw.deepsearch.entity;

import java.util.Date;

public class Active {
    /**
     * 日活跃量的序号，编号 数据库字段是：id  <br>
     */
    private Integer id;

    /**
     * 对应时间（应该是当前日期-1天） 数据库字段是：time  <br>
     */
    private Date time;

    /**
     * 日活跃量人数 数据库字段是：numer  <br>
     */
    private Integer numer;

    /**
     * 获取日活跃量的序号，编号
     * @return active.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置日活跃量的序号，编号
     * @param id 日活跃量的序号，编号
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取对应时间（应该是当前日期-1天）
     * @return active.time
     */
    public Date getTime() {
        return time;
    }

    /**
     * 设置对应时间（应该是当前日期-1天）
     * @param time 对应时间（应该是当前日期-1天）
     */
    public void setTime(Date time) {
        this.time = time;
    }

    /**
     * 获取日活跃量人数
     * @return active.numer
     */
    public Integer getNumer() {
        return numer;
    }

    /**
     * 设置日活跃量人数
     * @param numer 日活跃量人数
     */
    public void setNumer(Integer numer) {
        this.numer = numer;
    }
}