package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.CollegeCourseKey;
import com.sse.scoreAnalysis.model.StudentCourse;

import java.util.List;

public interface StudentCourseService {
    List<StudentCourse> getAllStudentCourseList(String studentId);

    List<StudentCourse> getYearTermInStudentIdList(List<String> studentIdList);

    List<StudentCourse> getYearInStudentIdList(List<String> studentIdList);

    List<StudentCourse> getStudentCourseByCourse(String collegeid,String majorid,String courseid,String year,Integer term,List<String> studentIdList);

    List<StudentCourse> getReexamineInfo(CollegeCourseKey collegeCourseKey, String studentId);
}
