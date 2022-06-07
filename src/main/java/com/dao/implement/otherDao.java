package com.dao.implement;

import com.dao.OtherDaoImpl;
import com.entity.EntityModel;

import javax.swing.*;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:20
 */
public interface otherDao {
    void insertOrder(String oid,String gid,String eid,int mnum);
    void insertTicket(EntityModel entityModel);
    void uodateTicket(String tispay,String oid,String cid);
    List<EntityModel> getTicketCid(String cid);
    List<EntityModel> getTicketCidOid(String cid, String oid);
    List<EntityModel> getVipCid(String cid);
    List<EntityModel> getTicketCidChecked(String cid,String pay,String delivey,String over,String begin,String end,String search);
    List<EntityModel> getTicketCidCheckedyear(String cid,String pay,String delivey,String over);
    /*修改订单状态*/
    void updateTisover(String cid,String oid);
    void deleteOrder(String cid,String oid);
    void cancelOrder(String cid,String oid);
    List<EntityModel> list(String cid,String oid);
    /*商家订单管理*/
    List<EntityModel> getOidEid(String eid,String tispay,String tisdelivey,String begin,String end,String search);
    List<EntityModel> getOidEidAll(String eid,String tispay,String tisdelivey,String search);
    List<EntityModel> getOidAll(String eid,String tispay,String search);
    List<EntityModel> getOidAllDate(String eid,String tispay,String begin,String end,String search);
    List<EntityModel> getOidEidMeaasge(String eid,String oid);
    /*一键发货*/
    void setTisdelivey(String eid,String oid);
    void insertFollow(String cid,String eid);
    void deleteFollow(String cid,String eid);
    List<EntityModel> getFollow(String cid, String eid);
}
