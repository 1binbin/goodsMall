package com.dao.implement;

import com.entity.AdminModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/5-14:07
 */
public interface AdminDap {
    List<AdminModel> getAll(AdminModel adminModel);
}
