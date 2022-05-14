package com.business;

import com.entity.CustomerModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:08
 */
public class CustomerEbimpl implements CustomerEbi{

    @Override
    public boolean login(CustomerModel customerModel) {
        List<CustomerModel> list = Daofactory.getcustomerimpl().getCustomerList(customerModel);
        return !list.isEmpty();
    }

    @Override
    public boolean insertCustomer(CustomerModel customerModel) {
        if (Daofactory.getcustomerimpl().getCid(customerModel).isEmpty()){
            Daofactory.getcustomerimpl().insertCustomer(customerModel);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateCustomer(CustomerModel customerModel) {
       if (!Daofactory.getcustomerimpl().getCid(customerModel).isEmpty()){
           Daofactory.getcustomerimpl().updateCustomer(customerModel);
           return true;
       }else {
           return false;
       }
    }
}
