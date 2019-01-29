package com.sse.scoreAnalysis.model;

public class Student {
    private String studentid;

    private String password;

    private String studentname;

    private Integer studentrank;

    private Integer failuresum;

    private Double weightscore;

    private String classid;

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname == null ? null : studentname.trim();
    }

    public Integer getStudentrank() {
        return studentrank;
    }

    public void setStudentrank(Integer studentrank) {
        this.studentrank = studentrank;
    }

    public Integer getFailuresum() {
        return failuresum;
    }

    public void setFailuresum(Integer failuresum) {
        this.failuresum = failuresum;
    }

    public Double getWeightscore() {
        return weightscore;
    }

    public void setWeightscore(Double weightscore) {
        this.weightscore = weightscore;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid == null ? null : classid.trim();
    }
}