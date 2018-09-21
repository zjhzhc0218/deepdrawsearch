package com.deepdraw.deepsearch.entity;/**
 * Created by hasee on 2018/9/18.
 */

import java.sql.Date;

/**
 * @author
 * @create 2018-09-18 17:00
 **/
public class Zyw {

    private Integer Id;

    private  String Name;

    private String Password;

    private Date LastTime;

    private  String LastIp;


    private  Integer permission;

    private  Integer ban;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public Date getLastTime() {
        return LastTime;
    }

    public void setLastTime(Date lastTime) {
        LastTime = lastTime;
    }

    public String getLastIp() {
        return LastIp;
    }

    public void setLastIp(String lastIp) {
        LastIp = lastIp;
    }


    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public Integer getBan() {
        return ban;
    }

    public void setBan(Integer ban) {
        this.ban = ban;
    }
}
