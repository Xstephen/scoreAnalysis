package com.sse.scoreAnalysis.model;

public class Counselor {
    private String counselorid;

    private String password;

    private String counselorname;

    private String collegeid;

    private String majorid;

    private College college;

    public String getCounselorid() {
        return counselorid;
    }

    public void setCounselorid(String counselorid) {
        this.counselorid = counselorid == null ? null : counselorid.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getCounselorname() {
        return counselorname;
    }

    public void setCounselorname(String counselorname) {
        this.counselorname = counselorname == null ? null : counselorname.trim();
    }

    public String getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(String collegeid) {
        this.collegeid = collegeid == null ? null : collegeid.trim();
    }

    public String getMajorid() {
        return majorid;
    }

    public void setMajorid(String majorid) {
        this.majorid = majorid == null ? null : majorid.trim();
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }
}