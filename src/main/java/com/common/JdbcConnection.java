package com.common;

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
        Properties properties = new Properties();
        String path = JdbcConnection.class.getClassLoader().getResource("jdbc.properties").getPath();
        path = URLDecoder.decode(path, "utf-8");
        FileInputStream fileInputStream = new FileInputStream(path);
        properties.load(fileInputStream);
        String driver = properties.get("driver").toString();
        String user = properties.get("user").toString();
        String password = properties.get("password").toString();
        String url = properties.get("url").toString();
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, user, password);
        return connection;
    }
}