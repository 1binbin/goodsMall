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
}