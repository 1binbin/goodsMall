package com.entity;

import java.util.Date;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:15
 */
public class EntityModel {
    private String oid;
    private String gid;
    private String eid;
    private String cid;
    private String rname;
    private Date tdate;
    private double tpay;
    private String tisdelivey;
    private String tispay;

    public EntityModel() {
    }

    public EntityModel(String oid, String gid, String eid, String cid, String rname, Date tdate, double tpay, String tisdelivey, String tispay) {
        this.oid = oid;
        this.gid = gid;
        this.eid = eid;
        this.cid = cid;
        this.rname = rname;
        this.tdate = tdate;
        this.tpay = tpay;
        this.tisdelivey = tisdelivey;
        this.tispay = tispay;
    }

    public EntityModel(String oid, String cid, String rname, Date tdate, double tpay, String tisdelivey, String tispay) {
        this.oid = oid;
        this.cid = cid;
        this.rname = rname;
        this.tdate = tdate;
        this.tpay = tpay;
        this.tisdelivey = tisdelivey;
        this.tispay = tispay;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Date getTdate() {
        return tdate;
    }

    public void setTdate(Date tdate) {
        this.tdate = tdate;
    }

    public double getTpay() {
        return tpay;
    }

    public void setTpay(double tpay) {
        this.tpay = tpay;
    }

    public String getTisdelivey() {
        return tisdelivey;
    }

    public void setTisdelivey(String tisdelivey) {
        this.tisdelivey = tisdelivey;
    }

    public String getTispay() {
        return tispay;
    }

    public void setTispay(String tispay) {
        this.tispay = tispay;
    }
}
