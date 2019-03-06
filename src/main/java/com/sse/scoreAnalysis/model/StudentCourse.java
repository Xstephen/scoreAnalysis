package com.sse.scoreAnalysis.model;

public class StudentCourse extends StudentCourseKey {
    private Integer score;

    private Integer studentrank;

    private Integer flag;

    private Integer great;

    private Integer first;

    private Integer pass;
    //查询学生某个课程成绩时将课程信息也查询出来
    private Course course;

    //通过课程信息查询学生课程时，将学生信息也查询出来
    private Student student;

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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getPass() {
        return pass;
    }

    public void setPass(Integer pass) {
        this.pass = pass;
    }

    public Integer getFirst() {
        return first;
    }

    public void setFirst(Integer first) {
        this.first = first;
    }
}