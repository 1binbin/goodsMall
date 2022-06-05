package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/6/5-14:06
 */
public class AdminModel {
    private String aid;
    private String apassword;

    public AdminModel(String aid, String apassword) {
        this.aid = aid;
        this.apassword = apassword;
    }

    public AdminModel() {

    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }
}
