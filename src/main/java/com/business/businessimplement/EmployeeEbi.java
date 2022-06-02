package com.business.businessimplement;

import com.entity.CustomerModel;
import com.entity.EmployeeModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:23
 * @Description
 */
public interface EmployeeEbi {
    boolean login(EmployeeModel employeeModel);
    boolean insertEmployee(EmployeeModel employeeModel);
    boolean updateEmployee(EmployeeModel employeeModel);
    List<EmployeeModel> getEmployee(String eid);
}
