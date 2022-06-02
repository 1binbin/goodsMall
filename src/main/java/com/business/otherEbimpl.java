package com.business;

import com.business.businessimplement.otherEbi;
import com.entity.EntityModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-16:21
 */
public class otherEbimpl implements otherEbi {
    @Override
    public void insertOrder(String oid, String gid, String eid,int mnum) {
        Daofactory.getotherDaoImpl().insertOrder(oid,gid,eid,mnum);
    }

    @Override
    public void insertTicket(EntityModel entityModel) {
        Daofactory.getotherDaoImpl().insertTicket(entityModel);
    }

    @Override
    public void uodateTicket(String tispay, String oid, String cid) {
        Daofactory.getotherDaoImpl().uodateTicket(tispay,oid,cid);
    }

    @Override
    public List<EntityModel> getTicketCid(String cid) {
        return Daofactory.getotherDaoImpl().getTicketCid(cid);
    }

    @Override
    public List<EntityModel> getTicketCidEid(String cid, String eid) {
        return Daofactory.getotherDaoImpl().getTicketCidEid(cid,eid);
    }

    @Override
    public List<EntityModel> getVipCid(String cid) {
        return Daofactory.getotherDaoImpl().getVipCid(cid);
    }
}
