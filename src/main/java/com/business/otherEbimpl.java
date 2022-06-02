package com.business;

import com.business.businessimplement.otherEbi;
import com.entity.EntityModel;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:21
 */
public class otherEbimpl implements otherEbi {
    @Override
    public void insertOrder(String oid, String gid, String eid) {
        Daofactory.getotherDaoImpl().insertOrder(oid,gid,eid);
    }

    @Override
    public void insertTicket(EntityModel entityModel) {
        Daofactory.getotherDaoImpl().insertTicket(entityModel);
    }

    @Override
    public void uodateTicket(String tispay, String oid, String cid) {
        Daofactory.getotherDaoImpl().uodateTicket(tispay,oid,cid);
    }
}
