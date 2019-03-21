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

    List<StudentCourse> selectByExampleWithCourse(StudentCourseExample example);

    List<StudentCourse> selectByExampleWithStudent(StudentCourseExample example);

    StudentCourse selectByPrimaryKeyWithCourse(StudentCourseKey key);

    List<StudentCourse> selectYearTermByExample(StudentCourseExample example);

    List<StudentCourse> selectYearByExample(StudentCourseExample example);

    List<StudentCourse> selectYearTermInStudents(@Param("collegeid") String collegeId, @Param("majorid") String majorId, @Param("grade") String grade);

    List<StudentCourse> selectStudentCourseByCourseInGrade(@Param("collegeid") String collegeid, @Param("majorid")String majorid, @Param("courseid")String courseid, @Param("year")String year, @Param("term")Integer term, @Param("grade")String grade);

    int updateByExampleSelective(@Param("record") StudentCourse record, @Param("example") StudentCourseExample example);

    int updateByExample(@Param("record") StudentCourse record, @Param("example") StudentCourseExample example);

    int updateByPrimaryKeySelective(StudentCourse record);

    int updateByPrimaryKey(StudentCourse record);

}