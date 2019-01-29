package com.sse.scoreAnalysis.model;

public class Class {
    private String classid;

    private Integer grade;

    private String collegeid;

    private String majorid;

    private String counselorid;

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid == null ? null : classid.trim();
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
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

    public String getCounselorid() {
        return counselorid;
    }

    public void setCounselorid(String counselorid) {
        this.counselorid = counselorid == null ? null : counselorid.trim();
    }
}