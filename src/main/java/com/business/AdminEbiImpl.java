package com.business;

import com.business.businessimplement.AdminEbi;
import com.entity.AdminModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/5-14:08
 */
public class AdminEbiImpl implements AdminEbi {
    @Override
    public boolean isLogin(AdminModel adminModel) {
        List<AdminModel> list = Daofactory.getAdminDaoImpl().getAll(adminModel);
        return !list.isEmpty();
    }
}
