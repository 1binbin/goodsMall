package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.CustmerDao;
import com.entity.CustomerModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:06
 */
public class CustomerDaompl extends BaseDao<CustomerModel> implements CustmerDao {
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
        return getBeanList(connection, sql, customerModel.getCid(), customerModel.getCpassword());
    }

    @Override
    public List<CustomerModel> getCid(CustomerModel customerModel) {
        String sql = "select * from customer where cid = ?";
        return getBeanList(connection, sql, customerModel.getCid());
    }

    @Override
    public void insertCustomer(CustomerModel customerModel) {
        String sql = "insert into customer(cid,cpassword) values(?,?)";
        update(connection, sql, customerModel.getCid(), customerModel.getCpassword());
    }

    @Override
    public void updateCustomer(CustomerModel customerModel) {
        String sql = "update customer set cpassword = ? where cid = ?";
        update(connection, sql, customerModel.getCpassword(), customerModel.getCid());
    }

    @Override
    public void insertVip(String cid, String vcategory, String vindate, String voudate) {
        String sql = "insert into vip(cid,vcategory,vindate,voutdate) values(?,?,?,?)";
        update(connection, sql, cid, vcategory, vindate, voudate);
    }

    @Override
    public List<CustomerModel> getCustomerMessage(String cid) {
        String sql = "select customer.cid,csex,cname,cnickname,rname,radd from raddress,customer where customer.cid = raddress.cid and  customer.cid = ?";
        return getBeanList(connection, sql, cid);
    }

    @Override
    public void updatePerson(String cid, String cname, String cnickname, String cesx) {
        String sql = "update customer set cname =? ,cnickname = ? ,csex = ? where cid = ?";
        update(connection, sql, cname, cnickname, cesx, cid);
    }

    @Override
    public void addRadd(String cid, String rname, String radd) {
        String sql = "insert into raddress(cid,rname,radd) values(?,?,?)";
        update(connection,sql,cid,rname,radd);
    }

    @Override
    public void updateRadd(String cid, String rname, String radd, String old) {
        String sql = "update raddress set rname = ? ,radd = ? where cid = ? and rname = ?";
        update(connection,sql,rname,radd,cid,old);
    }

    @Override
    public List<CustomerModel> raddlist(String cid, String rname) {
        String sql = "select * from raddress where cid = ? and rname = ?";
        return getBeanList(connection, sql, cid, rname);
    }

    @Override
    public List<CustomerModel> getCustomer(String cid) {
        String sql = "select * from customer where cid = ?";
        return getBeanList(connection,sql,cid);
    }
}
