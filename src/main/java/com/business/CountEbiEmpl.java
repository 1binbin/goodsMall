package com.business;

import com.business.businessimplement.CountEbi;
import com.entity.CountModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/5/27-9:44
 */
public class CountEbiEmpl implements CountEbi {
    @Override
    public int getallCount(String eid) {
        List<CountModel> countModels = Daofactory.getcountDaoimpl().allgoodsCount(eid);
        if (!countModels.isEmpty()){
            return countModels.get(0).getAllCount();
        }
        return 1;
    }
}
