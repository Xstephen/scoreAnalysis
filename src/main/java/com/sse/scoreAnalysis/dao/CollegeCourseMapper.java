package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.College;
import com.sse.scoreAnalysis.model.CollegeCourse;
import com.sse.scoreAnalysis.model.CollegeCourseExample;
import com.sse.scoreAnalysis.model.CollegeCourseKey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CollegeCourseMapper {
    long countByExample(CollegeCourseExample example);

    int deleteByExample(CollegeCourseExample example);

    int deleteByPrimaryKey(CollegeCourseKey key);

    int insert(CollegeCourse record);

    int insertSelective(CollegeCourse record);

    List<CollegeCourse> selectByExample(CollegeCourseExample example);

    CollegeCourse selectByPrimaryKey(CollegeCourseKey key);

    CollegeCourse selectByPrimaryKeyWithCourse(CollegeCourseKey key);

    List<CollegeCourse> selectCourseInfoInStudentIdList(@Param("loginYear") String loginYear, @Param("studentIdList") List<String> studentIdList);

    List<Map<CollegeCourseKey, Object>> selectCourseInfoInStudentIdListWithNotPass(@Param("loginYear") String loginYear, @Param("studentIdList") List<String> studentIdList);

    List<CollegeCourse> selectCollegeCourseInMajor(@Param("collegeid") String collegeId, @Param("majorid") String majorId, @Param("year") String year, @Param("condition") String condition);

    List<CollegeCourse> selectCollegeCourseInGrade(@Param("collegeid") String collegeId, @Param("majorid") String majorId, @Param("grade") String grade, @Param("year") String year, @Param("term") String term, @Param("condition") String condition);

    int updateByExampleSelective(@Param("record") CollegeCourse record, @Param("example") CollegeCourseExample example);

    int updateByExample(@Param("record") CollegeCourse record, @Param("example") CollegeCourseExample example);

    int updateByPrimaryKeySelective(CollegeCourse record);

    int updateByPrimaryKey(CollegeCourse record);

}