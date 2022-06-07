package com.business.businessimplement;

import com.entity.EntityModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:21
 */
public interface otherEbi {
    void insertOrder(String oid, String gid, String eid, int mnum);

    void insertTicket(EntityModel entityModel);

    void uodateTicket(String tispay, String oid, String cid);

    List<EntityModel> getTicketCid(String cid);

    List<EntityModel> getTicketCidEid(String cid, String oid);
    List<EntityModel> getVipCid(String cid);
    List<List<EntityModel>> getSelectTicket(String cid,String pay,String delivey,String over,String type,String search);
    /*修改订单状态*/
    void updateTisover(String cid,String oid);
    void deleteOrder(String cid,String oid);
    void cancelOrder(String cid,String oid);
    String[] getLIst(String cid,String oid);
    /*商家订单*/
    List<List<EntityModel>> getList(String eid,String tispay,String tisdelivey,String begin,String end,String search,String type);
    void setTisdelivey(String eid,String oid);
    /*关注店铺*/
    boolean getFocus(String cid,String eid);
    List<EntityModel> getFollow(String cid, String eid);
}
