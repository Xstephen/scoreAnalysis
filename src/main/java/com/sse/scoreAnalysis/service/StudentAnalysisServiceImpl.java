package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.StudentAnalysisMapper;
import com.sse.scoreAnalysis.model.Student;
import com.sse.scoreAnalysis.model.StudentAnalysis;
import com.sse.scoreAnalysis.model.StudentAnalysisExample;
import com.sse.scoreAnalysis.model.StudentCourse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentAnalysisServiceImpl implements StudentAnalysisService {
    @Autowired
    StudentAnalysisMapper studentAnalysisMapper;

    @Override
    public List<StudentAnalysis> getAllAnalysis(String studentId) {
        StudentAnalysisExample studentAnalysisExample = new StudentAnalysisExample();
        StudentAnalysisExample.Criteria criteria = studentAnalysisExample.createCriteria();
        criteria.andStudentidEqualTo(studentId);
        return studentAnalysisMapper.selectByExample(studentAnalysisExample);
    }

    @Override
    public List<StudentAnalysis> getTermStudentAnalysisInStudentIdList(List<String> studentIdList, String year, String term) {
        StudentAnalysisExample studentAnalysisExample = new StudentAnalysisExample();
        StudentAnalysisExample.Criteria criteria = studentAnalysisExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        criteria.andYearEqualTo(year);
        criteria.andTermEqualTo(Integer.valueOf(term));
        return studentAnalysisMapper.selectByExampleWithStudentInfo(studentAnalysisExample);
    }

    @Override
    public List<StudentAnalysis> getYearStudentAnalysisInStudentIdList(List<String> studentIdList, String year) {
        StudentAnalysisExample studentAnalysisExample = new StudentAnalysisExample();
        StudentAnalysisExample.Criteria criteria = studentAnalysisExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        criteria.andYearEqualTo(year);
        criteria.andTermEqualTo(Integer.valueOf(0));
        return studentAnalysisMapper.selectByExampleWithStudentInfo(studentAnalysisExample);
    }

    @Override
    public List<StudentAnalysis> getYearTerm(String collegeId, String majorId, String grade, String year) {
        return studentAnalysisMapper.selectYearTermByCondition(collegeId, majorId, grade, year);
    }

    @Override
    public List<StudentAnalysis> getYear(String collegeId, String majorId, String grade) {
        return studentAnalysisMapper.selectYearByCondition(collegeId, majorId, grade);
    }

    @Override
    public List<StudentAnalysis> getStudentAnalysisByCondition(String collegeid, String majorid, String grade, String studyYear, String term,String searchCondition) {
        return studentAnalysisMapper.selectStudentAnalysisByCondition(collegeid, majorid, grade, studyYear, term,searchCondition);
    }

    @Override
    public List<StudentAnalysis> getStudentAnalysisHaveFailByTerm(String collegeId, String majorId, String grade, String year, String term) {
        return studentAnalysisMapper.selectStudentAnalysisByConditionFail(collegeId, majorId, grade, year, term);
    }

    @Override
    public List<StudentAnalysis> getStudentAnalysisAscByTerm(String collegeId, String majorId, String grade, String year, String term) {
        return studentAnalysisMapper.selectStudentAnalysisByConditionAsc(collegeId, majorId, grade, year, term);
    }
}
