package com.deepdraw.deepsearch.entity;

import java.util.Date;

public class Announcement {
    /**
     * 公告栏对应的id 数据库字段是：id  <br>
     */
    private Integer id;

    /**
     * 标题 数据库字段是：title  <br>
     */
    private String title;

    /**
     * 作者 数据库字段是：author  <br>
     */
    private String author;

    /**
     * 简介 数据库字段是：synopsis  <br>
     */
    private String synopsis;

    /**
     * 具体内容 数据库字段是：specific_content  <br>
     */
    private String specificContent;

    /**
     * 新增时间 数据库字段是：creation_time  <br>
     */
    private Date creationTime;

    /**
     * 获取公告栏对应的id
     * @return announcement.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置公告栏对应的id
     * @param id 公告栏对应的id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取标题
     * @return announcement.title
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * 获取作者
     * @return announcement.author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * 设置作者
     * @param author 作者
     */
    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    /**
     * 获取简介
     * @return announcement.synopsis
     */
    public String getSynopsis() {
        return synopsis;
    }

    /**
     * 设置简介
     * @param synopsis 简介
     */
    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis == null ? null : synopsis.trim();
    }

    /**
     * 获取具体内容
     * @return announcement.specific_content
     */
    public String getSpecificContent() {
        return specificContent;
    }

    /**
     * 设置具体内容
     * @param specificContent 具体内容
     */
    public void setSpecificContent(String specificContent) {
        this.specificContent = specificContent == null ? null : specificContent.trim();
    }

    /**
     * 获取新增时间
     * @return announcement.creation_time
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * 设置新增时间
     * @param creationTime 新增时间
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }
}