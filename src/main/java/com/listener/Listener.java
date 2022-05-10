package com.listener;

import com.business.EBofactory;
import com.business.EmployeeEbi;
import com.entity.EmployeeModel;
import com.entity.GoodsModel;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.ArrayList;

/**监听器，初始化信息
 * @Author hongxiaobin
 * @Time 2022/5/9-8:44
 */
@WebListener
public class Listener implements ServletContextListener {/*
    private ServletContext servletContext = null;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        获取所有商品
        servletContext = sce.getServletContext();
//        获取所有员工
        ArrayList<EmployeeModel> employeeModelArrayList = (ArrayList<EmployeeModel>) EBofactory.getemployeeebiempl().getEmployeeList();
        servletContext.setAttribute("employee",employeeModelArrayList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        servletContext = sce.getServletContext();
        servletContext.removeAttribute("employee");
    }*/
}
