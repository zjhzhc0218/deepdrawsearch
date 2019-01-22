package com.deepdraw.deepsearch.enums;

import jnr.ffi.annotations.In;

import java.util.HashMap;
import java.util.Map;

public enum SearchEnums {
    PAIMING("排名", 1,"paiming"),
    WJC("违禁词", 2,"wjc"),
    XINYU("信誉", 3,"xinyu"),
    RECI("热词", 4,"reci"),
    JIANGQUAN("降权", 5,"jiangquan"),
    DONGTAIPINGFEN("动态评分", 6,"dongtaipingfen"),
    MULU("目录", 7,"mulu"),
    SHANGXIAJIA("上下架", 8,"shangxiajia"),
    ZHISHU("指数", 9,"zhishu"),
    ZHANXIAN("展现", 10,"zhanxian"),
    XIALAKUANG("下拉框", 11,"xialakuang"),

    SHUJUXIAZAI("数据运营下载",99,"shujuxiazai");
    // 成员变量
    private String name;
    private int type;
    private String vuale;


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

    public String getVuale() {
        return vuale;
    }

    public void setVuale(String vuale) {
        this.vuale = vuale;
    }

    SearchEnums(String name, int type,String vaule) {
        this.name = name;
        this.type = type;
        this.vuale = vaule;
    }
    public static String getName(int type) {
        for (SearchEnums c : SearchEnums.values()) {
            if (c.getType() == type) {
                return c.name;
            }
        }
        return null;
    }

    /**
     * 获取枚举类的所有数据用于，数据使用查询 (仅供数据显示使用)
     * @return
     */
    public static Map<Integer,String> getMaps(){
        Map<Integer,String> maps = new HashMap<>();
        for (SearchEnums c : SearchEnums.values()) {
            maps.put(c.getType(),c.getVuale());
            }
        return maps;
        }



}