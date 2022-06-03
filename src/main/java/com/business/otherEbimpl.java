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
    public List<EntityModel> getTicketCidEid(String cid, String eid) {
        return Daofactory.getotherDaoImpl().getTicketCidOid(cid,eid);
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
            oidList = Daofactory.getotherDaoImpl().getTicketCidChecked(cid, pay, delivey, over,begin,end,search);
        }else {
            oidList = Daofactory.getotherDaoImpl().getTicketCidCheckedyear(cid, pay, delivey, over);
        }
        for (EntityModel entityModel : oidList) {
            List<EntityModel> list1 = Daofactory.getotherDaoImpl().getTicketCidOid(cid, entityModel.getOid());
            list.add(list1);
        }
        return list;
    }

    @Override
    public void updateTisover(String cid, String oid) {
        Daofactory.getotherDaoImpl().updateTisover(cid,oid);
    }

    @Override
    public void deleteOrder(String cid, String oid) {
        Daofactory.getotherDaoImpl().deleteOrder(cid,oid);
    }

    @Override
    public void cancelOrder(String cid, String oid) {
        Daofactory.getotherDaoImpl().cancelOrder(cid,oid);
    }

    @Override
    public String[] getLIst(String cid, String oid) {
        List<EntityModel> list = Daofactory.getotherDaoImpl().list(cid,oid);
        int numCount = 0;
        String[] result = new String[3];
        if (!list.isEmpty()){
            for (EntityModel entityModel : list) {
                numCount += entityModel.getMnum();
            }
            result[0] = String.valueOf(numCount);
            result[1] = String.valueOf(list.get(0).getTpay());
            result[2] = list.get(0).getRname() + list.get(0).getRadd();
        }
        return result;
    }
}
