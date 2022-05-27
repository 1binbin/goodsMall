package com.dao;

import com.entity.CountModel;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * @author hongxiaobin
 * @create 2022/3/2-9:44
 * @description
 */
public abstract class BaseDao<T> {
    private final QueryRunner queryRunner = new QueryRunner();
    private final Class<T> type;

    public BaseDao() {
        Class clazz = this.getClass();
        ParameterizedType parameterizedType = (ParameterizedType) clazz.getGenericSuperclass();
        Type[] types = parameterizedType.getActualTypeArguments();
        this.type = (Class<T>) types[0];
    }

    /**
     * @Author: hongxiaobin
     * @Description: 通用增删改操作
     * @Date: 2022/3/20 14:53
     * @Param: Connection , String ,Object...
     * @Return: int
     */
    public int update(Connection connection, String sql, Object... params) {
        int count = 0;
        try {
            count = queryRunner.update(connection, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    /**
     * @Author: hongxiaobin
     * @Description: 获取多个对象
     * @Date: 2022/3/20 14:54
     * @Param: Connection , String ,Object...
     * @Return: List<T>
     */
    public List<T> getBeanList(Connection connection, String sql, Object... params) {
        List<T> list = null;
        try {
            list = queryRunner.query(connection, sql, new BeanListHandler<T>(type), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * @Author: hongxiaobin
     * @Description: 获取一个值
     * @Date: 2022/3/20 14:54
     * @Param: Connection , String ,Object...
     * @Return: Object
     */
    public List<T> getValue(Connection connection, String sql, Object... params) {
        List<T> list = null;
        try {
            list = queryRunner.query(connection, sql, new BeanListHandler<>(type), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
