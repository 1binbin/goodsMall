package com.business;

import com.business.businessimplement.CustomerEbi;
import com.entity.CustomerModel;
import com.entity.EntityModel;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:08
 */
public class CustomerEbimpl implements CustomerEbi {

    @Override
    public boolean login(CustomerModel customerModel) {
        List<CustomerModel> list = Daofactory.getcustomerimpl().getCustomerList(customerModel);
        return !list.isEmpty();
    }

    @Override
    public boolean insertCustomer(CustomerModel customerModel) {
        if (Daofactory.getcustomerimpl().getCid(customerModel).isEmpty()) {
            Daofactory.getcustomerimpl().insertCustomer(customerModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateCustomer(CustomerModel customerModel) {
        if (!Daofactory.getcustomerimpl().getCid(customerModel).isEmpty()) {
            Daofactory.getcustomerimpl().updateCustomer(customerModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean insertVip(String cid, String vcategory) {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String indate = simpleDateFormat.format(date);
        Calendar calendar = Calendar.getInstance();
        String outdate = "";
        List<EntityModel> list = EBofactory.getotherEbimpl().getVipCid(cid);
        if (list.isEmpty()) {
            switch (vcategory) {
                case "month":
                    calendar.setTime(date);
                    calendar.add(Calendar.MONTH, 1);
                    Date date1 = calendar.getTime();
                    outdate = simpleDateFormat.format(date1);
                    break;
                case "quarter":
                    calendar.setTime(date);
                    calendar.add(Calendar.MONTH, 3);
                    Date date2 = calendar.getTime();
                    outdate = simpleDateFormat.format(date2);
                    break;
                case "year":
                    calendar.setTime(date);
                    calendar.add(Calendar.YEAR, 1);
                    Date date3 = calendar.getTime();
                    outdate = simpleDateFormat.format(date3);
                    break;
            }
            Daofactory.getcustomerimpl().insertVip(cid, vcategory, indate, outdate);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<CustomerModel> getCustomerMessage(String cid) {
        return Daofactory.getcustomerimpl().getCustomerMessage(cid);
    }

    @Override
    public void updatePerson(String cid, String cname, String cnickname, String cesx) {
        Daofactory.getcustomerimpl().updatePerson(cid,cname,cnickname,cesx);
    }

    @Override
    public void addRadd(String cid, String rname, String radd) {
        List<CustomerModel> lis = Daofactory.getcustomerimpl().raddlist(cid,rname);
        if (lis.isEmpty()){
            Daofactory.getcustomerimpl().addRadd(cid,rname,radd);
        }
    }

    @Override
    public void updateRadd(String cid, String rname, String radd, String old) {
        List<CustomerModel> list = Daofactory.getcustomerimpl().raddlist(cid,rname);
        if (list.isEmpty()){
            Daofactory.getcustomerimpl().updateRadd(cid,rname,radd,old);
        }
    }

    @Override
    public List<CustomerModel> getCustomer(String cid) {
        return Daofactory.getcustomerimpl().getCustomer(cid);
    }

    @Override
    public List<CustomerModel> getCustomerVip(String search, String select) {
        return Daofactory.getcustomerimpl().getCustomerVip(search,select);
    }

    @Override
    public List<CustomerModel> getCustomerVip1(String search) {
        return Daofactory.getcustomerimpl().getCustomerVip1(search);
    }

    @Override
    public void setCustomerVIp(String vstatus, String cid) {
        Daofactory.getcustomerimpl().setCustomerVIp(vstatus,cid);
    }

    @Override
    public String vcategory(String cid) {
        List<CustomerModel> list= Daofactory.getcustomerimpl().getVip(cid);
        if (list.isEmpty()){
            return "";
        }else {
            return list.get(0).getVcategory();
        }
    }

    @Override
    public boolean delete(String cid) {
        List<CustomerModel> list = Daofactory.getcustomerimpl().selectISDeleteVip(cid);
        if (!list.isEmpty()){
            Daofactory.getcustomerimpl().deleteVip(list.get(0).getCid());
            return true;
        }
        return false;
    }

    @Override
    public String vcategory1(String cid) {
        List<CustomerModel> list = Daofactory.getcustomerimpl().vipList(cid);
        if (!list.isEmpty()){
            return list.get(0).getMessager();
        }
        return null;
    }

    @Override
    public List<CustomerModel> selectVip(String cid) {
        return Daofactory.getcustomerimpl().selectVip(cid);
    }

    @Override
    public List<CustomerModel> selectCustomer(String cie) {
        return Daofactory.getcustomerimpl().selectCustomer(cie);
    }
}
