package com.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * @author hongxiaobin
 * @create 2021/12/11-20:46
 * @function 用于数据库连接和针对注册登录的操作
 */
@SuppressWarnings("ALL")
public class JdbcConnection {
    /**
     * @Author: hongxiaobin
     * @Description: 连接数据库
     * @Date: 2022/3/20 14:48
     * @Param: null
     * @Return: Connection
     */
    public static Connection getConnection() throws Exception {
        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/goodsMall");
        Connection connection = dataSource.getConnection();
        return connection;
    }
}