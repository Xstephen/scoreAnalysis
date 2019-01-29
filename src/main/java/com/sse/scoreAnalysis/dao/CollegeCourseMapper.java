package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.CollegeCourse;
import com.sse.scoreAnalysis.model.CollegeCourseExample;
import com.sse.scoreAnalysis.model.CollegeCourseKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollegeCourseMapper {
    long countByExample(CollegeCourseExample example);

    int deleteByExample(CollegeCourseExample example);

    int deleteByPrimaryKey(CollegeCourseKey key);

    int insert(CollegeCourse record);

    int insertSelective(CollegeCourse record);

    List<CollegeCourse> selectByExample(CollegeCourseExample example);

    CollegeCourse selectByPrimaryKey(CollegeCourseKey key);

    int updateByExampleSelective(@Param("record") CollegeCourse record, @Param("example") CollegeCourseExample example);

    int updateByExample(@Param("record") CollegeCourse record, @Param("example") CollegeCourseExample example);

    int updateByPrimaryKeySelective(CollegeCourse record);

    int updateByPrimaryKey(CollegeCourse record);
}