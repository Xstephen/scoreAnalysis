package com.sse.scoreAnalysis.dao;

import com.sse.scoreAnalysis.model.Administrator;
import com.sse.scoreAnalysis.model.AdministratorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdministratorMapper {
    long countByExample(AdministratorExample example);

    int deleteByExample(AdministratorExample example);

    int deleteByPrimaryKey(String adminid);

    int insert(Administrator record);

    int insertSelective(Administrator record);

    List<Administrator> selectByExample(AdministratorExample example);

    Administrator selectByPrimaryKey(String adminid);

    int updateByExampleSelective(@Param("record") Administrator record, @Param("example") AdministratorExample example);

    int updateByExample(@Param("record") Administrator record, @Param("example") AdministratorExample example);

    int updateByPrimaryKeySelective(Administrator record);

    int updateByPrimaryKey(Administrator record);
}