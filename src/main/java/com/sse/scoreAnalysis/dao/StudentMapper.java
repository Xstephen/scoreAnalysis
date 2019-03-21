package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.Student;
import com.sse.scoreAnalysis.model.StudentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(String studentid);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectJoinByCondition(@Param("collegeid")String collegeid,@Param("majorid")String majorid,@Param("grade")String grade,@Param("year")String year,@Param("condition")String condition);

    List<Student> selectJoinByConditionWithFail(@Param("collegeid")String collegeid,@Param("majorid")String majorid,@Param("grade")String grade);

    List<Student> selectJoinByConditionAsc(@Param("collegeid")String collegeid,@Param("majorid")String majorid,@Param("grade")String grade);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(String studentid);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

}