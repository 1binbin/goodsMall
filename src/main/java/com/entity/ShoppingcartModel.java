package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:34
 */
public class ShoppingcartModel {
    private String cid;
    private String eid;
    private String gid;
    private String gname;
    private String gdescribe;
    private String estorename;
    private double gprice;
    public ShoppingcartModel() {
    }

    public ShoppingcartModel(String cid, String eid, String gid ) {
        this.cid = cid;
        this.eid = eid;
        this.gid = gid;
    }

    public ShoppingcartModel(String cid, String eid, String gid, String gname, String gdescribe, String estorename, double gprice) {
        this.cid = cid;
        this.eid = eid;
        this.gid = gid;
        this.gname = gname;
        this.gdescribe = gdescribe;
        this.estorename = estorename;
        this.gprice = gprice;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGdescribe() {
        return gdescribe;
    }

    public void setGdescribe(String gdescribe) {
        this.gdescribe = gdescribe;
    }

    public String getEstorename() {
        return estorename;
    }

    public void setEstorename(String estorename) {
        this.estorename = estorename;
    }

    public double getGprice() {
        return gprice;
    }

    public void setGprice(double gprice) {
        this.gprice = gprice;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }
}
