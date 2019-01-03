package com.deepdraw.deepsearch.enums;/**
 * Created by hasee on 2019/1/3.
 */

/**
 * @author
 * @create 2019-01-03 11:05
 **/
public enum DownEnums {
    XIAZAI1("排名", 1,"123456.pdf"),
    XIAZAI2("违禁词", 2,"123456.pdf"),
    XIAZAI3("信誉", 3,"123456.pdf"),
    XIAZAI4("热词", 4,"123456.pdf"),
    XIAZAI5("降权", 5,"123456.pdf");
    // 成员变量
    private String name;
    private int type;
    private String fileName;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String filename) {
        this.fileName = fileName;
    }


    DownEnums(String name, int type,String fileName) {
        this.name = name;
        this.type = type;
        this.fileName = fileName;
    }
    public static String getFileName(int type) {
        for (DownEnums c : DownEnums.values()) {
            if (c.getType() == type) {
                return c.fileName;
            }
        }
        return null;
    }

}
