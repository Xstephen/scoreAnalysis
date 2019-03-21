package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.Student;
import com.sse.scoreAnalysis.model.StudentAnalysis;
import com.sse.scoreAnalysis.model.StudentCourse;

import java.util.List;

public interface StudentAnalysisService {
    List<StudentAnalysis> getAllAnalysis(String studentId);

    List<StudentAnalysis> getTermStudentAnalysisInStudentIdList(List<String> studentIdList, String year, String term);

    List<StudentAnalysis> getYearStudentAnalysisInStudentIdList(List<String> studentIdList, String year);

    List<StudentAnalysis> getYearTerm(String collegeId, String majorId, String grade,String year);

    List<StudentAnalysis> getYear(String collegeId, String majorId, String grade);

    List<StudentAnalysis> getStudentAnalysisByCondition(String collegeid, String majorid, String grade, String studyYear, String term,String searchCondition);

    List<StudentAnalysis> getStudentAnalysisHaveFailByTerm(String collegeId, String majorId, String grade, String year, String term);

    List<StudentAnalysis> getStudentAnalysisAscByTerm(String collegeId, String majorId, String grade, String year, String term);

}
