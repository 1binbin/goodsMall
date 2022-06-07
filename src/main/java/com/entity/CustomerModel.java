package com.entity;

import java.util.Date;

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
    private String vcategory;
    private Date vindate;
    private Date voutdate;
    private String vstatus;
    private String messager;

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

    public CustomerModel(String cid, String cpassword, String csex, String cname, String cnickname, String cphone, String rname, String radd, String vcategory, Date vindate, Date voutdate, String vstatus, String messager) {
        this.cid = cid;
        this.cpassword = cpassword;
        this.csex = csex;
        this.cname = cname;
        this.cnickname = cnickname;
        this.cphone = cphone;
        this.rname = rname;
        this.radd = radd;
        this.vcategory = vcategory;
        this.vindate = vindate;
        this.voutdate = voutdate;
        this.vstatus = vstatus;
        this.messager = messager;
    }

    public String getMessager() {
        return messager;
    }

    public void setMessager(String messager) {
        this.messager = messager;
    }

    public String getVcategory() {
        return vcategory;
    }

    public void setVcategory(String vcategory) {
        this.vcategory = vcategory;
    }

    public Date getVindate() {
        return vindate;
    }

    public void setVindate(Date vindate) {
        this.vindate = vindate;
    }

    public Date getVoutdate() {
        return voutdate;
    }

    public void setVoutdate(Date voutdate) {
        this.voutdate = voutdate;
    }

    public String getVstatus() {
        return vstatus;
    }

    public void setVstatus(String vstatus) {
        this.vstatus = vstatus;
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
