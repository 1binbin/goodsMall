package com.dao;

import com.common.JdbcConnection;
import com.controller.listener.GetConnection;
import com.dao.implement.EmployeeDao;
import com.entity.EmployeeModel;

import java.sql.Connection;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:20
 * @Description
 */
public class EmployeeDaoEmpl extends BaseDao<EmployeeModel> implements EmployeeDao {
    Connection connection = GetConnection.connection;
    @Override
    public List<EmployeeModel> getEmployeeList(EmployeeModel employeeModel) {
        String sql = "select * from employee where eid = ? and epassword = ?";
        return getBeanList(connection,sql,employeeModel.getEid(),employeeModel.getEpassword());
    }

    @Override
    public List<EmployeeModel> getEid(EmployeeModel employeeModel) {
        String sql = "select * from employee where eid = ?";
        return getBeanList(connection,sql,employeeModel.getEid());
    }
    @Override
    public List<EmployeeModel> getEid(String eid) {
        String sql = "select * from employee where eid = ?";
        return getBeanList(connection,sql,eid);
    }

    @Override
    public void insertEmployee(EmployeeModel employeeModel) {
        String sql = "insert into employee(eid,epassword) values(?,?)";
        update(connection,sql,employeeModel.getEid(),employeeModel.getEpassword());
    }

    @Override
    public void updateEmployee(EmployeeModel employeeModel) {
        String sql = "update employee set epassword = ? where eid = ?";
        update(connection,sql,employeeModel.getEpassword(),employeeModel.getEid());
    }

    @Override
    public void updateEmployeeAll(EmployeeModel employeeModel) {
        String sql = "update employee set eaddress=? ,esex=? ,ename =? ,estorename=?,ephone=? where eid=?";
        update(connection,sql,employeeModel.getEaddress(),employeeModel.getEsex(),employeeModel.getEname(),employeeModel.getEstorename(),employeeModel.getEphone(),employeeModel.getEid());
    }
}
