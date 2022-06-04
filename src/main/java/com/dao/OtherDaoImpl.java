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
        String sql = "insert into ticket(oid,cid,rname,tdate,tpay,tisdelivey,tispay,tisover,tisdelete) values(?,?,?,?,?,?,?,?,?)";
        update(connection, sql, entityModel.getOid(), entityModel.getCid(), entityModel.getRname(), entityModel.getTdate(), entityModel.getTpay(), entityModel.getTisdelivey(), entityModel.getTispay(),"no","no");
    }

    @Override
    public void uodateTicket(String tispay, String oid, String cid) {
        String sql = "update ticket set tispay = ? where oid = ? and cid = ?";
        update(connection, sql, tispay, oid, cid);
    }

    @Override
    public List<EntityModel> getTicketCid(String cid) {
        String sql = "select distinct myorder.oid from myorder,ticket where ticket.oid = myorder.oid and cid = ? and tisdelete = 'no'";
        return getBeanList(connection, sql, cid);
    }

    @Override
    public List<EntityModel> getTicketCidOid(String cid, String oid) {
        String sql = "select radd,mnum,ticket.oid,ticket.cid,ticket.rname,tdate,tpay,tisdelivey,tispay,tisover,goods.gid,goods.eid,gcategory,gname,gprice,ginprice,gnum,gdescribe,gvip, if(tispay = 'no', '去付款,取消订单', if(tisdelivey = 'no', '取消订单', if(tisover = 'no' ,'确认收货','删除订单'))) message from goodsims.ticket,myorder,goodsims.goods,raddress where raddress.rname = ticket.rname and raddress.cid = ticket.cid and ticket.oid = myorder.oid and goods.gid = myorder.gid and ticket.cid = ? and myorder.oid =? and tisdelete = 'no'";
        return getBeanList(connection, sql, cid, oid);
    }

    @Override
    public List<EntityModel> getVipCid(String cid) {
        String sql ="select * from vip where cid = ?";
        return getBeanList(connection,sql,cid);
    }

    @Override
    public List<EntityModel> getTicketCidChecked(String cid, String pay, String delivey, String over,String begin,String end,String search) {
        String sql = "select distinct myorder.oid from goodsims.ticket,myorder,goodsims.goods,raddress where raddress.rname = ticket.rname and raddress.cid = ticket.cid and ticket.oid = myorder.oid and goods.gid = myorder.gid and ticket.cid = ? and tispay like concat('%',?,'%') and tisdelivey like concat('%',?,'%') and tisover like concat('%',?,'%') and date_format(tdate,'%Y-%m-%d') >= date_format(?,'%Y-%m-%d') and date_format(tdate,'%Y-%m-%d') <= date_format(?,'%Y-%m-%d') and tisdelete = 'no' and (gname like concat('%',?,'%') or gdescribe like concat('%',?,'%'))";
        return getBeanList(connection,sql,cid,pay,delivey,over,begin,end,search,search);
    }

    @Override
    public List<EntityModel> getTicketCidCheckedyear(String cid, String pay, String delivey, String over) {
        String sql = "select distinct myorder.oid from myorder,ticket where ticket.oid = myorder.oid and cid = ? and tispay = ? and tisdelivey = ? and tisover = ? and tisdelete = 'no'";
        return getBeanList(connection,sql,cid,pay,delivey,over);
    }

    @Override
    public void updateTisover(String cid, String oid) {
        String sql = "update ticket set tisover = 'yes' where cid = ? and oid = ?";
        update(connection,sql,cid,oid);
    }

    @Override
    public void deleteOrder(String cid, String oid) {
        String sql = "update ticket set tisdelete = 'yes' where cid = ? and oid = ?";
        update(connection,sql,cid,oid);
    }

    @Override
    public void cancelOrder(String cid, String oid) {
        String sql = "delete from ticket where cid = ? and oid =?";
        update(connection,sql,cid,oid);
    }

    @Override
    public List<EntityModel> list(String cid, String oid) {
        String sql = "select ticket.oid,tpay,mnum ,radd,ticket.rname from goodsims.ticket,myorder,raddress where raddress.rname = ticket.rname and ticket.oid = myorder.oid and ticket.cid = ? and ticket.oid = ?";
        return getBeanList(connection,sql,cid,oid);
    }
