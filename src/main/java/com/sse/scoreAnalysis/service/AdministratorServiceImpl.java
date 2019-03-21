package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.AdministratorMapper;
import com.sse.scoreAnalysis.dao.CollegeAnalysisMapper;
import com.sse.scoreAnalysis.model.Administrator;
import com.sse.scoreAnalysis.model.CollegeAnalysis;
import com.sse.scoreAnalysis.model.CollegeAnalysisExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdministratorServiceImpl implements AdministratorService {
    @Autowired
    AdministratorMapper administratorMapper;
    @Override
    public Administrator getAdministratorInfo(String administratorId) {
        return administratorMapper.selectByPrimaryKey(administratorId);
    }
}
