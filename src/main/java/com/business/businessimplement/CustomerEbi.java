package com.business.businessimplement;

import com.entity.CustomerModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:06
 */
public interface CustomerEbi {
    boolean login(CustomerModel customerModel);

    boolean insertCustomer(CustomerModel customerModel);

    boolean updateCustomer(CustomerModel customerModel);
    boolean insertVip(String cid, String vcategory);
    List<CustomerModel> getCustomerMessage(String cid);
    void updatePerson(String cid,String cname,String cnickname,String cesx);

    void addRadd(String cid,String rname,String radd);
    void updateRadd(String cid,String rname,String radd,String old);
    List<CustomerModel> getCustomer(String cid);
    List<CustomerModel> getCustomerVip(String search,String select);
    List<CustomerModel> getCustomerVip1(String search);
    void setCustomerVIp (String vstatus,String cid);
}
