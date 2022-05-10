package com.dao;

import com.common.JdbcConnection;
import com.entity.EmployeeModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:20
 * @Description
 */
public class EmployeeDaoEmpl extends BaseDao<EmployeeModel> implements EmployeeDao{
    Connection connection;
    {
        try {
            connection = JdbcConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<EmployeeModel> getEmployeeList(EmployeeModel employeeModel) {
        String sql = "select * from employee where eid = ? and epassword = ? and erole = ?";
        return getBeanList(connection,sql,employeeModel.getEid(),employeeModel.getEpassword(),employeeModel.getErole());
    }

    @Override
    public List<EmployeeModel> getEid(EmployeeModel employeeModel) {
        String sql = "select * from employee where eid = ?";
        return getBeanList(connection,sql,employeeModel.getEid());
    }

    @Override
    public void insertEmployee(EmployeeModel employeeModel) {
        String sql = "insert into employee(eid,epassword,erole) values(?,?,?)";
        update(connection,sql,employeeModel.getEid(),employeeModel.getEpassword(),employeeModel.getErole());
    }

    @Override
    public void updateEmployee(EmployeeModel employeeModel) {
        String sql = "update employee set epassword = ? where eid = ?";
        update(connection,sql,employeeModel.getEpassword(),employeeModel.getEid());
    }
}
