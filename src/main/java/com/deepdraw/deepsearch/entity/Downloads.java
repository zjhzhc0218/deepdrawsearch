package com.deepdraw.deepsearch.entity;

public class Downloads {
    /**
     * 用户id 数据库字段是：id  <br>
     */
    private Long id;

    /**
     * 下载次数 数据库字段是：number  <br>
     */
    private Integer number;

    /**
     * 获取用户id
     * @return downloads.id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置用户id
     * @param id 用户id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取下载次数
     * @return downloads.number
     */
    public Integer getNumber() {
        return number;
    }

    /**
     * 设置下载次数
     * @param number 下载次数
     */
    public void setNumber(Integer number) {
        this.number = number;
    }
}