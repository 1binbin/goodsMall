package com.business;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-16:09
 * @Description
 */
public class EBofactory {
    public static GoodsEbiEmpl getgoodsebiempl(){
        return new GoodsEbiEmpl();
    }
    public static EmployeeEbiempl getemployeeebiempl(){
        return new EmployeeEbiempl();
    }
    public static CustomerEbimpl getcustomerebiempl(){
        return new CustomerEbimpl();
    }
    public static CountEbiEmpl getCountbiempl(){
        return new CountEbiEmpl();
    }
    public static ShoppingcartEmpl getShoppingcartempl(){
        return new ShoppingcartEmpl();
    }
    public  static  otherEbimpl getotherEbimpl(){
        return new otherEbimpl();
    }
}