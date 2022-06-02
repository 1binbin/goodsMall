package com.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    private LocalDateTime tdate;
    private double tpay;
    private String tisdelivey;
    private String tispay;
    private String message;
    private String gcategory;
    private String gname;
    private double gprice;
    private double ginprice;
    private String gdescribe;
    private String gvip;
    private int mnum;
    private String radd;
    private double allprice;
    private String tisover;
    private String vcategory;
    private Date vindate;
    private Date voutdate;

    public EntityModel() {
    }

    public EntityModel(String oid, String gid, String eid, String cid, String rname, LocalDateTime tdate, double tpay, String tisdelivey, String tispay, String message, String gcategory, String gname, double gprice, double ginprice, String gdescribe, String gvip, int mnum, String radd, double allprice, String tisover) {
        this.oid = oid;
        this.gid = gid;
        this.eid = eid;
        this.cid = cid;
        this.rname = rname;
        this.tdate = tdate;
        this.tpay = tpay;
        this.tisdelivey = tisdelivey;
        this.tispay = tispay;
        this.message = message;
        this.gcategory = gcategory;
        this.gname = gname;
        this.gprice = gprice;
        this.ginprice = ginprice;
        this.gdescribe = gdescribe;
        this.gvip = gvip;
        this.mnum = mnum;
        this.radd = radd;
        this.allprice = allprice;
        this.tisover = tisover;
    }

    public EntityModel(String oid, String cid, String rname, LocalDateTime tdate, double tpay, String tisdelivey, String tispay) {
        this.oid = oid;
        this.cid = cid;
        this.rname = rname;
        this.tdate = tdate;
        this.tpay = tpay;
        this.tisdelivey = tisdelivey;
        this.tispay = tispay;
    }

    public EntityModel(String cid, String vcategory, Date vindate, Date voutdate) {
        this.cid = cid;
        this.vcategory = vcategory;
        this.vindate = vindate;
        this.voutdate = voutdate;
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

    public String getTisover() {
        return tisover;
    }

    public void setTisover(String tisover) {
        this.tisover = tisover;
    }

    public double getAllprice() {
        return allprice;
    }

    public void setAllprice(double allprice) {
        this.allprice = allprice;
    }

    public String getRadd() {
        return radd;
    }

    public void setRadd(String radd) {
        this.radd = radd;
    }

    public int getMnum() {
        return mnum;
    }

    public void setMnum(int mnum) {
        this.mnum = mnum;
    }

    public String getGcategory() {
        return gcategory;
    }

    public void setGcategory(String gcategory) {
        this.gcategory = gcategory;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public double getGprice() {
        return gprice;
    }

    public void setGprice(double gprice) {
        this.gprice = gprice;
    }

    public double getGinprice() {
        return ginprice;
    }

    public void setGinprice(double ginprice) {
        this.ginprice = ginprice;
    }

    public String getGdescribe() {
        return gdescribe;
    }

    public void setGdescribe(String gdescribe) {
        this.gdescribe = gdescribe;
    }

    public String getGvip() {
        return gvip;
    }

    public void setGvip(String gvip) {
        this.gvip = gvip;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public LocalDateTime getTdate() {
        return tdate;
    }

    public void setTdate(LocalDateTime tdate) {
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

    @Override
    public String toString() {
        return "EntityModel{" +
                "oid='" + oid + '\'' +
                ", gid='" + gid + '\'' +
                ", eid='" + eid + '\'' +
                ", cid='" + cid + '\'' +
                ", rname='" + rname + '\'' +
                ", tdate=" + tdate +
                ", tpay=" + tpay +
                ", tisdelivey='" + tisdelivey + '\'' +
                ", tispay='" + tispay + '\'' +
                ", message='" + message + '\'' +
                ", gcategory='" + gcategory + '\'' +
                ", gname='" + gname + '\'' +
                ", gprice=" + gprice +
                ", ginprice=" + ginprice +
                ", gdescribe='" + gdescribe + '\'' +
                ", gvip='" + gvip + '\'' +
                '}';
    }
}
