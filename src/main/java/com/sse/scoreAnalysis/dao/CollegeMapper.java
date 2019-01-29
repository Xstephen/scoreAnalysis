package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.College;
import com.sse.scoreAnalysis.model.CollegeExample;
import com.sse.scoreAnalysis.model.CollegeKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollegeMapper {
    long countByExample(CollegeExample example);

    int deleteByExample(CollegeExample example);

    int deleteByPrimaryKey(CollegeKey key);

    int insert(College record);

    int insertSelective(College record);

    List<College> selectByExample(CollegeExample example);

    College selectByPrimaryKey(CollegeKey key);

    int updateByExampleSelective(@Param("record") College record, @Param("example") CollegeExample example);

    int updateByExample(@Param("record") College record, @Param("example") CollegeExample example);

    int updateByPrimaryKeySelective(College record);

    int updateByPrimaryKey(College record);
}