package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:02
 */
public class CustomerModel {
    private String cid;
    private String cpassword;
    private String csex;
    private String cname;
    private String cnickname;
    private String cphone;
    private String rname;
    private String radd;

    public CustomerModel(String cid, String cpassword, String csex, String cname, String cnickname, String cphone) {
        this.cid = cid;
        this.cpassword = cpassword;
        this.csex = csex;
        this.cname = cname;
        this.cnickname = cnickname;
        this.cphone = cphone;
    }

    public CustomerModel(String cid, String cpassword, String csex, String cname, String cnickname, String cphone, String rname, String radd) {
        this.cid = cid;
        this.cpassword = cpassword;
        this.csex = csex;
        this.cname = cname;
        this.cnickname = cnickname;
        this.cphone = cphone;
        this.rname = rname;
        this.radd = radd;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRadd() {
        return radd;
    }

    public void setRadd(String radd) {
        this.radd = radd;
    }

    public CustomerModel() {
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }

    public String getCsex() {
        return csex;
    }

    public void setCsex(String csex) {
        this.csex = csex;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCnickname() {
        return cnickname;
    }

    public void setCnickname(String cnickname) {
        this.cnickname = cnickname;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }
}
