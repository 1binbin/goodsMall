package com.business.businessimplement;

import com.entity.ShoppingcartModel;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:41
 */
public interface ShoppingcartEbi {
    void insertCart(ShoppingcartModel shoppingcartModel);
    void deleteCart(String cid,String eid,String gid);
    void deleteCartAll(String cid);
}
