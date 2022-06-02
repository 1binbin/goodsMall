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
}
