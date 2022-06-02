package com.business;

import com.business.businessimplement.EmployeeEbi;
import com.entity.EmployeeModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:23
 * @Description 根据用户ID获取值
 */
public class EmployeeEbiempl implements EmployeeEbi {

    @Override
    public boolean login(EmployeeModel employeeModel) {
        List<EmployeeModel> employeeModels = Daofactory.getemloyeedaoimpl().getEmployeeList(employeeModel);
        return !employeeModels.isEmpty();
     }

    @Override
    public boolean insertEmployee(EmployeeModel employeeModel) {
        if (Daofactory.getemloyeedaoimpl().getEid(employeeModel).isEmpty()){
            Daofactory.getemloyeedaoimpl().insertEmployee(employeeModel);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateEmployee(EmployeeModel employeeModel) {
        if (!Daofactory.getemloyeedaoimpl().getEid(employeeModel).isEmpty()){
            Daofactory.getemloyeedaoimpl().updateEmployee(employeeModel);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<EmployeeModel> getEmployee(String eid) {
        return Daofactory.getemloyeedaoimpl().getEid(eid);
    }
}
