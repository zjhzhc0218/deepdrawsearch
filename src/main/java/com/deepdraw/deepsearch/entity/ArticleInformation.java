package com.deepdraw.deepsearch.entity;

import java.util.Date;

public class ArticleInformation {
    /**
     * 文章资讯序号（自动生成） 数据库字段是：serial_number  <br>
     */
    private Integer serialNumber;

    /**
     * 排序(默认是0) 数据库字段是：orderN  <br>
     */
    private Integer orderN;

    /**
     * 标题 数据库字段是：title  <br>
     */
    private String title;

    /**
     * 作者 数据库字段是：author  <br>
     */
    private String author;

    /**
     * 资讯类型 数据库字段是：typeN  <br>
     */
    private Integer typeN;

    /**
     * 封面（存放对应路径） 数据库字段是： cover  <br>
     */
    private String cover;

    /**
     * 描述 数据库字段是：describeN  <br>
     */
    private String describeN;

    /**
     * 创建时间 数据库字段是： creation_time  <br>
     */
    private Date creationTime;

    /**
     * 创建人 数据库字段是： creation_people  <br>
     */
    private String creationPeople;

    /**
     * 状态（1.在用 2.停用 3.删除） 数据库字段是：state  <br>
     */
    private Integer state;

    /**
     * 具体内容 数据库字段是： specific_content  <br>
     */
    private String specificContent;

    /**
     * 获取文章资讯序号（自动生成）
     * @return article_information.serial_number
     */
    public Integer getSerialNumber() {
        return serialNumber;
    }

    /**
     * 设置文章资讯序号（自动生成）
     * @param serialNumber 文章资讯序号（自动生成）
     */
    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    /**
     * 获取排序(默认是0)
     * @return article_information.orderN
     */
    public Integer getOrderN() {
        return orderN;
    }

    /**
     * 设置排序(默认是0)
     * @param orderN 排序(默认是0)
     */
    public void setOrderN(Integer orderN) {
        this.orderN = orderN;
    }

    /**
     * 获取标题
     * @return article_information.title
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
     * @return article_information.author
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
     * 获取资讯类型
     * @return article_information.typeN
     */
    public Integer getTypeN() {
        return typeN;
    }

    /**
     * 设置资讯类型
     * @param typeN 资讯类型
     */
    public void setTypeN(Integer typeN) {
        this.typeN = typeN;
    }

    /**
     * 获取封面（存放对应路径）
     * @return article_information. cover
     */
    public String getCover() {
        return cover;
    }

    /**
     * 设置封面（存放对应路径）
     * @param cover 封面（存放对应路径）
     */
    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    /**
     * 获取描述
     * @return article_information.describeN
     */
    public String getDescribeN() {
        return describeN;
    }

    /**
     * 设置描述
     * @param describeN 描述
     */
    public void setDescribeN(String describeN) {
        this.describeN = describeN == null ? null : describeN.trim();
    }

    /**
     * 获取创建时间
     * @return article_information. creation_time
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * 设置创建时间
     * @param creationTime 创建时间
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * 获取创建人
     * @return article_information. creation_people
     */
    public String getCreationPeople() {
        return creationPeople;
    }

    /**
     * 设置创建人
     * @param creationPeople 创建人
     */
    public void setCreationPeople(String creationPeople) {
        this.creationPeople = creationPeople == null ? null : creationPeople.trim();
    }

    /**
     * 获取状态（1.在用 2.停用 3.删除）
     * @return article_information.state
     */
    public Integer getState() {
        return state;
    }

    /**
     * 设置状态（1.在用 2.停用 3.删除）
     * @param state 状态（1.在用 2.停用 3.删除）
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * 获取具体内容
     * @return article_information. specific_content
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
}