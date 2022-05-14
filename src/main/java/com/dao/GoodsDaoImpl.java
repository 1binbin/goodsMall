package com.dao;

import com.common.JdbcConnection;
import com.entity.GoodsModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-15:11
 * @Description 图书dao层接口实现类
 */
public class GoodsDaoImpl extends BaseDao<GoodsModel> implements GoodsDao {
    Connection connection;

    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertGoods(GoodsModel goodsModel) {
        String sql = "insert into goods(eid,gid,gname,gcategory,gprice,ginprice,gnum,gdescribe) values(?,?,?,?,?,?,?,?)";
        update(connection, sql, goodsModel.getEid(), goodsModel.getGid(), goodsModel.getGname(), goodsModel.getGcategory(), goodsModel.getGprice(), goodsModel.getGinprice(), goodsModel.getGnum(),goodsModel.getGdescribe());
    }

    @Override
    public void deleteGoods(String isbn, String eid) {
        String sql = "delete from goods where gid = ? and eid = ?";
        update(connection, sql, isbn, eid);
    }

    @Override
    public void update(GoodsModel goodsModel) {
        String sql = "update goods set  gname = ? , gcategory = ? , gprice = ? ,ginprice = ? , gnum = ? , gdescribe = ? where gid = ? and eid = ? ";
        update(connection, sql, goodsModel.getGname(), goodsModel.getGcategory(), goodsModel.getGprice(), goodsModel.getGinprice(),goodsModel.getGnum(),goodsModel.getGdescribe(),goodsModel.getGid(), goodsModel.getEid());
    }

    @Override
    public List<GoodsModel> getGoodslist(String eid) {
        String sql = "select * from goods where eid = ?";
        return getBeanList(connection, sql, eid);
    }

    @Override
    public List<GoodsModel> getGoods(String gid, String eid) {
        String sql = "select * from goods where gid like concat('%',?,'%') and eid = ?";
        return getBeanList(connection, sql, gid, eid);
    }

    @Override
    public List<GoodsModel> getGoodsGname(String gname, String eid) {
        String sql = "select * from goods where gname like concat('%',?,'%') and eid = ?";
        return getBeanList(connection, sql, gname, eid);
    }

    @Override
    public List<GoodsModel> getGoodsGcategory(String gcategory, String eid) {
        String sql = "select * from goods where gcategory like concat('%',?,'%') and eid = ?";
        return getBeanList(connection, sql, gcategory, eid);
    }

    @Override
    public List<GoodsModel> getGoodsAll(String all, String eid) {
        String sql = "select * from goods where (gid like concat('%',?,'%') or gname like concat('%',?,'%') or  gcategory like concat('%',?,'%')) and eid = ?";
        return getBeanList(connection, sql, all, all, all,eid);
    }
}
