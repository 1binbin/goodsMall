package com.dao.implement;

import com.entity.ShoppingcartModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/6/2-10:33
 */
public interface shoppingcartDao {
    void insertCart(ShoppingcartModel shoppingcartModel);
    List<ShoppingcartModel> getCart(String cid,String eid,String gid);
    List<ShoppingcartModel> getCidEid(String cid);
    List<ShoppingcartModel> getCidEidGid(String cid,String eid);
    void deleteCart(String cid,String eid,String gid);
    void deleteCartAll(String cid);
}
