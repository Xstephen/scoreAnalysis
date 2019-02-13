package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.StudentAnalysis;

import java.util.List;

public interface StudentAnalysisService {
    List<StudentAnalysis> getAllAnalysis(String studentId);
}
