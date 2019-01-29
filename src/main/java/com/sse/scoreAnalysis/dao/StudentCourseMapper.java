package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.StudentCourse;
import com.sse.scoreAnalysis.model.StudentCourseExample;
import com.sse.scoreAnalysis.model.StudentCourseKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentCourseMapper {
    long countByExample(StudentCourseExample example);

    int deleteByExample(StudentCourseExample example);

    int deleteByPrimaryKey(StudentCourseKey key);

    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);

    List<StudentCourse> selectByExample(StudentCourseExample example);

    StudentCourse selectByPrimaryKey(StudentCourseKey key);

    int updateByExampleSelective(@Param("record") StudentCourse record, @Param("example") StudentCourseExample example);

    int updateByExample(@Param("record") StudentCourse record, @Param("example") StudentCourseExample example);

    int updateByPrimaryKeySelective(StudentCourse record);

    int updateByPrimaryKey(StudentCourse record);
}