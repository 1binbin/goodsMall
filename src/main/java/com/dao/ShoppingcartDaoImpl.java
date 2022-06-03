package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.shoppingcartDao;
import com.entity.ShoppingcartModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:34
 */
public class ShoppingcartDaoImpl extends BaseDao<ShoppingcartModel> implements shoppingcartDao {
    Connection connection;

    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertCart(ShoppingcartModel shoppingcartModel) {
        String sql = "insert into shoppingcart(cid,eid,gid) values(?,?,?)";
        update(connection,sql,shoppingcartModel.getCid(),shoppingcartModel.getEid(),shoppingcartModel.getGid());
    }

    @Override
    public List<ShoppingcartModel> getCart(String cid, String eid, String gid) {
        String sql ="select * from shoppingcart where cid=? and eid = ? and gid = ?";
        return getBeanList(connection,sql,cid,eid,gid);
    }

    @Override
    public List<ShoppingcartModel> getCidEid(String cid) {
        String sql ="select distinct eid from shoppingcart where cid = ?";
        return getBeanList(connection,sql,cid);
    }

    @Override
    public List<ShoppingcartModel> getCidEidGid(String cid, String eid) {
        String sql ="select * from shoppingcart where cid=? and eid =?";
        return getBeanList(connection,sql,cid,eid);
    }

    @Override
    public void deleteCart(String cid, String eid, String gid) {
        String sql ="delete from shoppingcart where cid=? and eid =? and gid =?";
        update(connection,sql,cid,eid,gid);
    }

    @Override
    public void deleteCartAll(String cid) {
        String sql ="delete from shoppingcart where cid=?";
        update(connection,sql,cid);
    }

    @Override
    public List<ShoppingcartModel> getCartEid(String cid, String search) {
        String sql = "select distinct shoppingcart.eid from goodsims.goods,goodsims.employee,shoppingcart where shoppingcart.gid = goods.gid and shoppingcart.eid = employee.eid and cid = ? and (gname like concat('%',?,'%') or gdescribe like concat('%',?,'%') or gcategory like concat('%',?,'%') or estorename like concat('%',?,'%'))";
        return getBeanList(connection,sql,cid,search,search,search,search);
    }

    @Override
    public List<ShoppingcartModel> getCartEidSearch(String cid, String eid) {
        String sql = "select gname,gdescribe,gprice,estorename,goods.eid,goods.gid from goodsims.goods,goodsims.employee,shoppingcart where shoppingcart.gid = goods.gid and shoppingcart.eid = employee.eid and shoppingcart.eid = ? and cid=?";
        return getBeanList(connection,sql,eid,cid);
    }
}
