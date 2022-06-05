package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.AdminDap;
import com.entity.AdminModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/5-14:07
 */
public class AdminDaoImpl extends BaseDao<AdminModel> implements AdminDap {
    Connection connection;

    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<AdminModel> getAll(AdminModel adminModel) {
        String sql = "select * from admin where aid = ? and apassword = ?";
        return getBeanList(connection,sql,adminModel.getAid(),adminModel.getApassword());
    }
}
