package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.StudentAnalysis;

import java.util.List;

public interface StudentAnalysisService {
    List<StudentAnalysis> getAllAnalysis(String studentId);
    List<StudentAnalysis> getTermStudentAnalysisInStudentIdList(List<String> studentIdList,String year,String term);
    List<StudentAnalysis> getYearStudentAnalysisInStudentIdList(List<String> studentIdList,String year);
}
