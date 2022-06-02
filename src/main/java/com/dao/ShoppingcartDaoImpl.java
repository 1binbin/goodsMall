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
        String sql = "insert into shoppingcart(cid,eid,gid,snum) values(?,?,?,?)";
        update(connection,sql,shoppingcartModel.getCid(),shoppingcartModel.getEid(),shoppingcartModel.getGid(),shoppingcartModel.getSnum());
    }

    @Override
    public List<ShoppingcartModel> getCart(String cid, String eid, String gid) {
        String sql ="select * from shoppingcart where cid=? and eid = ? and gid = ?";
        return getBeanList(connection,sql,cid,eid,gid);
    }

    @Override
    public void updateCart(ShoppingcartModel shoppingcartModel) {
        String sel = "update shoppingcart set snum = snum + ? where cid =? and eid = ? and gid =?";
        update(connection,sel,shoppingcartModel.getSnum(),shoppingcartModel.getCid(),shoppingcartModel.getEid(),shoppingcartModel.getGid());
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
}
