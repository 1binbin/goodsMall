package com.dao;

import com.common.JdbcConnection;
import com.entity.CustomerModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:06
 */
public class CustomerDaompl extends BaseDao<CustomerModel>implements CustmerDao{
    Connection connection;
    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CustomerModel> getCustomerList(CustomerModel customerModel) {
        String sql = "select * from customer where cid = ? and cpassword = ?";
        return getBeanList(connection,sql,customerModel.getCid(),customerModel.getCpassword());
    }

    @Override
    public List<CustomerModel> getCid(CustomerModel customerModel) {
        String sql = "select * from customer where cid = ?";
        return getBeanList(connection,sql,customerModel.getCid());
    }

    @Override
    public void insertCustomer(CustomerModel customerModel) {
        String sql = "insert into customer(cid,cpassword) values(?,?)";
        update(connection,sql,customerModel.getCid(),customerModel.getCpassword());
    }

    @Override
    public void updateCustomer(CustomerModel customerModel) {
        String sql = "update customer set cpassword = ? where cid = ?";
        update(connection,sql,customerModel.getCpassword(),customerModel.getCid());
    }
}
