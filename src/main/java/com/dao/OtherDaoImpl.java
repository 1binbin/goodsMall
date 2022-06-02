package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.otherDao;
import com.entity.EntityModel;

import java.sql.Connection;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:19
 */
public class OtherDaoImpl extends BaseDao<EntityModel> implements otherDao {
    Connection connection;

    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public void insertOrder(String oid, String gid, String eid) {
        String sql ="insert into myorder(oid,gid,eid) values(?,?,?)";
        update(connection,sql,oid,gid,eid);
    }

    @Override
    public void insertTicket(EntityModel entityModel) {
        String sql ="insert into ticket(oid,cid,rname,tdate,tpay,tisdelivey,tispay) values(?,?,?,?,?,?,?)";
        update(connection,sql,entityModel.getOid(),entityModel.getCid(),entityModel.getRname(),entityModel.getTdate(),entityModel.getTpay(),entityModel.getTisdelivey(),entityModel.getTispay());
    }

    @Override
    public void uodateTicket(String tispay,String oid,String cid) {
        String sql ="update ticket set tispay = ? where oid = ? and cid = ?";
        update(connection,sql,tispay,oid,cid);
    }
}
