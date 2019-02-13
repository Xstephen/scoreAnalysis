package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.StudentCourse;

import java.util.List;

public interface StudentCourseService {
    List<StudentCourse> getAllStudentCourseList(String studentId);
}
