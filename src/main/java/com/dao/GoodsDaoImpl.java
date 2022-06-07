package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.GoodsDao;
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
        String sql = "insert into goods(eid,gid,gname,gcategory,gprice,ginprice,gnum,gdescribe,gvip) values(?,?,?,?,?,?,?,?,?)";
        update(connection, sql, goodsModel.getEid(), goodsModel.getGid(), goodsModel.getGname(), goodsModel.getGcategory(), goodsModel.getGprice(), goodsModel.getGinprice(), goodsModel.getGnum(), goodsModel.getGdescribe(),goodsModel.getGvip());
    }

    @Override
    public void deleteGoods(String isbn, String eid) {
        String sql = "delete from goods where gid = ? and eid = ?";
        update(connection, sql, isbn, eid);
    }

    @Override
    public void update(GoodsModel goodsModel) {
        String sql = "update goods set  gname = ? , gcategory = ? , gprice = ? ,ginprice = ? , gnum = ? , gdescribe = ? ,gvip = ? where gid = ? and eid = ? ";
        update(connection, sql, goodsModel.getGname(), goodsModel.getGcategory(), goodsModel.getGprice(), goodsModel.getGinprice(), goodsModel.getGnum(), goodsModel.getGdescribe(),goodsModel.getGvip(), goodsModel.getGid(), goodsModel.getEid());
    }

    @Override
    public List<GoodsModel> getGoodslist(String eid, int start, int end) {
        String sql = "select * from goods where eid = ? limit ? , ?";
        return getBeanList(connection, sql, eid, start, end);
    }


    @Override
    public List<GoodsModel> getGoods(String gid, String eid) {
        String sql = "select * from goods where gid like concat('%',?,'%') and eid = ?";
        return getBeanList(connection, sql, gid, eid);
    }

    @Override
    public List<GoodsModel> getGoodsGid(String gid, String eid, int start, int end) {
        String sql = "select * ,(select count(gid) from goods where gid like concat('%',?,'%') and eid = ?)allCount from goods where gid like concat('%',?,'%') and eid = ? limit ? ,?";
        return getBeanList(connection, sql, gid, eid, gid, eid, start, end);
    }

    @Override
    public List<GoodsModel> getGoodsGname(String gname, String eid, int start, int end) {
        String sql = "select * ,(select count(gid) from goods where gname like concat('%',?,'%') and eid = ?)allCount from goods where gname like concat('%',?,'%') and eid = ? limit ? ,?";
        return getBeanList(connection, sql, gname, eid, gname, eid, start, end);
    }

    @Override
    public List<GoodsModel> getGoodsGcategory(String gcategory, String eid, int start, int end) {
        String sql = "select *,(select count(gid) from goods where gcategory  like concat('%',?,'%') and eid = ?)allCount from goods where gcategory like concat('%',?,'%') and eid = ? limit ? ,?";
        return getBeanList(connection, sql, gcategory, eid, gcategory, eid, start, end);
    }

    @Override
    public List<GoodsModel> getGoodsAll(String all, String eid, int start, int end) {
        String sql = "select * ,(select count(gid) from goods where  (gid like concat('%',?,'%') or gname like concat('%',?,'%') or  gcategory like concat('%',?,'%')) and eid = ?)allCount from goods where (gid like concat('%',?,'%') or gname like concat('%',?,'%') or  gcategory like concat('%',?,'%')) and eid = ? limit ? ,?";
        return getBeanList(connection, sql, all, all, all, eid, all, all, all, eid, start, end);
    }

    @Override
    public List<GoodsModel> getdEid() {
        String sql = "select distinct eid from goods";
        return getBeanList(connection, sql);
    }

    @Override
    public List<GoodsModel> getdEidGoods(String eid) {
        String sql = "select * from goods where eid = ? limit 150 where gnum > 0";
        return getBeanList(connection, sql, eid);
    }

    @Override
    public List<GoodsModel> getGcategory() {
        String sql = "select * from goodsc";
        return getBeanList(connection, sql);
    }

    @Override
    public List<GoodsModel> getGidEid(String gid,String eid) {
        String sql = "select * from goods where gid = ? and eid = ?";
        return getBeanList(connection,sql,gid,eid);
    }

    @Override
    public List<GoodsModel> getGoodsSearch(String search) {
        String sql ="select * from goods where gname like concat('%',?,'%') or gdescribe like concat('%',?,'%')";
        return getBeanList(connection,sql,search,search);
    }

    @Override
    public List<GoodsModel> getGoodsAll() {
        String sql = "select * from goods limit 250";
        return getBeanList(connection,sql);
    }

    @Override
    public List<GoodsModel> getGoodsGcategory(String sgcategory,String search) {
        String sql ="select * from  goodsims.goods where gcategory like concat('%',?,'%') and (gname like concat('%',?,'%') or gdescribe like concat('%',?,'%'))";
        return getBeanList(connection,sql,sgcategory,search,search);
    }

    @Override
    public List<GoodsModel> getGoodsPrice(double down, double up, String search) {
        String sql ="select * from  goodsims.goods where gprice between ? and ? and (gname like concat('%',?,'%') or gdescribe like concat('%',?,'%'))";
        return getBeanList(connection,sql,down,up,search,search);
    }

    @Override
    public List<GoodsModel> getGoodsTime(String search) {
        String sql = "select * from goodsims.goods where (gname like concat('%',?,'%') or gdescribe like concat('%',?,'%')) order by gdate desc ";
        return getBeanList(connection,sql,search,search);
    }

    @Override
    public List<GoodsModel> getGcategory(String search) {
        String sql ="select * from goods where gcategory = ?";
        return getBeanList(connection,sql,search);
    }
}
