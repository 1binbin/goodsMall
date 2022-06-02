package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:34
 */
public class ShoppingcartModel {
    private String cid;
    private String eid;
    private String gid;
    private int snum;

    public ShoppingcartModel() {
    }

    public ShoppingcartModel(String cid, String eid, String gid, int snum) {
        this.cid = cid;
        this.eid = eid;
        this.gid = gid;
        this.snum = snum;
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

    public int getSnum() {
        return snum;
    }

    public void setSnum(int snum) {
        this.snum = snum;
    }
}
