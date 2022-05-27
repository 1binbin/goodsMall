package com.dao;

import com.common.JdbcConnection;
import com.dao.implement.CountDao;
import com.entity.CountModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/27-9:39
 */
public class CountDaoEmpl extends BaseDao<CountModel> implements CountDao {
    Connection connection;

    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<CountModel> allgoodsCount(String eid) {
        String sql = "select count(gid)allCount from goods where eid =?";
        return getValue(connection, sql, eid);
    }
}
