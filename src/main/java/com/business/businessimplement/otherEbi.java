package com.business.businessimplement;

import com.entity.EntityModel;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:21
 */
public interface otherEbi {
    void insertOrder(String oid,String gid,String eid);
    void insertTicket(EntityModel entityModel);
    void uodateTicket(String tispay,String oid,String cid);
}