//    有时间
    @Override
    public List<EntityModel> getOidEid(String eid, String tispay, String tisdelivey, String begin, String end, String search) {
        String sql = "select distinct ticket.oid from goodsims.ticket,raddress,myorder where ticket.oid = myorder.oid and ticket.cid = raddress.cid and eid = ? and tispay = ? and tisdelivey = ? and DATE_FORMAT(tdate,'%Y-%m-%d') >= DATE_FORMAT(?,'%Y-%m-%d') and DATE_FORMAT(tdate,'%Y-%m-%d') <= DATE_FORMAT(?,'%Y-%m-%d') and (raddress.rname like concat('%',?,'%') or ticket.oid like concat('%',?,'%') or gid like concat('%',?,'%'))";
        return getBeanList(connection,sql,eid,tispay,tisdelivey,begin,end,search,search,search);
    }
//    没有时间
    @Override
    public List<EntityModel> getOidEidAll(String eid, String tispay, String tisdelivey, String search) {
        String sql = "select  distinct ticket.oid from goodsims.ticket,raddress,myorder where ticket.oid = myorder.oid and ticket.cid = raddress.cid and eid = ? and tispay = ? and tisdelivey = ? and (raddress.rname like concat('%',?,'%') or ticket.oid like concat('%',?,'%') or gid like concat('%',?,'%'))";
        return getBeanList(connection,sql,eid,tispay,tisdelivey,search,search,search);
    }
//所有订单
    @Override
    public List<EntityModel> getOidAll(String eid, String tispay, String search) {
        String sql = "select distinct ticket.oid from goodsims.ticket,raddress,myorder where ticket.oid = myorder.oid and ticket.cid = raddress.cid and eid = ? and tispay = ?  and (raddress.rname like concat('%',?,'%') or ticket.oid like concat('%',?,'%') or gid like concat('%',?,'%'))";
        return getBeanList(connection,sql,eid,tispay,search,search,search);
    }

    @Override
    public List<EntityModel> getOidAllDate(String eid, String tispay, String begin, String end, String search) {
        String sql = "select distinct ticket.oid from goodsims.ticket,raddress,myorder where ticket.oid = myorder.oid and ticket.cid = raddress.cid and eid = ? and tispay = ?  and DATE_FORMAT(tdate,'%Y-%m-%d') >= DATE_FORMAT(?,'%Y-%m-%d') and DATE_FORMAT(tdate,'%Y-%m-%d') <= DATE_FORMAT(?,'%Y-%m-%d') and (raddress.rname like concat('%',?,'%') or ticket.oid like concat('%',?,'%') or gid like concat('%',?,'%'))";
        return getBeanList(connection,sql,eid,tispay,begin,end,search,search,search);
    }

    @Override
    public List<EntityModel> getOidEidMeaasge(String eid, String oid) {
        String sql = "select ticket.oid,tdate,gid,ticket.rname,radd,(if(tisdelivey='yes','已发货','未发货'))message from goodsims.ticket,myorder,raddress where myorder.oid = ticket.oid and ticket.rname = raddress.rname and ticket.oid = ? and eid=?";
        return getBeanList(connection,sql,oid,eid);
    }

    @Override
    public void setTisdelivey(String eid, String oid) {
        String sql = "update goodsims.ticket set tisdelivey = 'yes' where oid in (select a.oid from (select ticket.oid from ticket,myorder where ticket.oid = myorder.oid and eid = ? and ticket.oid = ?)a)";
        update(connection,sql,eid,oid);
    }
}
