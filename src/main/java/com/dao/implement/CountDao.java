package com.dao.implement;

import com.entity.CountModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/27-9:39
 */
public interface CountDao {
    List<CountModel> allgoodsCount(String eid);
}
