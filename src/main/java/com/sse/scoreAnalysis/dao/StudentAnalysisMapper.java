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

    int updateByExampleSelective(@Param("record") StudentAnalysis record, @Param("example") StudentAnalysisExample example);

    int updateByExample(@Param("record") StudentAnalysis record, @Param("example") StudentAnalysisExample example);

    int updateByPrimaryKeySelective(StudentAnalysis record);

    int updateByPrimaryKey(StudentAnalysis record);
}