package com.business;

import com.business.Daofactory;
import com.business.businessimplement.ShoppingcartEbi;
import com.entity.ShoppingcartModel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:41
 */
public class ShoppingcartEmpl implements ShoppingcartEbi {
    @Override
    public void insertCart(ShoppingcartModel shoppingcartModel) {
        List<ShoppingcartModel> shoppingcartModelList = Daofactory.getShoppingDaoumpl().getCart(shoppingcartModel.getCid(),shoppingcartModel.getEid(),shoppingcartModel.getGid());
        if (!shoppingcartModelList.isEmpty()){
            Daofactory.getShoppingDaoumpl().updateCart(shoppingcartModel);
        }else {
            Daofactory.getShoppingDaoumpl().insertCart(shoppingcartModel);
        }
    }

    public List<List<ShoppingcartModel>> getCidGidEidHash(String cid){
        List<List<ShoppingcartModel>> list = new ArrayList<>();
//        得到商家
        List<ShoppingcartModel> shoppingcartModelList = Daofactory.getShoppingDaoumpl().getCidEid(cid);
        for (ShoppingcartModel shoppingcartModel : shoppingcartModelList) {
            List<ShoppingcartModel> shoppingcartModelList1 = Daofactory.getShoppingDaoumpl().getCidEidGid(cid, shoppingcartModel.getEid());
            list.add(shoppingcartModelList1);
        }
        return list;
    }
}
