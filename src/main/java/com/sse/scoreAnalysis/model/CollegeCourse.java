package com.sse.scoreAnalysis.model;

public class CollegeCourse extends CollegeCourseKey {
    private Integer maxscore;

    private Integer minscore;

    private Integer mean;

    private Integer median;

    private Integer studentnum;

    private Integer failurenum;


    //查询学生某个课程成绩时将课程信息也查询出来
    private Course course;

    public Integer getMaxscore() {
        return maxscore;
    }

    public void setMaxscore(Integer maxscore) {
        this.maxscore = maxscore;
    }

    public Integer getMinscore() {
        return minscore;
    }

    public void setMinscore(Integer minscore) {
        this.minscore = minscore;
    }

    public Integer getMean() {
        return mean;
    }

    public void setMean(Integer mean) {
        this.mean = mean;
    }

    public Integer getMedian() {
        return median;
    }

    public void setMedian(Integer median) {
        this.median = median;
    }

    public Integer getStudentnum() {
        return studentnum;
    }

    public void setStudentnum(Integer studentnum) {
        this.studentnum = studentnum;
    }

    public Integer getFailurenum() {
        return failurenum;
    }

    public void setFailurenum(Integer failurenum) {
        this.failurenum = failurenum;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}