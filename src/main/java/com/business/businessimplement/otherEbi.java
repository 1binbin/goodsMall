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

    List<EntityModel> getTicketCidEid(String cid, String oid,String search);
    List<EntityModel> getVipCid(String cid);
    List<List<EntityModel>> getSelectTicket(String cid,String pay,String delivey,String over,String type,String search);
}
