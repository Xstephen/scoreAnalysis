package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.StudentAnalysis;
import com.sse.scoreAnalysis.model.StudentAnalysisExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface StudentAnalysisMapper {
    long countByExample(StudentAnalysisExample example);

    int deleteByExample(StudentAnalysisExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(StudentAnalysis record);

    int insertSelective(StudentAnalysis record);

    List<StudentAnalysis> selectByExample(StudentAnalysisExample example);

    StudentAnalysis selectByPrimaryKey(Integer id);

    List<StudentAnalysis> selectByExampleWithStudentInfo(StudentAnalysisExample example);

    StudentAnalysis selectByPrimaryKeyWithStudentInfo(Integer id);

    List<StudentAnalysis> selectYearTermByCondition(@Param("collegeid") String collegeid, @Param("majorid") String majorid, @Param("grade") String grade, @Param("year") String year);

    List<StudentAnalysis> selectYearByCondition(@Param("collegeid") String collegeid, @Param("majorid") String majorid, @Param("grade") String grade);

    List<StudentAnalysis> selectStudentAnalysisByCondition(@Param("collegeid") String collegeid, @Param("majorid") String majorid, @Param("grade") String grade, @Param("year") String studyYear, @Param("term") String term, @Param("condition") String searchCondition);

    List<StudentAnalysis> selectStudentAnalysisByConditionFail(@Param("collegeid") String collegeid, @Param("majorid") String majorid, @Param("grade") String grade, @Param("year") String year, @Param("term") String term);

    List<StudentAnalysis> selectStudentAnalysisByConditionAsc(@Param("collegeid") String collegeid, @Param("majorid") String majorid, @Param("grade") String grade, @Param("year") String year, @Param("term") String term);

//    List<StudentAnalysis> selectYearByCondition();

    int updateByExampleSelective(@Param("record") StudentAnalysis record, @Param("example") StudentAnalysisExample example);

    int updateByExample(@Param("record") StudentAnalysis record, @Param("example") StudentAnalysisExample example);

    int updateByPrimaryKeySelective(StudentAnalysis record);

    int updateByPrimaryKey(StudentAnalysis record);

}