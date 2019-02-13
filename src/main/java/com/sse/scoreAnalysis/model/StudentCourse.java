package com.sse.scoreAnalysis.model;

public class StudentCourse extends StudentCourseKey {
    private Integer score;

    private Integer studentrank;

    private Integer flag;

    private Integer great;
    //查询学生某个课程成绩时将课程信息也查询出来
    private Course course;

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getStudentrank() {
        return studentrank;
    }

    public void setStudentrank(Integer studentrank) {
        this.studentrank = studentrank;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getGreat() {
        return great;
    }

    public void setGreat(Integer great) {
        this.great = great;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}