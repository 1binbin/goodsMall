package com.business;

import com.dao.EmployeeDaoEmpl;
import com.dao.GoodsDaoImpl;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-16:07
 * @Description 获取数据访问对象
 */
public class Daofactory {
    public static GoodsDaoImpl getgoodsdaoimpl(){
        return new GoodsDaoImpl();
    }
    public static EmployeeDaoEmpl getemloyeedaoimpl(){
        return new EmployeeDaoEmpl();
    }
}
