package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-14:42
 * @Description 图书实体类，封装需要处理的数据
 */
public class GoodsModel {
    //    商品编号
    private String gid;
    //    商品名称
    private String gname;
    //    类别
    private String gcategory;
    //    价格
    private double gprice;
    private double ginprice;
    private int gnum;

    public GoodsModel() {
    }

    public GoodsModel(String gid, String gname, String gcategory, double gprice, double ginprice, int gnum) {
        this.gid = gid;
        this.gname = gname;
        this.gcategory = gcategory;
        this.gprice = gprice;
        this.ginprice = ginprice;
        this.gnum = gnum;
    }

    public double getGinprice() {
        return ginprice;
    }

    public void setGinprice(double ginprice) {
        this.ginprice = ginprice;
    }

    public int getGnum() {
        return gnum;
    }

    public void setGnum(int gnum) {
        this.gnum = gnum;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGcategory() {
        return gcategory;
    }

    public void setGcategory(String gcategory) {
        this.gcategory = gcategory;
    }

    public double getGprice() {
        return gprice;
    }

    public void setGprice(double gprice) {
        this.gprice = gprice;
    }

    @Override
    public String toString() {
        return "GoodsModel{" +
                "gid='" + gid + '\'' +
                ", gname='" + gname + '\'' +
                ", gcategory='" + gcategory + '\'' +
                ", gprice=" + gprice +
                '}';
    }
}
