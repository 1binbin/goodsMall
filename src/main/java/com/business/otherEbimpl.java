package com.business;

import com.business.businessimplement.otherEbi;
import com.entity.EntityModel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
    public List<EntityModel> getTicketCidEid(String cid, String eid,String search) {
        return Daofactory.getotherDaoImpl().getTicketCidOid(cid,eid,search);
    }

    @Override
    public List<EntityModel> getVipCid(String cid) {
        return Daofactory.getotherDaoImpl().getVipCid(cid);
    }

    @Override
    public List<List<EntityModel>> getSelectTicket(String cid, String pay, String delivey, String over,String type,String search) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        今日
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
//        开始日
        Date date1 = date;
        boolean is;
        if ("onemonth".equals(type)){
            calendar.add(Calendar.MONTH,-1);
            date1 = calendar.getTime();
            is = true;
        }else if ("threemonth".equals(type)){
            calendar.add(Calendar.MONTH,-3);
            date1 = calendar.getTime();
            is = true;
        }else if ("harfyear".equals(type)){
            calendar.add(Calendar.MONTH,-6);
            date1 = calendar.getTime();
            is = true;
        }else {
            is = false;
        }
        String begin = simpleDateFormat.format(date1);
        String end = simpleDateFormat.format(date);
        List<List<EntityModel>> list = new ArrayList<>();
        List<EntityModel> oidList;
        if (is){
            oidList = Daofactory.getotherDaoImpl().getTicketCidChecked(cid, pay, delivey, over,begin,end);
        }else {
            oidList = Daofactory.getotherDaoImpl().getTicketCidCheckedyear(cid, pay, delivey, over);
        }
        for (EntityModel entityModel : oidList) {
            List<EntityModel> list1 = Daofactory.getotherDaoImpl().getTicketCidOid(cid, entityModel.getOid(),search);
            list.add(list1);
        }
        return list;
    }
}
