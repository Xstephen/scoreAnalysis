package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.Student;

public interface StudentService {
    Student getStudentInfo(String studentId);
    int getStudentNumByClass(String classId);
    //获得同专业同年级学生数量
    int getStudentNumInSameMajor(String classId);
}
