package com.dao;

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
    void insertEmployee(EmployeeModel employeeModel);
    void updateEmployee(EmployeeModel employeeModel);
}
