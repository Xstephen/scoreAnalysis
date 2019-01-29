package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.Counselor;
import com.sse.scoreAnalysis.model.CounselorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CounselorMapper {
    long countByExample(CounselorExample example);

    int deleteByExample(CounselorExample example);

    int deleteByPrimaryKey(String counselorid);

    int insert(Counselor record);

    int insertSelective(Counselor record);

    List<Counselor> selectByExample(CounselorExample example);

    Counselor selectByPrimaryKey(String counselorid);

    int updateByExampleSelective(@Param("record") Counselor record, @Param("example") CounselorExample example);

    int updateByExample(@Param("record") Counselor record, @Param("example") CounselorExample example);

    int updateByPrimaryKeySelective(Counselor record);

    int updateByPrimaryKey(Counselor record);
}