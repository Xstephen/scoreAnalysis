package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.PredictScore;
import com.sse.scoreAnalysis.model.Student;

import java.util.List;

public interface PredictScoreService {
    List<Student> getPredictInStudentList(List<String> studentIdList);

    List<PredictScore> getPredictInfo(String studentId);

}
