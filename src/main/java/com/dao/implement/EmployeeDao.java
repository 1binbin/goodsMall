package com.dao.implement;

import com.entity.EmployeeModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:20
 * @Description
 */
public interface EmployeeDao {
    List<EmployeeModel> getEmployeeList(EmployeeModel employeeModel);
    List<EmployeeModel> getEid(EmployeeModel employeeModel);
    List<EmployeeModel> getEid(String eid);
    void insertEmployee(EmployeeModel employeeModel);
    void updateEmployee(EmployeeModel employeeModel);
    void updateEmployeeAll(EmployeeModel employeeModel);
}
