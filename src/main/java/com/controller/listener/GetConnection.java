package com.controller.listener;

import com.common.JdbcConnection;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @Author hongxiaobin
 * @Time 2022/6/9-17:07
 */
public class GetConnection implements ServletContextListener {
    public static Connection connection;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
