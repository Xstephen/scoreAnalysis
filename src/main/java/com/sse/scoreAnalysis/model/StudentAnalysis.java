package com.sse.scoreAnalysis.model;

public class StudentAnalysis {
    private Integer id;

    private String year;

    private Integer term;

    private Double weightscore;

    private Integer studentrank;

    private Integer failurenum;

    private Integer scorechange;

    private String studentid;

    private Student student;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Double getWeightscore() {
        return weightscore;
    }

    public void setWeightscore(Double weightscore) {
        this.weightscore = weightscore;
    }

    public Integer getStudentrank() {
        return studentrank;
    }

    public void setStudentrank(Integer studentrank) {
        this.studentrank = studentrank;
    }

    public Integer getFailurenum() {
        return failurenum;
    }

    public void setFailurenum(Integer failurenum) {
        this.failurenum = failurenum;
    }

    public Integer getScorechange() {
        return scorechange;
    }

    public void setScorechange(Integer scorechange) {
        this.scorechange = scorechange;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}