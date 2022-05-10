package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:17
 * @Description
 */
public class EmployeeModel {
    private String eid;
    private String epassword;
    private String erole;

    public EmployeeModel() {
    }


    public EmployeeModel(String eid, String epassword,  String erole) {
        this.eid = eid;
        this.epassword = epassword;
        this.erole = erole;
    }


    public String getErole() {
        return erole;
    }

    public void setErole(String erole) {
        this.erole = erole;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getEpassword() {
        return epassword;
    }

    public void setEpassword(String epassword) {
        this.epassword = epassword;
    }
}
