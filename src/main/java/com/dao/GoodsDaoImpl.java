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
        String sql = "insert into goods(gid,gname,gcategory,gprice,ginprice,gnum) values(?,?,?,?,?,?)";
        update(connection,sql, goodsModel.getGid(), goodsModel.getGname(), goodsModel.getGcategory(), goodsModel.getGprice(),goodsModel.getGinprice(),goodsModel.getGnum());
    }

    @Override
    public void deleteGoods(String isbn) {
        String sql = "delete from goods where gid = ?";
        update(connection,sql,isbn);
    }

    @Override
    public void update(GoodsModel goodsModel) {
        String sql = "update goods set  gname = ? , gcategory = ? , gprice = ? where gid = ?";
        update(connection,sql, goodsModel.getGname(), goodsModel.getGcategory(), goodsModel.getGprice(), goodsModel.getGid());
    }

    @Override
    public List<GoodsModel> getGoodslist() {
        String sql = "select * from goods";
        return getBeanList(connection,sql);
    }

    @Override
    public List<GoodsModel> getGoods(String gid) {
        String sql = "select * from goods where gid like concat('%',?,'%')";
        return getBeanList(connection,sql,gid);
    }

    @Override
    public List<GoodsModel> getGoodsGname(String gname) {
        String sql = "select * from goods where gname like concat('%',?,'%')";
        return getBeanList(connection,sql,gname);
    }

    @Override
    public List<GoodsModel> getGoodsGcategory(String gcategory) {
        String sql = "select * from goods where gcategory like concat('%',?,'%')";
        return getBeanList(connection,sql,gcategory);
    }

    @Override
    public List<GoodsModel> getGoodsAll(String all) {
        String sql = "select * from goods where gid like concat('%',?,'%') or gname like concat('%',?,'%') or  gcategory like concat('%',?,'%')";
        return getBeanList(connection,sql,all,all,all);
    }
}
