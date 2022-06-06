package com.dao.implement;

import com.entity.CustomerModel;
import com.entity.EmployeeModel;

import java.util.Date;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:05
 */
public interface CustmerDao {
    List<CustomerModel> getCustomerList(CustomerModel customerModel);

    List<CustomerModel> getCid(CustomerModel customerModel);

    void insertCustomer(CustomerModel customerModel);

    void updateCustomer(CustomerModel customerModel);
    void insertVip(String cid, String vcategory, String vindate,String voudate);
    List<CustomerModel> getCustomerMessage(String cid);
    void updatePerson(String cid,String cname,String cnickname,String cesx);
    void addRadd(String cid,String rname,String radd);
    void updateRadd(String cid,String rname,String radd,String old);
    List<CustomerModel> raddlist(String cid,String rname);
    List<CustomerModel> getCustomer(String cid);
    /*会员管理*/
    List<CustomerModel> getCustomerVip(String search,String select);
    List<CustomerModel> getCustomerVip1(String search);
    void setCustomerVIp (String vstatus,String cid);
}
