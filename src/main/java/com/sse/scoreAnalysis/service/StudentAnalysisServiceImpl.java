package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.StudentAnalysisMapper;
import com.sse.scoreAnalysis.model.StudentAnalysis;
import com.sse.scoreAnalysis.model.StudentAnalysisExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentAnalysisServiceImpl implements StudentAnalysisService {
    @Autowired
    StudentAnalysisMapper studentAnalysisMapper;
    @Override
    public List<StudentAnalysis> getAllAnalysis(String studentId) {
        StudentAnalysisExample studentAnalysisExample=new StudentAnalysisExample();
        StudentAnalysisExample.Criteria criteria=studentAnalysisExample.createCriteria();
        criteria.andStudentidEqualTo(studentId);
        return studentAnalysisMapper.selectByExample(studentAnalysisExample);
    }

    @Override
    public List<StudentAnalysis> getTermStudentAnalysisInStudentIdList(List<String> studentIdList,String year,String term) {
        StudentAnalysisExample studentAnalysisExample=new StudentAnalysisExample();
        StudentAnalysisExample.Criteria criteria=studentAnalysisExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        criteria.andYearEqualTo(year);
        criteria.andTermEqualTo(Integer.valueOf(term));
        return studentAnalysisMapper.selectByExampleWithStudentInfo(studentAnalysisExample);
    }

    @Override
    public List<StudentAnalysis> getYearStudentAnalysisInStudentIdList(List<String> studentIdList, String year) {
        StudentAnalysisExample studentAnalysisExample=new StudentAnalysisExample();
        StudentAnalysisExample.Criteria criteria=studentAnalysisExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        criteria.andYearEqualTo(year);
        criteria.andTermEqualTo(Integer.valueOf(0));
        return studentAnalysisMapper.selectByExampleWithStudentInfo(studentAnalysisExample);
    }
}
