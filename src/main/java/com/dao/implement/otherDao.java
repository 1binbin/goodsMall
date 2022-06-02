package com.dao.implement;

import com.dao.OtherDaoImpl;
import com.entity.EntityModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:20
 */
public interface otherDao {
    void insertOrder(String oid,String gid,String eid);
    void insertTicket(EntityModel entityModel);
    void uodateTicket(String tispay,String oid,String cid);
    List<EntityModel> getTicketCid(String cid);
    List<EntityModel> getTicketCidEid(String cid,String eid);
}
