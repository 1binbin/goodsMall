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
    List<EntityModel> getTicketCidOid(String cid, String oid,String search);
    List<EntityModel> getVipCid(String cid);
    List<EntityModel> getTicketCidChecked(String cid,String pay,String delivey,String over,String begin,String end);
    List<EntityModel> getTicketCidCheckedyear(String cid,String pay,String delivey,String over);
}
