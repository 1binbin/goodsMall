package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.otherDao;
import com.entity.EntityModel;

import java.sql.Connection;
import java.util.List;

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
    public void insertOrder(String oid, String gid, String eid, int mnum) {
        String sql = "insert into myorder(oid,gid,eid,mnum) values(?,?,?,?)";
        update(connection, sql, oid, gid, eid, mnum);
    }

    @Override
    public void insertTicket(EntityModel entityModel) {
        String sql = "insert into ticket(oid,cid,rname,tdate,tpay,tisdelivey,tispay) values(?,?,?,?,?,?,?)";
        update(connection, sql, entityModel.getOid(), entityModel.getCid(), entityModel.getRname(), entityModel.getTdate(), entityModel.getTpay(), entityModel.getTisdelivey(), entityModel.getTispay());
    }

    @Override
    public void uodateTicket(String tispay, String oid, String cid) {
        String sql = "update ticket set tispay = ? where oid = ? and cid = ?";
        update(connection, sql, tispay, oid, cid);
    }

    @Override
    public List<EntityModel> getTicketCid(String cid) {
        String sql = "select distinct myorder.oid from myorder , ticket where ticket.oid = myorder.oid and cid = ?";
        return getBeanList(connection, sql, cid);
    }

    @Override
    public List<EntityModel> getTicketCidEid(String cid, String oid) {
        String sql = "select radd,mnum,ticket.oid,ticket.cid,ticket.rname,tdate,tpay,tisdelivey,tispay,tisover,goods.gid,goods.eid,gcategory,gname,gprice,ginprice,gnum,gdescribe,gvip, if(tispay = 'no', '去付款,取消订单', if(tisdelivey = 'no', '取消订单', if(tisover = 'no' ,'确认收货','删除订单'))) message from goodsims.ticket,myorder,goodsims.goods,raddress where raddress.rname = ticket.rname and raddress.cid = ticket.cid and ticket.oid = myorder.oid and goods.gid = myorder.gid and ticket.cid = ? and myorder.oid =?";
        return getBeanList(connection, sql, cid, oid);
    }

    @Override
    public List<EntityModel> getVipCid(String cid) {
        String sql ="select * from vip where cid = ?";
        return getBeanList(connection,sql,cid);
    }
}
