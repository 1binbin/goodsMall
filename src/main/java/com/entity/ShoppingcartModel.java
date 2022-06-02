package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:34
 */
public class ShoppingcartModel {
    private String cid;
    private String eid;
    private String gid;
    public ShoppingcartModel() {
    }

    public ShoppingcartModel(String cid, String eid, String gid ) {
        this.cid = cid;
        this.eid = eid;
        this.gid = gid;
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
