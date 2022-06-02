package com.business.businessimplement;

import com.entity.CustomerModel;

/**
 * @Author hongxiaobin
 * @Time 2022/5/14-11:06
 */
public interface CustomerEbi {
    boolean login(CustomerModel customerModel);

    boolean insertCustomer(CustomerModel customerModel);

    boolean updateCustomer(CustomerModel customerModel);
}
