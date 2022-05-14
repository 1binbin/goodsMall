package com.entity;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-19:17
 * @Description
 */
public class EmployeeModel {
    private String eid;
    private String epassword;
    private String eaddress;
    private String esex;
    private String ename;
    private String estorename;
    private String phone;

    public EmployeeModel() {
    }

    public EmployeeModel(String eid, String epassword, String eaddress, String esex, String ename, String estorename, String phone) {
        this.eid = eid;
        this.epassword = epassword;
        this.eaddress = eaddress;
        this.esex = esex;
        this.ename = ename;
        this.estorename = estorename;
        this.phone = phone;
    }

    public String getEaddress() {
        return eaddress;
    }

    public void setEaddress(String eaddress) {
        this.eaddress = eaddress;
    }

    public String getEsex() {
        return esex;
    }

    public void setEsex(String esex) {
        this.esex = esex;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEstorename() {
        return estorename;
    }

    public void setEstorename(String estorename) {
        this.estorename = estorename;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
