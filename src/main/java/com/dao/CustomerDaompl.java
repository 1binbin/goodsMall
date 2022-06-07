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
        String sql = "insert into vip(cid,vcategory,vindate,voutdate,vstatus) values(?,?,?,?,?)";
        update(connection, sql, cid, vcategory, vindate, voudate,"no");
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

    @Override
    public List<CustomerModel> getCustomerVip(String search, String select) {
        String sql = "select customer.cid ,cname,cnickname,csex,(if(vcategory = 'month','年度会员',if(vcategory = 'quarter','季度会员','年度会员')))as vcategory ,vindate,voutdate,if(vstatus='is','解冻','冻结') as vstatus from customer,vip where customer.cid = vip.cid and (vip.cid = ? or cname  like concat('%',?,'%') or vcategory  like concat('%',?,'%')) and vstatus like concat('%',?,'%')";
        return getBeanList(connection,sql,search,search,search,select);
    }

    @Override
    public List<CustomerModel> getCustomerVip1(String search) {
        String sql = "select customer.cid ,cname,cnickname,csex,(if(vcategory = 'month','年度会员',if(vcategory = 'quarter','季度会员','年度会员')))as vcategory ,vindate,voutdate,if(vstatus='is','解冻','冻结') as vstatus from customer,vip where customer.cid = vip.cid and (vip.cid = ? or cname  like concat('%',?,'%') or vcategory  like concat('%',?,'%'))";
        return getBeanList(connection,sql,search,search,search);
    }

    @Override
    public void setCustomerVIp(String vstatus,String cid) {
        String sql = "update vip set vstatus = ? where cid = ?";
        update(connection,sql,vstatus,cid);
    }

    @Override
    public List<CustomerModel> getVip(String cid) {
        String sql = "select vcategory from vip where cid = ? and vstatus = 'no'";
        return getBeanList(connection,sql,cid);
    }

    @Override
    public void deleteVip(String cid) {
        String sql = "delete from vip where cid = ?";
        update(connection, sql,cid);
    }

    @Override
    public List<CustomerModel> selectISDeleteVip(String cid) {
        String sql = "select vip.cid from vip,customer where vip.cid = customer.cid and vip.cid = ? and date_format(voutdate,'%Y-%m-%d') <= date_format(now(),'%Y-%m-%d')";
        return getBeanList(connection, sql,cid);
    }
}
