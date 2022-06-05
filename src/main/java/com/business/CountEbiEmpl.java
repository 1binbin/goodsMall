package com.business;

import com.business.businessimplement.CountEbi;
import com.entity.CountModel;
import com.entity.CustomerModel;

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

    @Override
    public int getAllCart(String cid) {
        List<CountModel> countModels = Daofactory.getcountDaoimpl().allGoodsCart(cid);
        if (!countModels.isEmpty()){
            return countModels.get(0).getAllCount();
        }
        return 0;
    }

}
